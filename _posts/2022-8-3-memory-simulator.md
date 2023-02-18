---
layout: post
title:  "Memory Simulator"
excerpt: "Introduction of CACTI and Nvsim"
date:   2022-8-3 12:0:0
categories: [tutorial]
tags: [tutorial]
author: Elliot He
comments: true
---



List of the Content:
- [Introduction](##Introduction)
- [Memory Simulators](##Memory_Simulators)



## <a name="Introduction"></a> Introduction
<p align="center">
<img src="/images/blog/42-years-of-microprocessor-trend-data.png" alt="drawing" width="700"/>
</p>
<p align="center">
    <em>Figure: The development of computer processor in last 42 years.</em>
</p>

The performance of the general-purporse processor (i.e., CPU with Von-Neumann architecture) has been significantly improved in the last ~40 years (since 1970s), however gradually slowing down in recent years. In addition to the cause of "End of Dennard Scaling" and "End of Moore's Law" (which is actually not, due to 3D-transistor and 3D-stacking technology), the "memory wall" is the main bottleneck. 

<p align="center">
<img src="/images/blog/Memory-Access-vs-CPU-Speed.png" alt="drawing" width="500"/>
</p>
<p align="center">
    <em>Figure: The Performance (speed-up) gap between CPU and main memory (DRAM) [1].</em>
</p>

As shown in the above figure, in the current trend, whatever how fast the CPU computes, it still need to communicate with the main memory (data read/write). In current memory hierarchy, normally one computation consumes much energy and latency, compared to one operation. Thus, in this blog, we plan to use the popular memory simulators, CACTI and Nvsim, to understand current memory hierarchy.

## <a name="Memory Simulators"></a> Memory Simulators

[CACTI](https://github.com/HewlettPackard/cacti) is a tool to model caches/memories, 3D stacking, and off-chip IP. It is orginally develop by HP Lab (Dr. Jouppi who also lead the TPU design as well). [Nvsim](https://github.com/SEAL-UCSB/NVSim) is its successor (developed by Dr. Yuan Xie's group) which focus on the emerging memories.

> The CACTI mainly used for cache, but support eDRAM lately. However, for different DRAM technology, [Ramulator](https://github.com/CMU-SAFARI/ramulator) from Dr. Onur Mutlu's group is a better option.

Note that, CACTI has undergoing seven versions, it is better to fully understand the memory organization by go through the documents for different version. Their links are included as follows:
- [Version 1.0 @ 1996](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=509850): Enhanced cache access and cycle time model.
- [Version 2.0 @ 2000](https://arch.cs.utah.edu/cacti/cacti2.pdf): support for fully-associative caches, a cache power model, technology scaling, multi-ported caches, improved tag comparison circuits, and etc.
- [Version 3.0 @ 2001](https://www.hpl.hp.com/research/cacti/cacti3.pdf): Integrating models of cache access time, cycle time, area, aspect ratio and power.  
- [Version 4.0 @ 2004](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.124.5177&rep=rep1&type=pdf): Add a model for leakage power and update\s the basic circuit structure and device parameters to better reflect the advances in scaling semiconductors.
- [Verison 5.1 @ 2008](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.408.4036&rep=rep1&type=pdf): 
    - Due to technology scaling is in deep-submicro, change base technology modeling from simple linear scaling to models of ITRS roadmap. 
    - Supprot DRAM memory modeling.
    - Modular code re-organization for fair comparison of SRAM and DRAM. 
- [Version 6.0 @ 2009](https://www.hpl.hp.com/techreports/2009/HPL-2009-85.pdf):
    - Add interconnect design for large caches. 
    - Support NUCA (Non-unifrom Cache Access is for multi-processor chip) 
    - model different types of wires (e.g., RC based wires with different power, delay, and area; plus differential low-swing buses.)
- [Version 7.0 @ 2017](https://dl.acm.org/doi/abs/10.1145/3085572): 
    - CACTI 7: New Tools for Interconnect Exploration in Innovative Off-Chip Memories
    - CACTI-IO: CACTI With OFF-chip Power-Area-Timing Models
    - MemCAD: An Interconnect Exploratory Tool for Innovative Memories Beyond DDR4
    - CACTI-3DD: Architecture-level modeling for 3D die-stacked DRAM main memory

Based on the above evolution, the technical report of version 5.1 is the best option to understand the cache and memory.

In addition to the circuit-level evaluation functionality provided by the CACTI and Nvsim, you may be also interested in evaluate the temperature issue of the 3D stacked memory. For that kind of evaluation, you may need to use [3D-ICE (3D Interlayer Cooling Emulator)](https://github.com/esl-epfl/3d-ice).


References
----------
[1] Bahi, Mouad, and Christine Eisenbeis. "High performance by exploiting information locality through reverse computing." 2011 23rd International Symposium on Computer Architecture and High Performance Computing. IEEE, 2011.

[2] Muralimanohar, Naveen, Rajeev Balasubramonian, and Norman P. Jouppi. "CACTI 6.0: A tool to model large caches." HP laboratories 27 (2009): 28.

[3] CACTI 7.0 webpage: https://www.cs.utah.edu/~rajeev/cacti7/

[4] CACTI and NVSIM tutorial: https://blog.csdn.net/m0_37921318/article/details/124721894