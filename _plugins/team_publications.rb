# frozen_string_literal: true

require "bibtex"

module TeamPublications
  module_function

  def clean_name(name)
    name.to_s
        .gsub(/<[^>]+>/, " ")
        .gsub(/&(?:#\d+|#x[0-9a-f]+|[a-z]+);?/i, " ")
        .gsub(/\([^)]*\)/, " ")
        .gsub(/[*=]/, " ")
        .gsub(/[^a-zA-Z0-9]+/, " ")
        .downcase
        .strip
        .squeeze(" ")
  end

  def name_keys(name)
    key = clean_name(name)
    keys = [key]
    parts = key.split

    if parts.length > 2
      family = parts[-1]
      given_parts = parts[0...-1]
      keys << "#{given_parts.join} #{family}"
    end

    keys.uniq.reject(&:empty?)
  end

  def member_names(member)
    names = [member.data["title"]]
    names.concat(Array(member.data["publication_names"]))
    names.compact
  end

  def member_url(member)
    url = member.url.to_s
    return url unless url.empty?

    permalink = member.data["permalink"].to_s
    permalink.start_with?("/") ? permalink : "/#{permalink}"
  end

  def entry_value(entry, field)
    value = entry[field]
    value.nil? ? nil : value.to_s
  end

  def entry_venue(entry)
    entry_value(entry, :journal) || entry_value(entry, :booktitle)
  end

  def entry_link(entry)
    entry_value(entry, :link) ||
      entry_value(entry, :preprint) ||
      entry_value(entry, :doi) ||
      entry_value(entry, :code)
  end

  def publication_hash(entry)
    {
      "key" => entry.key.to_s,
      "title" => entry_value(entry, :title),
      "year" => entry_value(entry, :year),
      "venue" => entry_venue(entry),
      "type" => entry.type.to_s,
      "ccf" => entry_value(entry, :ccf),
      "award" => entry_value(entry, :award),
      "link" => entry_link(entry)
    }
  end

  def author_name(author)
    "#{author.first} #{author.last}"
  end
end

module Jekyll
  class TeamPublicationsGenerator < Generator
    safe true
    priority :low

    def generate(site)
      entries = bibliography_entries(site)
      members = site.posts.docs.select { |doc| doc.data["layout"] == "member" }

      author_links = build_author_links(members)
      publications_by_member = Hash.new { |hash, key| hash[key] = [] }
      seen_by_member = Hash.new { |hash, key| hash[key] = {} }

      entries.each do |entry|
        publication = TeamPublications.publication_hash(entry)

        entry.author.to_a.each do |author|
          member = linked_member(author_links, TeamPublications.author_name(author))
          next unless member

          member_id = member["member_id"]
          next if seen_by_member[member_id][publication["key"]]

          publications_by_member[member_id] << publication
          seen_by_member[member_id][publication["key"]] = true
        end
      end

      publications_by_member.each_value do |publications|
        publications.sort_by! do |publication|
          [-publication["year"].to_i, publication["title"].to_s]
        end
      end

      site.data["team_author_links"] = author_links
      site.data["member_publications"] = build_publication_lookup(members, publications_by_member)
    end

    private

    def bibliography_entries(site)
      scholar = site.config.fetch("scholar", {})
      source = scholar.fetch("source", "_bibliography").to_s.sub(%r{\A\./}, "")
      bibliography = scholar.fetch("bibliography", "references.bib")
      path = File.join(site.source, source, bibliography)

      BibTeX.open(path).entries.values
    end

    def build_author_links(members)
      members.each_with_object({}) do |member, links|
        url = TeamPublications.member_url(member)
        record = {
          "title" => member.data["title"].to_s.strip,
          "url" => url,
          "member_id" => url
        }

        TeamPublications.member_names(member).each do |name|
          TeamPublications.name_keys(name).each do |key|
            links[key] ||= record
          end
        end
      end
    end

    def linked_member(author_links, name)
      TeamPublications.name_keys(name).each do |key|
        member = author_links[key]
        return member if member
      end

      nil
    end

    def build_publication_lookup(members, publications_by_member)
      lookup = {}

      members.each do |member|
        url = TeamPublications.member_url(member)
        publications = publications_by_member[url] || []
        lookup[url] = publications

        permalink = member.data["permalink"].to_s
        next if permalink.empty?

        lookup[permalink] = publications
        lookup["/#{permalink}"] = publications unless permalink.start_with?("/")
      end

      lookup
    end
  end

  module TeamAuthorFilters
    def team_author_keys(name)
      TeamPublications.name_keys(name)
    end
  end
end

Liquid::Template.register_filter(Jekyll::TeamAuthorFilters)
