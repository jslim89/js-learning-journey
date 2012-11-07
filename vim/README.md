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