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

## Generate dummy data

```
$ php artisan make:factory ProductFactory --model="App\\Models\\Product"
```

Edit the factory file **database/factories/ProductFactory.php**

```
<?php
use App\Models\Product;
use Faker\Generator as Faker;

$factory->define(Product::class, function (Faker $faker) {
    $user_id = random_int(1, 100);
    return [
        'description' => $faker->text,
        'price' => random_int(1, 10) * 100,
        'user_id' => $user_id,
        'created_by' => $user_id,
    ];
});
```

Trigger the php code with tinker

```
$ php artisan tinker
```

Generate data

```
Psy Shell v0.9.9 (PHP 7.3.6 — cli) by Justin Hileman
>>> factory(App\Models\Product::class, 100)->create();
```

Reference: [Laravel 6 Faker – Generate Fake Data Using Faker Example](https://www.tutsmake.com/laravel-faker-generate-fake-data-using-faker-tutorial-example/)
