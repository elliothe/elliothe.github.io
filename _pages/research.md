---
title: Research
layout: default
excerpt: "ICRG -- Research"
sitemap: false
permalink: /research/
---

<div class="research-page">
  <section class="research-hero" markdown="0">
    <div>
      <p class="home-kicker">Research Overview</p>
      <h1>Computing foundations for AI that can perceive, decide, and act</h1>
      <p>
        ICRG studies the algorithms, software systems, architectures, circuits,
        and devices needed to make AI workloads efficient, reliable, and
        deployable. Our publications connect event-driven intelligence,
        data-centric memory systems, spatial AI acceleration, AI-assisted chip
        design, and emerging-device prototypes.
      </p>
      <div class="research-hero-actions">
        <a class="home-button home-button-primary" href="{{ '/publications/' | relative_url }}">View Publications</a>
        <a class="home-button research-button-secondary" href="{{ '/vacancies' | relative_url }}">Join ICRG</a>
      </div>
    </div>
    <div class="research-visual-stack research-visual-featured" aria-label="Research images">
      <figure class="research-visual-frame research-visual-primary">
        <img src="{{ '/images/research/elsa-arch.png' | relative_url }}" alt="ELSA elastic SNN inference architecture" />
        <figcaption>ELSA elastic SNN inference architecture</figcaption>
      </figure>
      <figure class="research-visual-frame research-visual-secondary">
        <img src="{{ '/images/research/die_photo3.jpg' | relative_url }}" alt="ICRG chip die photo" />
        <figcaption>Architecture to silicon validation</figcaption>
      </figure>
    </div>
  </section>

  <section class="research-route-grid" aria-label="Research subpages" markdown="0">
    <a class="research-route-card" href="{{ '/research/algorithm/' | relative_url }}">
      <span>01</span>
      <h2>Algorithm</h2>
      <p>Neuromorphic learning, efficient visual perception, model efficiency, and trustworthy AI.</p>
    </a>
    <a class="research-route-card" href="{{ '/research/arch-and-circuit/' | relative_url }}">
      <span>02</span>
      <h2>Architecture &amp; Circuit</h2>
      <p>Processing-in/near-memory systems, neuromorphic chips, AI accelerators, and EDA toolchains.</p>
    </a>
    <a class="research-route-card" href="{{ '/research/device/' | relative_url }}">
      <span>03</span>
      <h2>Device</h2>
      <p>ReRAM, MRAM, spintronic devices, and device-aware computing systems beyond CMOS.</p>
    </a>
  </section>

  <section class="research-section" markdown="0">
    <div class="research-section-head">
      <p class="home-kicker">Publication-Backed Programs</p>
      <h2>Five connected research directions</h2>
      <p>
        The directions below follow the same structure as the home page, with
        representative publications grouped under each program.
      </p>
    </div>

    <div class="research-program-grid">
      {% for program in site.data.research_programs %}
      <article class="research-program-card">
        <span class="research-program-index">{{ program.index_label }}</span>
        <h3>{{ program.title }}</h3>
        <p>{{ program.description }}</p>
        {% assign representative_publications = program.representative_publications %}
        {% if representative_publications.size > 0 %}
        <ul>
          {% for publication in representative_publications %}
          <li><strong>{{ publication.venue_label }}:</strong> {{ publication.short_title }}</li>
          {% endfor %}
        </ul>
        {% endif %}
        <div class="research-program-links">
          {% for link in program.links %}
          <a href="{{ link.url | relative_url }}">{{ link.label }}</a>
          {% endfor %}
        </div>
      </article>
      {% endfor %}
    </div>
  </section>

  <section class="research-evidence" markdown="0">
    <div class="research-section-head">
      <p class="home-kicker">Recent Signals</p>
      <h2>Representative publication clusters</h2>
    </div>
    <div class="research-evidence-grid">
      {% for program in site.data.research_programs %}
      <div>
        <span>{{ program.title }}</span>
        <h3>{{ program.venue_summary }}</h3>
        <p>{{ program.signal }}</p>
      </div>
      {% endfor %}
    </div>
  </section>
</div>
