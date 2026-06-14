---
title: "Home"
layout: homelay
excerpt: "IRCG"
sitemap: false
permalink: /
---

<section class="home-section home-about" markdown="0">
  <p class="home-kicker">Research Mission</p>
  <h2>Building the computing foundation for AI that can do reliable work</h2>
  <p>
    The <strong>Intelligent Computing Research Group (ICRG)</strong>, led by
    Prof. Zhezhi He at Shanghai Jiao Tong University, studies the computing
    infrastructure needed for AI to move from generating content to understanding,
    deciding, and acting in the real world. To make such systems efficient,
    reliable, and deployable, we co-design neuromorphic and spiking AI,
    processing-in/near-memory architectures, spatial AI accelerators,
    AI-assisted chip design tools, and emerging-device prototypes.
  </p>
</section>

<section class="home-section" markdown="0">
  <div class="home-section-heading">
    <p class="home-kicker">Research Programs</p>
    <h2>Core research directions</h2>
  </div>
  <div class="research-focus-grid">
    {% for program in site.data.research_programs %}
    <a class="research-focus-card" href="{{ program.home_url | relative_url }}">
      <span class="research-focus-index">{{ program.index_label }}</span>
      <h3>{{ program.title }}</h3>
      <p>{{ program.description }}</p>
    </a>
    {% endfor %}
  </div>
</section>

<section class="home-section home-momentum" markdown="0">
  <div class="home-section-heading">
    <p class="home-kicker">Recent Momentum</p>
    <h2>Recent results in top research venues</h2>
  </div>
  <div class="home-highlight-list">
    {% assign publication_overview = site.data.publication_overview %}
    <div class="home-highlight-item">
      <span>{{ publication_overview.latest_year }}</span>
      <p>{{ publication_overview.latest_year_summary }}</p>
    </div>
    <div class="home-highlight-item">
      <span>{{ publication_overview.recent_window_label }}</span>
      <p>{{ publication_overview.recent_venues_summary }}</p>
    </div>
    <div class="home-highlight-item">
      <span>Awards</span>
      <p>{{ publication_overview.award_summary }}</p>
    </div>
  </div>
</section>

<section class="home-section home-recruiting" id="recruitment" markdown="0">
  <div>
    <p class="home-kicker">Join ICRG</p>
    <h2>Open positions for students, researchers, engineers, and interns</h2>
    <p>
      We welcome motivated graduate students, undergraduates, full-time researchers,
      engineers, and interns interested in intelligent computing, AI infrastructure,
      electronic design automation, computer architecture, and neuromorphic chips.
    </p>
    <ul>
      <li>招收2027年秋季入学的博士生1-2名，硕士生1名；优先考虑系统、体系结构、计算机体系结构与类脑芯片方向的同学。</li>
      <li>上海人工智能实验室团队招收全职研究员、全职工程师、实习生，从事类脑计算理论、算法、AI Infra、芯片的研究与开发。</li>
    </ul>
  </div>
  <a class="home-button home-button-primary" href="{{ '/vacancies' | relative_url }}">Vacancies</a>
</section>
