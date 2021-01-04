---
layout: post
title:  "Useful Commands and Configuration"
excerpt: "Useful commands"
categories: [misc]
tags: [misc]
author: Elliot He
date:   2021-1-2 12:00:01
comments: false
---


# Useful commands
---
## Table of Content:

- [1. System Configuration](#system-configuration)
- [2. System Monitoring](#system-monitoring)
- [3. PDF Processing](#pdf-processing)

---

## System Configuration

### Connecting Github with SSH

To use the ssh secure protocol to access the git repository, you need to generate the ssh keypair on the local computer and add the public key to the github account. There are two steps:

1. [ssh key generation](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
```bash
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

2. [add ssh to github](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)
```bash
$ pbcopy < ~/.ssh/id_rsa.pub
# Copies the contents of the id_rsa.pub file to your clipboard
```
then paste the key in github/setting/ssh and GPG keys.

---

## System Monitoring

### GPU monitoring

[Get real-time of GPU usage](https://stackoverflow.com/questions/8223811/top-command-for-gpus-using-cuda/8225492):
```bash
$ watch -n0.1 nvidia-smi #refresh every 0.1 Sec
```


---
## Pdf Processing

### Crop the white space for pdf figure

Easiest way to do is using the pdfcrop:
```bash
pdfcrop input.pdf output.pdf
```
Another available one could be found at [this post](https://superuser.com/questions/1487564/is-there-a-linux-tool-that-can-autocrop-the-white-margins-in-a-pdf-file).


### Embed font for IEEE express format check

For the camera ready version, IEEE normally request the format check, where the font embedding is the most common error you may encount. The following commands will do the job.

```bash
$ pdftops yourfile.pdf
$ ps2pdf14 -dPDFSETTINGS=/prepress yourfile.pdf yourfile-output.pdf
```

### Image resize

A [online tool](https://resizeimage.net/) for image resize and format conversion.

