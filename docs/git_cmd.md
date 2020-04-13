# git command for version control

## use the git-flow as the flow model

check the [git-flow tutorial](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)

> as the `master` branch should function all the time, we operate on the `develop` branch with `feature`.


```bash
git flow feature start new-feature
git flow feature finish new-feature
```

If I have the `new-feature` on the `remote\origin`, delete it with command line:
```bash
git push origin --delete feature/new-feature
```