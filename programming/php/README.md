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

## Inner function to access outer function's variable
```php
function outer($foo) {
    // now the inner want to use the variable 'foo'
    $inner = function() use ($foo) {
        echo $foo;
    }

    $inner();
}
```
the **`use`** keyword is to let the inner function to access the outer function's variable

Reference: [How to access variable from scope of parent function?](http://stackoverflow.com/questions/8393121/how-to-access-variable-from-scope-of-parent-function#answer-8393242)

## Convert array to query string
```php
$params = array(
    'p1' => 'value1',
    'p2' => 'value2',
);
$query_string = http_build_query($params);

echo $query_string; // p1=value1&p2=value2
```

Reference: [PHP function to build query string from array](http://stackoverflow.com/questions/400805/php-function-to-build-query-string-from-array#answers)

## Removed **<a>** attributes accept **href**
```php
<?php
$html = 'This is a <a id="lnk" href="http://www.google.com" id="lnk">Google link</a> for you.'
. ' This is another <a id="lnk" href="http://www.facebook.com">Facebook link</a> for you';

$new_content = preg_replace('/<a\s[^>]*href=\"([^\"]*)\"[^>]*>(.*)<\/a>/siU', '<a href="$1">$2</a>', $html);

echo $new_content;
```

The result will be
```
This is a <a href="http://www.google.com">Google link</a> for you. This is another <a href="http://www.facebook.com">Facebook link</a> for you
```

Reference: [PHP: Parsing HTML to find Links](http://www.the-art-of-web.com/php/parse-links/#.Ub7Yrvb89Yg)

## Check whether is POST request
```php
<?php
function is_post() {
    return $_SERVER['REQUEST_METHOD'] === 'POST';
}
```

Reference: [Check whether a request is GET or POST [duplicate]](http://stackoverflow.com/questions/1372147/check-whether-a-request-is-get-or-post/1372163#1372163)

## URL from text (href)
```php
<?php
function url_from_text($text) {
    // The Regular Expression filter
    $reg_exUrl = "/(http|https|ftp|ftps)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?/";

    // The Text you want to filter for urls
    $text = "The text you want to filter goes here. http://google.com";

    // Check if there is a url in the text
    if(preg_match($reg_exUrl, $text, $url)) {
        // make the urls hyper links
        return preg_replace($reg_exUrl, '<a href="' . $url[0] . '">' . $url[0] . '</a>', $text);
    } else {
        // if no urls in the text just return the text
        return $text;
    }
}
```

Reference: [Find URLs in Text, Make Links](http://css-tricks.com/snippets/php/find-urls-in-text-make-links/)

## Get last month date range
```php
$first_day_prev_month = date('Y-m-1', strtotime('first day of previous month'));
$last_day_prev_month = date('Y-m-t', strtotime('first day of previous month'));
```

Reference: [Getting last month's date in php](http://stackoverflow.com/questions/1889758/getting-last-months-date-in-php/5180731#5180731)

## `fgetcsv` read all as ONE line
This is due to End-of-Line (EOL) problem in different environment (Windows is different from UNIX)

The **EOL** in Windows is `^M`, you can see this if you try to open via VIM.

```php
while (($data = fgetcsv($handle, 10000)) !== FALSE) {
    print_r($data);
}
```
If you read the file which contains of `^M` character, then everything will be in a single line.

In order to solve this, add this before the `while` statement
```php
ini_set('auto_detect_line_endings', true);
```

Reference: [php fgetcsv returning all lines](http://stackoverflow.com/questions/5539053/php-fgetcsv-returning-all-lines/5541319#5541319)

## Loop through dates

```php
// Start date
$start_date = '2013-12-06';
// End date
$end_date = '2014-04-20';

while (strtotime($start_date) <= strtotime($end_date)) {
    echo "$start_date\n";
    $start_date = date('Y-m-d', strtotime('+1 day', strtotime($start_date)));
}
```

Reference: [PHP: Loop through dates (from date to date) with strtotime() function](http://www.if-not-true-then-false.com/2009/php-loop-through-dates-from-date-to-date-with-strtotime-function/)

## Get image type
```php
switch(exif_imagetype('image/foo.jpg')) {
    case IMAGETYPE_JPEG:
        echo 'JPEG';
        break;

    case IMAGETYPE_PNG:
        echo 'JPEG';
        break;
    ...
}
```

Reference: [exif_imagetype](http://www.php.net/manual/en/function.exif-imagetype.php)

## Insert a string into another string
```php
$str = 'abc123';
$result = substr_replace($str, '-', 3, 0);
echo $result;

// output
// abc-123
```

Reference: [How to insert a string inside another string?](http://stackoverflow.com/questions/1372737/how-to-insert-a-string-inside-another-string/1372765#1372765)

## Re-format date using `preg_replace`
e.g. Format a date with `dd/mm/yyyy` to `yyyy-mm-dd`
```php
$date = '31/08/1987';

$pattern = '/^(\d{2})\/(\d{2})\/(\d{4})$/';
$replacement = '$3-$2-$1';

$formatted_date = preg_replace($pattern, $replacement, $date);
echo $formatted_date;
```

Output:
```
1987-08-31
```

* `(\d{2})` - the braces is to keep a reference that can use it later _(i.e. `$1`)_. Where `\d` is to match integer only and `{2}` is exactly 2 characters
* `\/` - because the slash _(/)_ is a special character, so have to use backslash _(\\)_ to escape it
* `$3-$2-$1` - is the sequence of the submatch _(i.e. `(\d{2})` those inside the braces)_

Reference: [preg_replace](http://my1.php.net/preg_replace#example-4797)

## iPad photo orientation issue by rotate image manually
```php
function resample($jpgFile, $thumbFile, $width, $orientation) {
    // Get new dimensions
    list($width_orig, $height_orig) = getimagesize($jpgFile);
    $height = (int) (($width / $width_orig) * $height_orig);
    // Resample
    $image_p = imagecreatetruecolor($width, $height);
    $image   = imagecreatefromjpeg($jpgFile);
    imagecopyresampled($image_p, $image, 0, 0, 0, 0, $width, $height, $width_orig, $height_orig);
    // Fix Orientation
    switch($orientation) {
        case 3: // 180 rotate left
            $image_p = imagerotate($image_p, 180, 0);
            break;
        case 6: // 90 rotate right
            $image_p = imagerotate($image_p, -90, 0);
            break;
        case 8: // // 90 rotate left
            $image_p = imagerotate($image_p, 90, 0);
            break;
    }
    // Output
    imagejpeg($image_p, $thumbFile, 90);
}
```

Reference: [PHP read_exif_data and Adjust Orientation](http://stackoverflow.com/questions/7489742/php-read-exif-data-and-adjust-orientation/9207128#9207128)

## Remove all html tags & replace `&nbsp;` to `<space>`

```php
str_replace('&nbsp;', ' ', strip_tags($description));
```

## Replace new line character with <space>
```php
$new_text = str_replace(array("\r", "\r\n", "\n"), ' ', $text);
```

Reference: [How to Replace Newline with Space Using PHP](http://www.sourcecodester.com/tutorials/php/how-replace-newline-with-space-using-php.html)

## Regex match any characters INCLUDING <new line>

```php
$content = <<<EOD
<html>
    <title>Test</title>
    <body>
        <div id="some-div">
            Some text here
        </div>
    </body>
</html>
EOD;
$pattern = '/<body.*>(.*)<\/body>/s'; // the last characters 's' is to match new line as well
preg_match($pattern, $content, $result);
```

`$result[0]` will give you

```html
<div id="some-div">
    Some text here
</div>
```

Reference: [How do I match any character across multiple lines in a regular expression?](http://stackoverflow.com/questions/159118/how-do-i-match-any-character-across-multiple-lines-in-a-regular-expression/159139#159139)

## Receive `json` value from HTTP POST

This will show nothing
```php
print_r($_POST);
```

In order to get the value
```php
$json = file_get_contents('php://input');
if ($json) {
    $post = json_decode($json, true);
}
print_r($post);
// access via $post['param1']
```

Reference: [receive json post with php](http://stackoverflow.com/questions/18866571/receive-json-post-with-php/18867369#18867369)

## Error on mysqli
The error message was `No such file or directory`

**Solution**  
simply change the host to `127.0.0.1` instead of `localhost`

Reference: [PHP - MySQL connection not working: 2002 No such file or directory](http://stackoverflow.com/questions/1676688/php-mysql-connection-not-working-2002-no-such-file-or-directory/6959675#6959675)

## Save web image into file
```php
function save_image($url, $dest_path) {
    // get the file extension
    $ext = pathinfo($url, PATHINFO_EXTENSION);

    // make sure the file name is unique, so use microtime here
    $filename = str_replace(array('0.', ' '), array('', ''), microtime()) . '.' . $ext;

    $ch = curl_init($url);
    $fp = fopen($dest_path.'/'.ltrim($filename, '/'), 'wb');
    curl_setopt($ch, CURLOPT_FILE, $fp);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_exec($ch);
    curl_close($ch);
    fclose($fp);
    // return the new filename at the end
    return $filename;
}
```

References:

- [Saving image from PHP URL using PHP](http://stackoverflow.com/questions/724391/saving-image-from-php-url-using-php/724449#724449)
- [How to get the file extension in PHP? [duplicate]](http://stackoverflow.com/questions/10368217/how-to-get-the-file-extension-in-php/10368236#10368236)

## Regex validation for color code hex

```php
if(preg_match('/^#?([a-f0-9]{6}|[a-f0-9]{3})$/', $hex))
{
    // correct format
}
```
The regex above check the optional hash _(#)_ and accept either **3** or **6** characters.

Reference: [Extending the Laravel 4 Validator](http://culttt.com/2014/01/20/extending-laravel-4-validator/)

## Updated all `null` to empty string in an array

```php
function null_to_empty_str($obj) {
    $new_json_array = array();
    foreach ($obj as $k => $v) {
        if (is_array($v)) {
            $new_json_array[$k] = null_to_empty_str($v);
            continue;
        }
        if ($v === null) {
            $new_json_array[$k] = '';
            continue;
        }
        $new_json_array[$k] = $v;
    }
    return $new_json_array;
}
```

## phpMyAdmin auto login

Edit the file **config.inc.php**

```php
// change from 'cookie' to 'config'
$cfg['Servers'][$i]['auth_type'] = 'config';
// add root username & password
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = 'root_pass';
```

Reference: [Avoid login screen in phpmyadmin and auto login](http://www.devraju.com/php/avoid-login-screen-in-phpmyadmin-and-auto-login/)

## Make use of `array_map` to create key-value array

```php
$original = [
    0 => ['id' => 'js', 'name' => 'foo'],
    1 => ['id' => 'lim', 'name' => 'bar'],
];

$options = [];
array_map(function($obj) use (&$options) {
    $options[$obj['id']] = $obj['name'];
}, $original);

print_r($options);
```

Result will be:

```
Array(
    'js' => 'foo',
    'lim' => 'bar',
)
```

Reference: [PHP: array_map](http://php.net/manual/en/function.array-map.php)

## Call static method by dynamic class

```php
<?php
$class_name = 'FooBar';
$class_name::callMethod($arg1...);
```

If want to initialize

```php
<?php
$obj = new $class_name();
```

## Replace html tag by regex

Let say replace `<a>` to `<em>`

```php
<?php
$html = '<strong>No 1.</strong> This is a <a href="...">Link</a>';
preg_replace_callback('(<a.*>(.*?)</a>)', function($a) {return '<em>' . $a[1] . '</em>');}, $html);
```

Reference: [How To Replace First HTML &lt;strong&gt;&lt;/strong&gt; Tag in PHP](http://stackoverflow.com/questions/14658732/how-to-replace-first-html-strong-strong-tag-in-php/14658760#14658760)

## Call dynamic class static function

```php
<?php
$class_name = 'Helpers\DateHelper';
$result = call_user_func($class_name . '::convert', '2018-04-30', 'M d, Y');
```

This is equivalent to `Helpers\DateHelper::convert('2018-04-30', 'M d, Y')`

Reference: [Dynamic static method call in PHP?](https://stackoverflow.com/questions/2108795/dynamic-static-method-call-in-php/2108809#2108809)
