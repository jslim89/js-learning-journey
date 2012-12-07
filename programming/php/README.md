# Lessons

## Assign range of number to array
Easier way:
```php
$foo = range(1, 5);
print_r($foo);
```
Harder way:
```php
$foo = array();
for($i = 1; $i <= 5; $i++) $foo[] = $i;
```
both will output:
```
Array
(
[0] => 1
[1] => 2
[2] => 3
[3] => 4
[4] => 5
)
```

Reference: [PHP range() Function](http://www.w3schools.com/php/func_array_range.asp)
