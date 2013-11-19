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