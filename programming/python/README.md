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

## match all chinese character
```python
import re

regex = re.compile(ur'([\u4e00-\ufaff]+)', re.UNICODE)
text = u'this is 中文 char'
matches = regex.findall(text)

print(matches[0])
```
output:
```
中文
```
**NOTE:** must indicate `u` in front of the string

Reference: [Python: any way to perform this “hybrid” split() on multi-lingual (e.g. Chinese & English) strings?](http://stackoverflow.com/questions/3801431/python-any-way-to-perform-this-hybrid-split-on-multi-lingual-e-g-chinese#answers)

## read content from web
```python
import urllib

url = 'http://yoururl.com/'
content = urllib.urlopen(url).read()
```

Reference: [How to get an HTML file using Python?](http://stackoverflow.com/questions/4489550/how-to-get-an-html-file-using-python)

## Loop through month

```py
def month_year_iter(start_month, start_year, end_month, end_year):
    ym_start= 12 * start_year + start_month - 1
    ym_end= 12 * end_year + end_month - 1
    for ym in range(ym_start, ym_end):
        y, m = divmod(ym, 12)
        yield y, m + 1
```

Reference: [How to create a month iterator](http://stackoverflow.com/questions/5734438/how-to-create-a-month-iterator/5734564#5734564)

## datetime minus month

6 months ago

```py
today = datetime.date.today()
until_date = today - relativedelta(months=6)
```

Reference: [How do I calculate the date six months from the current date using the datetime Python module?](http://stackoverflow.com/questions/546321/how-do-i-calculate-the-date-six-months-from-the-current-date-using-the-datetime/4406260#4406260)
