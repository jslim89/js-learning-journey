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

## un-add a file before commit
```sh
$ git reset
```

Reference: [Undo git add before commit] (http://stackoverflow.com/questions/348170/undo-git-add-before-commit#answers)

## un-delete before commit
```sh
$ git checkout <filename>
```

Reference: [git un-remove before commit?] (http://stackoverflow.com/questions/5587183/git-un-remove-before-commit#answers)

## Accidentally pushing sensitive date to octopress blog on github repo
```sh
$ git filter-branch --index-filter 'git rm -r --cached --ignore-unmatch filepath/filename' --prune-empty --tag-name-filter cat -- --all
$ git push origin master --force
```

Reference: [Remove sensitive data] (https://help.github.com/articles/remove-sensitive-data)

## Un-modify a file before commit
```sh
$ git checkout -- filename
```

Reference: [Unmodifying a Modified File] (http://git-scm.com/book/en/Git-Basics-Undoing-Things#Unmodifying-a-Modified-File)

## Problem with no HEAD branch
```sh
$ git remote show origin
Identity added: /Users/jslim/.ssh/id_rsa (/Users/jslim/.ssh/id_rsa)
* remote origin
  Fetch URL: git@yourdomain.com:/yourporject.git
  Push  URL: git@yourdomain.com:/yourporject.git
  HEAD branch: (unknown)
```
When I type the same command to my learning journey, it has **HEAD** branch
```sh
$ git remote show origin
* remote origin
  Fetch URL: git@github.com:jslim89/js-learning-journey.git
  Push  URL: git@github.com:jslim89/js-learning-journey.git
  HEAD branch: master
  Remote branch:
    master tracked
  Local branch configured for 'git pull':
    master merges with remote master
  Local ref configured for 'git push':
    master pushes to master (up to date)
```
When first I see this, I was thinking about how to add **master** to the HEAD. In fact, it is not necessary
```sh
$ git push origin master
Counting objects: 18, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (16/16), done.
Writing objects: 100% (18/18), 13.30 KiB, done.
Total 18 (delta 1), reused 0 (delta 0)
To git@yourdomain.com:/yourporject.git
 * [new branch]      master -> master
```
Show origin again
```sh
$ git remote show origin
* remote origin
  Fetch URL: git@yourdomain.com:/yourporject.git
  Push  URL: git@yourdomain.com:/yourporject.git
  HEAD branch: master
  Remote branch:
    master tracked
  Local ref configured for 'git push':
    master pushes to master (up to date)
```

## Checkout specific revision
```sh
# Just to play safe, clone to a new folder
$ git clone git@yourdomain.com:/yourporject.git
$ git checkout <SHA1>
Checking out files: 100% (6466/6466), done.
Note: checking out '49869aec20e12345c40cbabcde0f5e8e959d5aa'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b new_branch_name

HEAD is now at 49869ae... Your commit message here
```

Reference: [How to clone git repository with specific revision/changeset?](http://stackoverflow.com/questions/3489173/how-to-clone-git-repository-with-specific-revision-changeset)

## Change last commit message
```sh
$ git commit --amend -m "New commit message"
```

Reference: [How do I edit an incorrect commit message in Git?](http://stackoverflow.com/questions/179123/how-do-i-edit-an-incorrect-commit-message-in-git/179147#179147)

## Show commited files on a specific revision
```sh
$ git diff-tree --no-commit-id --name-only -r 16fafae4328371850e21ad34e6f4b083bc9e566c
controller/Index.php
model/UserModel.php
```

Reference: [List all the files for a commit in Git](http://stackoverflow.com/questions/424071/list-all-the-files-for-a-commit-in-git/424142#424142)

## Update all EXCEPT for a file
Commit all files except **/path/to/file.txt**
```sh
$ git update-index --assume-unchanged /path/to/file.txt
$ git commit -a -m "Commit msg"
$ git update-index --no-assume-unchanged /path/to/file.txt
```

Reference: [Exclude a file from a git commit](http://trillworks.com/nick/2013/03/05/exclude-a-file-from-a-git-commit/)

## Change submodule origin

1. Edit `.gitmodule` with the new URL
2. Run `git submodule sync` _(This will update the new URL to the submodule)_

Reference: [How do I replace a git submodule with another repo?](http://stackoverflow.com/questions/14404704/how-do-i-replace-a-git-submodule-with-another-repo/14405542#14405542)

## git tag
```sh
$ git commit -am "completed version 1.0"
# tag current commit on local
$ git tag v1.0
$ git push origin master
# push the tag to remote
$ git push --tags # or git push origin v1.0
```

Reference: [How can I push a tag to a remote repository using Git?](http://stackoverflow.com/questions/5195859/how-can-i-push-a-tag-to-a-remote-repository-using-git/5195913#5195913)

## Clone a specific branch from remote branch
```sh
$ git clone git://example.com/myproject
$ cd myproject
$ git checkout -b wanted_branch origin/wanted_branch
```

Reference: [How do I clone all remote branches with Git?](http://stackoverflow.com/questions/67699/how-do-i-clone-all-remote-branches-with-git/72156#72156)

## un-commit last commit
```sh
$ git reset --hard HEAD^
```

Reference: [How to uncommit my last commit in git](http://stackoverflow.com/questions/2845731/how-to-uncommit-my-last-commit-in-git/2846154#2846154)
