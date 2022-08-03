---
title: Architecture and Circuit
layout: default
excerpt: "ICRG -- Archiitecture and Circuit"
sitemap: false
permalink: /research/arch-and-circuit/
---

# Architecture and Circuit

----

In ICRG, we currently focus on designing brain-inspired computers and tools for cross-layer design and optimization.

----
### Processing-in-Memory (存内计算，存算一体)
<p align="center">
<img src="/images/research_intro/architecture_evolve.png" alt="drawing" width="600"/>
</p>
<p align="center">
    <em>Figure: Computer architectures varying from (a) Conventional Von-Neumann Architecture (b) Processing-Near Memroy (c) Processing-In-Memory, where computation happens where data resides.</em>
</p>

Processing-in-Memory (aka. In-Memory Computing) is a emerging computing architecture that fusing the computing capability into memory module. The conventional Von-Neumman architecture and Processing-in-Memory represents two distinct design methdologies: compute-oriented and data-oriented.
- In compute-oriented conventional architecture: it supports highly abstracted complex but low-parallism operations (ISA level), dedicated high-performance arithmetic-logic unit (micro-architecture level), which prefers the computation with high data-reuse rate. Thus, such architecture can well handle the compute-bound tasks (referring Roofline model);
- In data-oriented processing-in-memory architecture: we visionize it to support simple but highly-parallel operations (ISA level), corespondingly with energy efficient computing unit, for computation with low data-reuse rate. Thus, PIM can well handle the IO-bound tasks. 

In ICRG, our objective is to design **next-generation heterogenous general-purpose processor with processing-in-memory supported**.

----
### Brian-inspired Neuromorphic Computing （脑启发神经模态计算）

----
### Machine Learning Aided Electronics Design Automation (机器学习辅助电子设计自动化)

Electronic Design Automation (EDA)