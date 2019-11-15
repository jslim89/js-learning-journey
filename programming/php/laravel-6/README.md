# Lessons

## Get total count from a `GROUP BY` query

```php
<?php
\DB::query()->fromSub(function ($query) {
    $query->from('table_child')->groupBy('col_id');
}, 'sq')->count();
```

Reference: [How to select from subquery using Laravel Query Builder?](https://stackoverflow.com/questions/24823915/how-to-select-from-subquery-using-laravel-query-builder/52772444#52772444)

## Set cache-control to S3

Update **config/filesystems.php**

```php
's3' => [
    'driver' => 's3',
    'key' => env('AMAZON_S3_KEY'),
    'secret' => env('AMAZON_S3_SECRET'),
    'region' => env('AMAZON_S3_REGION'),
    'bucket' => env('AMAZON_S3_BUCKET'),
    'options' => [
        'CacheControl' => 'max-age=2592000', // 2592000 seconds = 30 days
    ]
],
```

Reference: [Set default Cache-Control header for all objects uploaded using Laravel](https://dev.to/brunofernandes/setting-cache-control-header-for-all-amazon-s3-objects-5cga)
