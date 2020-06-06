---
layout: post
title:  "How to Write a Acceptable Paper"
excerpt: "paper drafting tutorial"
categories: [tutorial]
author: Elliot He
comments: false
---

> For a paper to be a good paper, at least make it looks like a good paper.

This tutorial gives the instruction about writing a paper in Latex.

List of the Content:
- [Latex IDE](##Latex_IDE)
- [Mathematical Equation](##math_equation)


## <a name="Latex_IDE"></a> Latex IDE

The first step of writing a paper is always to have a configured latex environment.
For the latex IDE, I prefer the [overleaf](https://www.overleaf.com/) and [vscode](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop). I think you should have both, where their pros and cons are listed as follows:

| Overleaf (remote)    | VScode (local)          | 
| ------------- |:-------------:| 
| Online enviroment supporst multiple-person edits simutaneously| A copy of latex source code locally (Overleaf server down before deadline). | 
| Embedded all the latex packages. | Need to download the all the packages (costs GBs in your laptop)   |

It is noteworthy that, if you are a heavy user of overleaf, you could buy the membership. Then, you can associate your github and dropbox account with the overleaf, thus all the latex project can be seamlessly synchronized automatically.

## <a name="math_equation"></a> Mathematical Equation

## Reproducible Experiments

To make the experiment reproducible, I highly suggest to use the github repository to host the entire project.

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
