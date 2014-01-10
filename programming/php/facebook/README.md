# Lesson

Initialize the facebook object
```php
$facebook = new Facebook(array(
    'appId' => '<your app id here>',
    'secret' => '<your app secret here>',
));
```

## Get current user's allowed permission

```php
$permissions = $facebook->api('/me/permissions');
print_r($permissions);
```

## Get current user's info

```php
$user = $facebook->api('/me');
```
