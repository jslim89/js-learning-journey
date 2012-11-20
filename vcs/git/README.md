# Lesson

## Show origin
`$ git remote show origin`

Reference: [How to tell which local branch is tracking which remote branch in Git?] (http://serverfault.com/questions/175052/how-to-tell-which-local-branch-is-tracking-which-remote-branch-in-git#answers)

## Change origin
```sh
$ git remote rm origin
$ git remote add origin https://github.com/jslim89/dotfiles
```
another way is
```sh
$ git remote set-url origin git@github.com:jslim89/dotfiles.git
```

Reference:

1. [Change “origin” of your GIT repository] (http://blog.aplikacja.info/2010/08/switch-origin-of-your-git-repository/)
2. [Install Jekyll-Bootstrap] (http://jekyllbootstrap.com/#2__install_jekyllbootstrap)

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

## Keep the source from branch and content to master (Octopress)
I've tried octopress on github. I realize that it only shows the static **html** files in my [GitHub repo] (https://github.com/jslim89/jslim89.github.com). A question come out from my mind, that is  
**What if I lost my source files (i.e. Rakefile, _config.yml, etc)?**  
A solution that I found is
```sh
$ git clone https://github.com/jslim89/jslim89.github.com.git
$ cd jslim89.github.com # You should see those static HTML files
$ git checkout source # It keeps all source in `source` branch, now no more HTML files
$ mkdir _deploy
$ cd _deploy
$ git init
$ git remote add origin https://github.com/jslim89/jslim89.github.com.git
$ git pull origin master # check out the master (Static HTML files)
$ cd ..
```
Actually during the octopress setup, they push the source to another branch rather than master.

Reference: [Octopress: Setting up a Blog and Contributing to an Existing One] (http://code.dblock.org/octopress-setting-up-a-blog-and-contributing-to-an-existing-one)
