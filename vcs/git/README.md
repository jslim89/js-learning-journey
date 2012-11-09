# Lesson

## Show origin
`$ git remote show origin`

Reference: [How to tell which local branch is tracking which remote branch in Git?] (http://serverfault.com/questions/175052/how-to-tell-which-local-branch-is-tracking-which-remote-branch-in-git#answers)

## Change origin
`$ git remote rm origin`  
`$ git remote add origin https://github.com/jslim89/dotfiles`

Reference: [Change “origin” of your GIT repository] (http://blog.aplikacja.info/2010/08/switch-origin-of-your-git-repository/)

## Merge with other's github repo
### Setup
`$ git remote add upstream https://github.com/otheruser/repo.git`

### Sync
`$ git fetch upstream`

### Merge
`$ git checkout master`  
`$ git merge upstream/master`

Reference: [Syncing a fork] (https://help.github.com/articles/syncing-a-fork)

## Add / Update / Delete submodule
```sh
$ git submodule add git@github.com:user/repo.git /path/to/repo # adding a submodule

$ git submodule init
$ git submodule update # update submodule

$ git rm --cached /path/to/repo # remove submodule
```

Reference: [Git Submodules: Adding, Using, Removing, Updating] (http://chrisjean.com/2009/04/20/git-submodules-adding-using-removing-and-updating/)
