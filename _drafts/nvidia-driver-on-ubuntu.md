---
layout: post
title:  "Install Nvidia Driver on Ubuntu System"
excerpt: "nvidia driver"
categories: [tutorial]
author: Elliot He
comments: false
---

# Nvidia Driver on Ubuntu

1. Detecting the graphic card:

```bash
$ ubuntu-drivers devices
```
which outputs:
```txt
== /sys/devices/pci0000:00/0000:00:02.0/0000:07:00.0/0000:08:10.0/0000:09:00.0 ==
modalias : pci:v000010DEd00001B02sv000010DEsd000011DFbc03sc00i00
vendor   : NVIDIA Corporation
driver   : nvidia-430 - third-party free recommended
driver   : nvidia-418 - third-party free
driver   : nvidia-384 - third-party free
driver   : nvidia-410 - third-party free
driver   : nvidia-387 - third-party non-free
driver   : xserver-xorg-video-nouveau - distro free builtin
driver   : nvidia-415 - third-party free
```

If you want to directly install the recommand driver, use:
```bash
$ sudo ubuntu-drivers autoinstall
```



The [compatibility](https://docs.nvidia.com/deploy/cuda-compatibility/index.html) between CUDA version and nvidia-driver version:
```
CUDA Toolkit	Linux x86_64 Driver Version
CUDA 11.0 (11.0.171)	>= 450.36.06
CUDA 10.2 (10.2.89)	>= 440.33
CUDA 10.1 (10.1.105)	>= 418.39
CUDA 10.0 (10.0.130)	>= 410.48
CUDA 9.2 (9.2.88)	>= 396.26
CUDA 9.1 (9.1.85)	>= 390.46
CUDA 9.0 (9.0.76)	>= 384.81
CUDA 8.0 (8.0.61 GA2)	>= 375.26
CUDA 8.0 (8.0.44)	>= 367.48
CUDA 7.5 (7.5.16)	>= 352.31
CUDA 7.0 (7.0.28)	>= 346.46
```

2. Manual install

```bash
sudo apt-get purge nvidia*
sudo apt autoremove
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update
sudo apt-get install nvidia-driver-440
```
To check the available driver version for your system, check the [ppa website](https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa/+packages).