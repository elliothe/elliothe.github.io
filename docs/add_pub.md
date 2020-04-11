# Publication
---

## Add publication

The builder of the static website template mention the method of import ```.json``` format publication from a toolset called zotero. However, in order to make the website construction be more compact, I prefer to use the command-line tool.

Here you could use the [following command](https://tex.stackexchange.com/a/268305/201981) for `.bib` to `.json` conversion:
```bash
$ pandoc-citeproc --bib2json publication.bib > publication.json
```
If the above CLI is missing, check the [pandoc website](https://pandoc.org/installing.html):
```bash
$ brew install pandoc
$ brew install pandoc-citeproc
```

> Remember to remove some the addons in `.bib` (author+an entry) if use the bib from CV at overleaf.


``` json
{
  "id": "http://zotero.org/groups/2386072/items/NU9LTX7C",
  "type": "article-journal",
  "title": "Foo",
  "container-title": "IEEE Transactions on Medical Imaging",
  "page": "448-459",
  "volume": "38",
  "issue": "2", 
  "source": "IEEE Xplore",
  "abstract": "Bar",
  "DOI": "10.1109/TMI.2018.2865709",
  "author": [
    {
      "family": "",
      "given": ""
    },
  ],
  "issued": {
    "date-parts": [
      [
        "2019",
        2
      ]
    ]
  }
}
```