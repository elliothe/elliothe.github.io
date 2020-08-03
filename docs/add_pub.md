# Publication
---

## Add publication

The builder of the static website template mention the method of import ```.json``` format publication from a toolset called zotero. However, in order to make the website construction be more compact, I prefer to use the command-line tool.

Here you could use the [following command](https://tex.stackexchange.com/a/268305/201981) for `.bib` to `.json` conversion:
```bash
$ pandoc-citeproc --bib2json publications.bib > publications.json
```
If the above CLI is missing, check the [pandoc website](https://pandoc.org/installing.html):
```bash
$ brew install pandoc
$ brew install pandoc-citeproc
```

> Remember to remove some the addons in `.bib` (author+an entry) if use the bib from CV at overleaf.


1. Add the paper url under `note` attribute in bib file.
2. Add the code url under `url` attribute in bib file.
3. Add publish/accept/oral/etc under `annote`.



---

## Other work-arounds

Use the JekyII-scholar to format the reference.

https://gykovacsblog.wordpress.com/tag/jekyll-scholar/

http://zhepeiw.com/2018/12/23/blog1.html

https://bryngelson-research.com/aboutwebsite.html

About the github page deployment:
https://martinopilia.com/posts/2020/02/22/migration.html


### Sort by year



### Highlight the author name

https://stackoverflow.com/questions/28020553/highlight-a-certain-author-in-references
https://gist.github.com/inukshuk/51e4a2b527eb605845fa

### Categorize journal and conference
https://gykovacsblog.wordpress.com/tag/jekyll-scholar/


### Reformat the bibliography


the css configurations could be found at:
https://github.com/zhepeiw/zhepeiw.github.io/blob/ed2d096d891c4b4593d8372f8f4c9da6bbcdb72b/assets/css/main.css


### Serving the jekyII scholar with github