# Lessons

## Get total count from a `GROUP BY` query

```php
<?php
\DB::query()->fromSub(function ($query) {
    $query->from('table_child')->groupBy('col_id');
}, 'sq')->count();
```

Reference: [How to select from subquery using Laravel Query Builder?](https://stackoverflow.com/questions/24823915/how-to-select-from-subquery-using-laravel-query-builder/52772444#52772444)
