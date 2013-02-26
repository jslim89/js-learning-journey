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

## Move a file in server
```php
var $source      = '/source/path/to/your/file.jpg';
var $destination = '/destination/path/to/your/file.jpg';

rename($source, $destination);
```

Reference: [How can I move a file to another folder using php?](http://stackoverflow.com/questions/8206011/how-can-i-move-a-file-to-another-folder-using-php#answers)

## Create intermediate directory
```php
$path = '/path/to/your/dir';
mkdir($path, 0777, true);
```
The **3rd** argument is allowed to create intermediate directory.

Reference: [PHP - mkdir](http://php.net/manual/en/function.mkdir.php)

## Get client located country info
We make use of [hostip.info](http://www.hostip.info/) api to get the location details.

```php
$url = 'http://api.hostip.info/get_json.php?ip=' . $_SERVER['REMOTE_ADDR'];

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
ob_start();
curl_exec($ch);
$content = ob_get_contents();
ob_end_clean();
curl_close($ch);

$result = json_decode($content);
```

## Get the date `x` days before
```php
/*
 * The format is 'Y-m-d' (i.e. 2013-02-26)
 */
function getPreviousDateFromDate($date, $days_ago) {
    return date('Y-m-d', strtotime($date . ' -' . $days_ago . ' days'));
}
```
