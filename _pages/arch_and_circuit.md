---
title: Architecture and Circuit
layout: default
excerpt: "ICRG -- Archiitecture and Circuit"
sitemap: false
permalink: /research/arch-and-circuit/
---

# Architecture and Circuit (系统结构与电路)

----

In ICRG, we currently focus on designing brain-inspired computers and tools for cross-layer design and optimization.

<p align="center">
<img src="/images/research_intro/arch_circuit_mindmap.png" alt="drawing" width="800"/>
</p>
<p align="center">
    <em>Figure: Mind map of our research in architecture and circuit.</em>
</p>



----
### 1. Processing-in-Memory (存内计算，存算一体)
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
### 2. Brian-inspired Neuromorphic Computing （脑启发神经模态计算）

Brian-inspired neuromorphic computing is a field of research that focuses on developing algorithms and hardware that mimic the functionality of the human brain using spiking neural networks (SNNs).

From an algorithm perspective, current research in SNNs involves developing more efficient and accurate models for tasks such as pattern recognition, classification, and decision-making. This includes developing new learning rules and optimization algorithms that can adjust the weights of the connections between neurons to improve the accuracy of the network.

From a hardware perspective, researchers are working on developing specialized neuromorphic hardware that can efficiently and accurately simulate SNNs. This includes developing neuromorphic chips and systems that can handle the high-speed, low-power requirements of SNNs, as well as developing new methods for integrating these chips into larger computing systems.

Overall, the goal of Brian-inspired neuromorphic computing is to create more efficient and powerful computing systems that can perform complex tasks with low power consumption, similar to how the human brain operates. This field of research has the potential to revolutionize the way we approach computing, leading to more intelligent and efficient systems in a variety of applications, such as robotics, autonomous vehicles, and medical devices.

----
### 3. AI for Electronics Design Automation (机器学习辅助电子设计自动化)

AI for EDA (Electronic Design Automation) is an emerging field that uses artificial intelligence (AI) and machine learning (ML) techniques to optimize and streamline the process of designing electronic circuits and systems. EDA is a complex and time-consuming process that involves a range of tasks such as logic synthesis, placement and routing, analog circuit sizing, design space exploration of architecture, and etc. AI for EDA aims to automate many of these tasks and improve the efficiency and accuracy of the design process.