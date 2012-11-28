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
