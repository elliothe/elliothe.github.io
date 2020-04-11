# Publication
---

## Add publication

The builder of the static website template mention the method of import ```.json``` format publication from a toolset called zotero. However, in order to make the website construction be more compact, I prefer to use the command-line tool.

Here you could use the [following command](https://tex.stackexchange.com/a/268305/201981) for `.bib` to `.json` conversion:
```bash
pandoc-citeproc --bib2json publication.bib > publication.json
```