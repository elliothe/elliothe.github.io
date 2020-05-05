---
layout: post
title:  "How to Write a Acceptable Paper"
excerpt: "paper drafting tutorial"
categories: [tutorial]
author: Elliot He
comments: false
---

> This tutorial gives the instruction about writing a paper in Latex.

## Latex IDE

For the latex IDE, I prefer the [overleaf](https://www.overleaf.com/) and [vscode](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop).

Overleaf (Online):
- Online enviroment supporst multiple-person edits simutaneously.
- Embedded all the latex packages. 

Vscode (Local):
- A copy of latex source code locally (Overleaf server down before deadline).
- Need to download the all the packages (costs GBs)





## Equation

## Reproducible Experiments

## Figure

## Table

Use the online table generator is my personal preference.

## Reference

## Camera-ready Preparation

As many works are submitted to IEEE, it is normally mandatory to check the format with IEEE express. However, font embedding is the common issue to be address. [One solution](https://www.karlrupp.net/2016/01/embed-all-fonts-in-pdfs-latex-pdflatex/):
```bash
>>> pdftops yourfile.pdf
>>> ps2pdf14 -dPDFSETTINGS=/prepress yourfile.pdf yourfile-output.pdf
```
