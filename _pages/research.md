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
      <article class="research-program-card">
        <span class="research-program-index">01</span>
        <h3>Neuromorphic Intelligence</h3>
        <p>
          Spiking neural networks, brain-inspired learning theory, visual
          perception, and efficient intelligent systems.
        </p>
        <ul>
          <li><strong>Learning and models:</strong> SpikeZIP-TF, BKDSNN, CRNN-SNN conversion, and deterministic continuous-time neuromorphic systems.</li>
          <li><strong>Architecture evidence:</strong> ELSA for elastic SNN inference and BiNeuroRAM for ReRAM-based bipolar SNN acceleration.</li>
          <li><strong>Perception workloads:</strong> VISTREAM for efficient visual perception streaming.</li>
        </ul>
        <div class="research-program-links">
          <a href="{{ '/research/algorithm/' | relative_url }}">Algorithm</a>
          <a href="{{ '/research/arch-and-circuit/' | relative_url }}">Architecture &amp; Circuit</a>
        </div>
      </article>

      <article class="research-program-card">
        <span class="research-program-index">02</span>
        <h3>Processing-in-Memory Systems</h3>
        <p>
          Near-memory acceleration, SRAM/ReRAM-based PIM, data-centric
          architecture, and compiler support.
        </p>
        <ul>
          <li><strong>Near-data processing:</strong> NasZip for DIMM-based approximate nearest-neighbor search.</li>
          <li><strong>SRAM/cache PIM:</strong> PolymorPIC, APU, PICK, VSPIM, GIM, and PIMGCN for AI and spatial workloads.</li>
          <li><strong>Compiler support:</strong> PIMLC, MASIM, and logic compilers for in-memory SIMD computation.</li>
        </ul>
        <div class="research-program-links">
          <a href="{{ '/research/arch-and-circuit/' | relative_url }}">Architecture &amp; Circuit</a>
          <a href="{{ '/research/device/' | relative_url }}">Device</a>
        </div>
      </article>

      <article class="research-program-card">
        <span class="research-program-index">03</span>
        <h3>AI for EDA and Chip Design</h3>
        <p>
          Machine-learning-assisted EDA, LLM-based Verilog generation, logic
          synthesis, and design automation.
        </p>
        <ul>
          <li><strong>LLM for hardware design:</strong> HaVen and VeriRL for HDL-engineer-aligned Verilog generation.</li>
          <li><strong>Logic synthesis:</strong> GPT-LS, ERL-LS, and decision-transformer-based synthesis optimization.</li>
          <li><strong>EDA toolchains:</strong> synthesis and scheduling co-design for in-memory SIMD computation.</li>
        </ul>
        <div class="research-program-links">
          <a href="{{ '/research/arch-and-circuit/' | relative_url }}">Architecture &amp; Circuit</a>
          <a href="{{ '/publications/' | relative_url }}">Publications</a>
        </div>
      </article>

      <article class="research-program-card">
        <span class="research-program-index">04</span>
        <h3>Efficient and Secure AI</h3>
        <p>
          Model compression, dynamic inference, adversarial robustness, privacy,
          and trustworthy deployment.
        </p>
        <ul>
          <li><strong>Efficiency:</strong> dynamic inference, quantization, pruning, consistency models, and accelerator-aware model design.</li>
          <li><strong>Security:</strong> bit-flip attacks and defenses, model extraction, split federated learning, and IP protection.</li>
          <li><strong>Deployment:</strong> VISTREAM, Seele, Splatonic, and StreamGrid for efficient visual and spatial AI workloads.</li>
        </ul>
        <div class="research-program-links">
          <a href="{{ '/research/algorithm/' | relative_url }}">Algorithm</a>
          <a href="{{ '/research/arch-and-circuit/' | relative_url }}">Architecture &amp; Circuit</a>
        </div>
      </article>

      <article class="research-program-card">
        <span class="research-program-index">05</span>
        <h3>Emerging Devices and Silicon</h3>
        <p>
          Post-CMOS devices, device-aware computing, neuromorphic circuits, and
          chip prototype validation.
        </p>
        <ul>
          <li><strong>Device foundations:</strong> ReRAM, MRAM, spintronic devices, MoS2 neurons, and monolithic 3D integration.</li>
          <li><strong>Device-aware systems:</strong> BiNeuroRAM, ReRAM non-ideal adaptation, variation-aware mapping, and PIM accelerators.</li>
          <li><strong>Silicon path:</strong> chip and system prototypes that validate architecture-to-device co-design.</li>
        </ul>
        <div class="research-program-links">
          <a href="{{ '/research/device/' | relative_url }}">Device</a>
          <a href="{{ '/research/arch-and-circuit/' | relative_url }}">Architecture &amp; Circuit</a>
        </div>
      </article>
    </div>
  </section>

  <section class="research-evidence" markdown="0">
    <div class="research-section-head">
      <p class="home-kicker">Recent Signals</p>
      <h2>Representative publication clusters</h2>
    </div>
    <div class="research-evidence-grid">
      <div>
        <span>Neuromorphic Intelligence</span>
        <h3>ISCA, CVPR, ICML, and ECCV results</h3>
        <p>ELSA, VISTREAM, SpikeZIP-TF, and BKDSNN connect SNN theory, perception workloads, and neuromorphic systems.</p>
      </div>
      <div>
        <span>Processing-in-Memory Systems</span>
        <h3>ISCA, MICRO, TCAD, and DAC results</h3>
        <p>NasZip, PolymorPIC, APU, PICK, and BiNeuroRAM connect processor, SRAM/ReRAM, and workload co-design.</p>
      </div>
      <div>
        <span>AI for EDA and Chip Design</span>
        <h3>ICCAD, DATE, ISEDA, and IWLS results</h3>
        <p>HaVen, VeriRL, GPT-LS, ERL-LS, and in-memory SIMD compilers turn AI into practical design workflows.</p>
      </div>
      <div>
        <span>Efficient and Secure AI</span>
        <h3>CVPR, ICCV, TPAMI, DAC, and TCAD results</h3>
        <p>Work on dynamic inference, quantization, pruning, consistency models, bit-flip attacks, and secure deployment.</p>
      </div>
      <div>
        <span>Emerging Devices and Silicon</span>
        <h3>Device-to-architecture prototypes</h3>
        <p>ReRAM, MRAM, spintronic devices, MoS2 neurons, and chip prototypes support device-aware computing systems.</p>
      </div>
    </div>
  </section>
</div>
