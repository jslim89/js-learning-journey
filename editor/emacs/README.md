# Lessons

## Install package

Edit the file in **~/.emacs.d/init.el**, add the following line

```el
(require-package 'evil)
(require-package 'key-chord)
```

Then run

```sh
$ emacs -nw --debug-init
```

Reference: [Melpa](http://melpa.org/#/getting-started)
