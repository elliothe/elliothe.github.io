---
layout: post
title:  "How to arxiv the paper"
excerpt: "tutoiral for post paper on arxiv."
date:   2021-12-16 16:0:0
categories: [paper submission]
tags: [tutorial]
author: Elliot He
comments: true
image:
  feature: https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/ArXiv_web.svg/1200px-ArXiv_web.svg.png
  # credit: thomas shellberg
  # creditlink: https://unsplash.com/photos/Ki0dpxd3LGc
---



# How to Submit A Pre-print to Arxiv


## some useful links
- [Open Access Requirement from ACM](https://www.acm.org/publications/openaccess)
- [Open Access Requirement from IEEE](https://www.acm.org/publications/openaccess)
- [arxiv tutorial](https://zonca.dev/2018/05/pearc18-preprint-arxiv.html)
- [Typesetting a document in ACM style for Arxiv](https://rvprasad.medium.com/typesetting-a-document-in-acm-style-for-arxiv-46967b306f2f)

## submit to arxiv via overleaf

> [Note] Suggest to use the overleaf for arxiv submission, as it is simple. More details can be found at [here](https://www.overleaf.com/learn/how-to/LaTeX_checklist_for_arXiv_submissions)


- Within the overleaf project, select the submit button on the upper-right corner.

- You need to make sure there is no compiling error.



TL,DR

## 1. Do not directly upload the camera ready version, remove the copyright.

For ACM paper, the copyright block can be remove with following command in latex:

```latex
\settopmatter{printacmref=false}
\setcopyright{none}
\renewcommand\footnotetextcopyrightpermission[1]{}
\pagestyle{plain}
```

Put the above code before `\maketitle` 



## 2. Create the latex source file

- directly download the latex code from overleaf as `.zip` file
- include the reference file `.bbl` in the zip file
  - in overleaf, it can be found at `logs and output file`, and you should download it
  - if the main tex file is `main.tex`, make sure the reference is `main.bbl`
  - unzip the latex file and move the .bbl file into it, then re-compress to a zip file

## 3. Submit the file to Arxiv

- The Arxiv website is: https://arxiv.org/submit
- For license:
  - I prefer to choose
    - [CC BY: Creative Commons Attribution](http://creativecommons.org/licenses/by/4.0/) 
    - [CC BY-NC-SA: Creative Commons Attribution-Noncommercial-ShareAlike](http://creativecommons.org/licenses/by-nc-sa/4.0/) 
  - the above license prohibit the commercial use
- Something to note:
  - make sure all files do not contain space

