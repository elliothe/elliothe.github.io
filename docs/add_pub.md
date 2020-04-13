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