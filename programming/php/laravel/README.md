# Lessons

## Add custom helper functions with some helper files

```sh
# create a helpers folder
$ mkdir /path/to/laravel/app/helpers

# create a helper file
$ touch /path/to/laravel/app/helpers/debug.php
```

Edit **/path/to/laravel/app/start/global.php**, and add this to the end of file. This is to include it so you can use it anywhere
```php
<?php
...

/*
|--------------------------------------------------------------------------
| Require Helper Files
|--------------------------------------------------------------------------
|
*/
foreach(glob(app_path().'/helpers/*.php') as $h_file) require $h_file;
```

In **/path/to/laravel/app/helpers/debug.php**
```php
if (!function_exists('my_debug')) {
    function my_debug($obj) {
        echo '<pre>';
        print_r($obj);
        echo '</pre>';
    }
}
```

Reference: [What are the best practices and best places for laravel 4 helpers or basic functions?](http://stackoverflow.com/questions/17088917/what-are-the-best-practices-and-best-places-for-laravel-4-helpers-or-basic-funct/17091089#17091089)

## Add custom config file
Some time we have use a lot of third party API which need to keep the API key. So we can create a custom config file to store that.

```sh
$ touch /path/to/laravel/app/config/custom.php
```

Put content to the file. i.e.
```php
<?php
return array(
    'api' => array(
        'google_map' => array(
            'key' => '98fgy8sy3SDF8f37*#7f',
            'other_param' => 'foobar',
        ),
    ),
);
```

Can retrieve it by
```php
$google_config = \Config::get('custom.api.google_map');
echo 'KEY: ' . $google_config['key'];
echo 'Other: ' . $google_config['other_param'];
```

Reference: [Configuration](http://codehappy.daylerees.com/configuration)

## Specify `alias` on `JOIN`

**On SQL**
```sql
SELECT table.title, table.desc, cu.first_name, mu.first_name
FROM table
LEFT JOIN user cu ON cu.id = table.created_by  // user who create
LEFT JOIN user mu ON mu.id = table.modified_by // user who modify
```

**Laravel Query Builder**
```php
DB::table('table')
    ->leftJoin('user AS cu', 'cu.id', '=', 'table.created_by')
    ->leftJoin('user AS mu', 'mu.id', '=', 'table.modified_by')
    ->select(
        'table.title'
        , 'table.desc'
        , 'cu.first_name'
        , 'mu.first_name'
    )
    ->get();
```

Reference: [Laravel join queries AS](http://stackoverflow.com/questions/14318205/laravel-join-queries-as/14320265#14320265)

## Check is POST request
```
if (\Request::isMethod('POST')) {
    // confirmed this is POST request
}
```

## Filter `csrf` for few functions only
```php
$this->beforeFilter('csrf', array('on' => 'post', 'only' => array('func1', 'func2')));
```

## Show the last executed query
```php
$queries = DB::getQueryLog();
$last_query = end($queries);
```

Reference: [Get the query executed in Laravel 3/4](http://stackoverflow.com/questions/14536165/get-the-query-executed-in-laravel-3-4/14536215#14536215)

## Pagination check has page
Check whether the pagination has other pages
```php
<?php if ($obj_list->getTotal() > $obj_list->count(): ?>
    <div class="pagination-wrapper">
        <?php echo $obj_list->appends(array(
                'param1' => 'value1',
                'param2' => 'value2',
            ))->links(); ?>
    </div>
<?php endif; ?>
```

If the total objects is more than retrieved objects, that mean it has other pages.
