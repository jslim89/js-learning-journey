# Lessons

## Conditional operator
Normally in [C](http://en.wikipedia.org/wiki/C_(programming_language\)) we write:
```c
int total += (foo == bar) ? foo : 0;
```
In python is look like:
```python
total += foo if foo == bar else 0
```

Reference: [python ? (conditional/ternary) operator for assignments] (http://stackoverflow.com/questions/3091316/python-conditional-ternary-operator-for-assignments#answers)

## Detect Operating System
```python
import platform

print platform.system()
"""
The output will be 'Linux', 'Windows', or 'Java'
"""
```

Reference:  
* [Python: What OS am I running on?](http://stackoverflow.com/questions/1854/python-what-os-am-i-running-on#answers)
* [platform — Access to underlying platform’s identifying data](http://docs.python.org/2/library/platform.html#platform.system)

## Define your own module
```python
#!/usr/bin/python
# Filename: foobar.py

def foo():
    print "Hi, this is Foo"

def bar():
    print "Hey, I'm Bar"
```
How to use?
```python
#!/usr/bin/python
from foobar import foo, bar

foo()
bar()
```
Output will be
```
Hi, this is Foo
Hey, I'm Bar
```

Reference: [Making your own Modules](http://www.ibiblio.org/g2swap/byteofpython/read/making-modules.html)

## dump object
```python
import pprint

pprint.pprint(obj);
```

Reference: [What is a python equivalent of PHP's var_dump()](http://stackoverflow.com/questions/383944/what-is-a-python-equivalent-of-phps-var-dump#answers)

## Parsing text with regex
This is equivalent to [PHP: preg_match_all](http://php.net/manual/en/function.preg-match-all.php)
```python
import re

pattern = '(https?://\S+)'
urls = re.findall(pattern, text)
```

Reference: [Translating PHP’s preg_match_all to Python](http://stackoverflow.com/questions/3865896/translating-phps-preg-match-all-to-python#answers)

## Store chinese character in string
I had getting such an error:  
```
SyntaxError: Non-ASCII character '\xe5' in file filename.py on line 13, but no encoding declared; see http://www.python.org/peps/pep-0263.html for details
```
Fortunately, I found a solution
```python
# -*- coding: utf-8 -*-
```
Just have to add this line to the top of `filename.py`

Reference: [SyntaxError: Non-ASCII character '\xa3' in file when function returns '£'](http://stackoverflow.com/questions/10589620/syntaxerror-non-ascii-character-xa3-in-file-when-function-returns#answer-10589674)
