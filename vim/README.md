# Purposes
I realize that some useful command that seldom use, I'll easily forgot. Previously I was write in [Google Plus] (https://plus.google.com/105933285745744838422/posts). After a year, it become hard to trace back what I post. Now I decided to write it on [GitHub] (https://github.com/).

# Lessons

## Case Insensitive Search
Add a **\c** in front of the keyword
```vim
/\ckeyword
```

## Trace back previous history
Press **:** and then **CTRL + f**  
![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/vim/images/history-tracing.png "Command that previouly used")  
Then can select the previous command by typing **Enter** key

## Search for multiple words at a time
```vim
/foo\|bar
```
This will match both **foo** and **bar** at a time.

## Change/Delete Word
There are 3 ways to change a word:
* **cw** - This is only for your cursor is now in the first character position
* **caw** - This won't care where your cursor is now pointing to, but it will remove the space in front as well
* **ciw** - This won't care where your cursor is now pointing to, and it won't remove the space in front

Example: `var foo = "this is foobar"`, lets the cursor is in _b_ in **foobar** word, when you issueing:
* `cw` become `var foo = "this is foo"`
* `caw` become `var foo = "this is"`
* `ciw` become `var foo = "this is "`

**NOTE: For delete word just change _c_ to _d_**

## Show information about the editing file
```vim
CTRL + g
```
The output will be  
`"body_cust_pro_edit.cfm" 2660 lines --2%--`

## Replace with sub-match
For example: replace `eval(somewordhere)` to `somewordhere`  
`:%s/eval(\(\w\{1,}\))/\1/`  
**NOTE**
* `\(` and `\)` is a sub-match which can be accessed by `\1`, `\2`....etc. Where `\1` is the first sub-match.
* `\w` is to match alphanumeric+underscore
* `{1,}` is to indicate the min & max occurance for `\w` in this case, `1` is mean there must be at least **one** character and has no upper-bound

Another example: replace `opener.frmFoo.elementName.value = value` to `window.opener.document.forms["frmFoo"].elements["elementName"].value = value`  
`:%s/opener.frm\(\w\{1,\}\)\.\(\w\{1,\}\)/window.opener.document.forms["frm\1"].elements["\2"]/cgI`  
**NOTE: The last three options are**
* `c` - will prompt you for each match see whether you want to replace
* `g` - search globally, example: **vim is vi improved** and you search for **vi**, without `g` it will only replace the first occurance which is **vi**m
* `I` - case-sensitive match

Reference: [Vim Regex Replace] (http://stackoverflow.com/questions/11850033/vim-regex-replace#answers)

## Case toggling
`gu` - switch to lower-case  
`gU` - switch to UPPER-case  
`g~` - toggle between lower & UPPER case

Reference: [Switching case of characters] (http://vim.wikia.com/wiki/Switching_case_of_characters)

## Change case by regex
Change FooBar to fOObAR
```viml
:%s/\(\w\)\(\w\{2\}\)\(\w\)\(\w\{2\}\)/\L\1\U\2\L\3\U\4/g
```
`\L` is change to lower-case **(apply to all text after `L`)**  
`\U` is change to upper-case **(apply to all text after `U`)**

Reference: [Changing case with regular expressions] (http://vim.wikia.com/wiki/Changing_case_with_regular_expressions)

## Trace back search history
Press **/** and then **CTRL + f**  
![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/vim/images/search-history-tracing.png "Search history")  
Then can select the previous command by typing **Enter** key

## Count the number of occurance (pattern or word)
```viml
" Count the number of occurance of exactly 9-digit integer
:%s/\d\{9\}//gn

" Count the number of `foo`
:%s/foo//gn
```

Reference: [Counting occurrences of a pattern] (http://vim.wikia.com/wiki/Word_count#Counting_occurrences_of_a_pattern)

## Remove the trailing space for each line
```viml
:%s/\(^ $\)\@!\&\s\+$//g
" Or
:%s/\(\S\zs\s\+$\)\|\(^\s\{2,}$\)//g
```

Reference: [Vim: Match spaces at end of line but not lines consisting of a single space](http://stackoverflow.com/questions/7946057/vim-match-spaces-at-end-of-line-but-not-lines-consisting-of-a-single-space#answers)

## Getting `E576` error
```sh
$ vim foo.php
E576: viminfo: Missing '>' in line: on/foo.php^I368^I16
Press ENTER or type command to continue
```
When the error above occurred, just remove the `~/.viminfo` will do
```sh
$ rm ~/.viminfo
```

Reference: [E576: viminfo: Missing '>' in line:](http://www.linuxquestions.org/questions/linux-newbie-8/e576-viminfo-missing-in-line-691158/#post3378332)

## Show special character

```viml
:set list " to show the special character
:set nolist " to hide it back
```

![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/vim/images/special-char.png "Show special character")

Reference: [how to see special characters in a file using vi](http://www.unix.com/87041-post6.html?s=12ce7df9bdb92330b794db1425eb4f41)

## Run a script directly
```viml
:!./run.sh
```

Reference: [Execute a script directly within vim/mvim/gvim](https://stackoverflow.com/questions/3166413/execute-a-script-directly-within-vim-mvim-gvim/3166491#3166491)

## Create a shortcut to run script
`Ctrl+m` will save the file then execute the `/path/to/script.sh`

```viml
map <C-m> :w<CR>:!/path/to/script.sh %<CR>
```

## Replace with a new line character

```viml
:%s/,/\r/g
```
Replace all comma with new line

Reference: [How to replace a character for a newline in Vim?](https://stackoverflow.com/questions/71323/how-to-replace-a-character-for-a-newline-in-vim/71334#71334)
