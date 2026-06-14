# frozen_string_literal: true

require "bibtex"
require "date"

module SiteIntelligence
  module_function

  VENUE_PATTERNS = [
    ["ISCA", /international symposium on computer architecture|isca/i],
    ["MICRO", /microarchitecture|micro-\d+|micro'/i],
    ["HPCA", /high-performance computer architecture|hpca/i],
    ["ASPLOS", /architectural support for programming languages|asplos/i],
    ["DAC", /design automation conference|dac/i],
    ["ICCAD", /international conference on computer-aided design|iccad/i],
    ["DATE", /design, automation and test in europe|date/i],
    ["TCAD", /transactions on computer-aided design|tcad/i],
    ["CVPR", /computer vision and pattern recognition|cvpr/i],
    ["ICCV", /international conference on computer vision|iccv/i],
    ["ECCV", /european conference on computer vision|eccv/i],
    ["ICML", /international conference on machine learning|icml/i],
    ["TPAMI", /transactions on pattern analysis and machine intelligence|tpami/i],
    ["Nature Communications", /nature communications/i],
    ["IWLS", /international workshop on logic & synthesis|iwls/i],
    ["ISEDA", /international symposium of eda|electronic design automation|iseda/i],
    ["ICCD", /international conference on computer design|iccd/i],
    ["FPGA", /international symposium on field-programmable gate arrays|fpga/i],
    ["HOST", /hardware oriented security and trust|host/i],
    ["MobiCom", /mobile computing and networking|mobicom/i],
    ["arXiv", /arxiv/i]
  ].freeze

  CCF_ORDER = { "A" => 0, "B" => 1, "C" => 2 }.freeze

  def clean_text(value)
    value.to_s
         .gsub(/<[^>]+>/, " ")
         .gsub(/&(?:#\d+|#x[0-9a-f]+|[a-z]+);?/i, " ")
         .gsub(/\\textsuperscript\{([^}]*)\}/, '\1')
         .gsub(/[{}]/, "")
         .gsub(/\s+/, " ")
         .strip
  end

  def entry_value(entry, field)
    value = entry[field]
    value.nil? ? nil : clean_text(value)
  end

  def entry_venue(entry)
    entry_value(entry, :booktitle) || entry_value(entry, :journal)
  end

  def short_venue(venue)
    text = venue.to_s
    match = VENUE_PATTERNS.find { |_label, pattern| text.match?(pattern) }
    match ? match.first : clean_text(text).split(/[(']/).first.to_s.strip
  end

  def publication_hash(entry)
    venue = entry_venue(entry)
    title = entry_value(entry, :title)
    year = entry_value(entry, :year).to_i
    short = short_venue(venue)

    {
      "key" => entry.key.to_s,
      "title" => title,
      "short_title" => shorten(title, 112),
      "year" => year,
      "venue" => venue,
      "venue_short" => short,
      "venue_label" => [short, year.positive? ? year : nil].compact.join(" "),
      "ccf" => entry_value(entry, :ccf).to_s.upcase,
      "award" => entry_value(entry, :award),
      "search_text" => [title, entry.key].compact.join(" ").downcase
    }
  end

  def shorten(text, limit)
    clean = clean_text(text)
    return clean if clean.length <= limit

    "#{clean[0, limit].sub(/\s+\S*\z/, "")}..."
  end

  def bibliography_entries(site)
    scholar = site.config.fetch("scholar", {})
    source = scholar.fetch("source", "_bibliography").to_s.sub(%r{\A\./}, "")
    bibliography = scholar.fetch("bibliography", "references.bib")
    path = File.join(site.source, source, bibliography)

    BibTeX.open(path).entries.values
  end

  def normalize_program_id(value)
    value.to_s.downcase.gsub(/[^a-z0-9]+/, "_").gsub(/\A_+|_+\z/, "")
  end

  def explicit_program_ids(entry)
    fields = %i[program programs research_program research_programs research]
    fields.flat_map do |field|
      raw = entry_value(entry, field)
      next [] if raw.to_s.empty?

      raw.split(/[,;|]/).map { |item| normalize_program_id(item) }
    end.uniq
  end

  def match_score(publication, program)
    explicit_ids = publication["explicit_program_ids"]
    program_id = normalize_program_id(program["id"])
    return 100 if explicit_ids.include?(program_id)

    Array(program["publication_terms"]).sum do |term|
      publication["search_text"].include?(term.to_s.downcase) ? 1 : 0
    end
  end

  def publication_sort_key(item)
    publication = item["publication"] || item
    score = item["score"].to_i
    ccf_rank = CCF_ORDER.fetch(publication["ccf"], 9)
    award_rank = publication["award"].to_s.empty? ? 1 : 0
    [-publication["year"].to_i, ccf_rank, award_rank, -score, publication["title"].to_s]
  end

  def ccf_summary(publications)
    %w[A B C].map do |rank|
      {
        "rank" => rank,
        "label" => "CCF-#{rank}",
        "count" => publications.count { |publication| publication["ccf"] == rank },
        "css_class" => "publication-ccf-#{rank.downcase}"
      }
    end
  end

  def join_words(items)
    compact = items.compact.reject(&:empty?).uniq
    case compact.length
    when 0 then "recent venues"
    when 1 then compact.first
    when 2 then compact.join(" and ")
    else "#{compact[0...-1].join(', ')}, and #{compact[-1]}"
    end
  end

  def venue_names(publications, limit)
    venues = publications.map { |publication| publication["venue_short"] }.compact.reject(&:empty?).uniq
    formal = venues.reject { |venue| venue.downcase == "arxiv" }
    selected = formal.empty? ? venues : formal
    selected.first(limit)
  end

  def program_signal(program, publications)
    venues = join_words(venue_names(publications, 4))
    titles = join_words(publications.map { |publication| publication["short_title"] }.first(3))

    {
      "venue_summary" => "#{venues} results",
      "signal" => titles == "recent venues" ? program["description"] : "Representative work includes #{titles}."
    }
  end

  def build_research_programs(program_configs, publications)
    program_configs.each_with_index.map do |program, index|
      matches = publications.map do |publication|
        score = match_score(publication, program)
        next if score <= 0

        { "score" => score, "publication" => publication }
      end.compact.sort_by { |item| publication_sort_key(item) }

      representative = matches.map { |item| item["publication"] }.first(3)
      signal = program_signal(program, representative)

      program.merge(
        "index_label" => format("%02d", index + 1),
        "paper_count" => matches.length,
        "representative_publications" => representative,
        "venue_summary" => signal["venue_summary"],
        "signal" => signal["signal"]
      )
    end
  end

  def parse_news_date(value)
    normalized = value.to_s
                      .gsub(".", "")
                      .gsub("/", " ")
                      .gsub(/\bSept\b/i, "Sep")
                      .strip
    Date.parse(normalized)
  rescue ArgumentError
    Date.new(0)
  end

  def sorted_news(news_items)
    Array(news_items).sort_by { |item| parse_news_date(item["date"]) }.reverse
  end

  def publication_overview(publications)
    latest_year = publications.map { |publication| publication["year"].to_i }.max
    ranked_publications = publications.sort_by { |publication| publication_sort_key(publication) }
    latest_publications = ranked_publications.select { |publication| publication["year"].to_i == latest_year }
    recent_publications = ranked_publications.select { |publication| publication["year"].to_i >= latest_year.to_i - 1 }
    awards = publications.reject { |publication| publication["award"].to_s.empty? }
                         .sort_by { |publication| [-publication["year"].to_i, publication["venue_short"].to_s] }

    {
      "latest_year" => latest_year,
      "latest_year_summary" => "#{latest_publications.length} publications in #{join_words(venue_names(latest_publications, 4))}.",
      "recent_window_label" => "#{latest_year.to_i - 1}-#{latest_year}",
      "recent_venues_summary" => "Recent work appeared in #{join_words(venue_names(recent_publications, 8))}.",
      "award_summary" => awards.empty? ? "Awards and nominations are updated from BibTeX award fields." : "Recent recognition includes #{join_words(awards.first(3).map { |p| "#{p['award']} at #{p['venue_short']} #{p['year']}" })}."
    }
  end
end

module Jekyll
  class SiteIntelligenceGenerator < Generator
    safe true
    priority :normal

    def generate(site)
      raw_entries = SiteIntelligence.bibliography_entries(site)
      publications = raw_entries.map do |entry|
        publication = SiteIntelligence.publication_hash(entry)
        publication["explicit_program_ids"] = SiteIntelligence.explicit_program_ids(entry)
        publication
      end

      publications.sort_by! { |publication| [-publication["year"].to_i, publication["title"].to_s] }

      program_configs = Array(site.data["research_programs"])

      site.data["publication_ccf_summary"] = SiteIntelligence.ccf_summary(publications)
      site.data["publication_overview"] = SiteIntelligence.publication_overview(publications)
      site.data["research_programs"] = SiteIntelligence.build_research_programs(program_configs, publications)
      site.data["latest_news"] = SiteIntelligence.sorted_news(site.data["news"])
    end
  end
end
