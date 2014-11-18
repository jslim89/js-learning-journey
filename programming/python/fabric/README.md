# Lessons

## Store the bash command output in variable
```python
from fabric.api import local

def foo(name):
    result = local('cat file%s' % name, capture=True)
    ...
```
The output of the file will be stored in `result` variable.

Reference: [Fabric tutorial] (http://docs.fabfile.org/en/1.3.3/tutorial.html#conclusion)

