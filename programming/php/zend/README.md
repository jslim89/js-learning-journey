# Lessons

## Use validator to validate password
The password requirement normally must contain at least ONE digit, ONE uppercase, ONE lowercase and at least few characters long.

```php
$pattern = '/^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])[0-9A-Za-z!@#$%]{6,}$/';

$input_filter->add($factory->createInput(array(
    'name' => 'password',
    'required' => true,
    'filters' => array(
        array('name' => 'StripTags'),
        array('name' => 'StringTrim'),
    ),
    'validators' => array(
        array(
            'name' => 'NotEmpty',
            'options' => array(
                'messages' => array(
                    \Zend\Validator\NotEmpty::IS_EMPTY => 'Password is required',
                ),
            ),
        ),
        array(
            'name' => 'Regex',
            'options' => array(
                'pattern' => $pattern,
                'messages' => array(
                    'regexInvalid' => 'Regular expression is invalid',
                    'regexNotMatch' => 'Password must contain uppercase, lowercase & digit and at least 6 characters',
                ),
            ),
        ),
    ),
)));
```

* `/^` - start of string
* `(?=.*\d)` - search for digit to ensure at least contain 1 digit
* `(?=.*[A-Z])` - search for uppercase character to ensure at least contain 1 uppercase
* `(?=.*[a-z])` - search for lowercase character to ensure at least contain 1 lowercase
* `[0-9A-Za-z!@#$%]` - password can consists of any digit, alphabet and symbols '!@#$%'
* `{6,}` - must be at least 6 characters (if want to limit the max number, then `{6,12}`)
* `$/` - end of string

Reference: [Create preg_match for password validation allowing (!@#$%)](http://stackoverflow.com/questions/11873990/create-preg-match-for-password-validation-allowing#answers)

## Get query string from URL
In your controller
```php
$keyword = $this->getRequest()->getQuery('keyword');
```

Reference: [Github: zf2 / library / Zend / Http / Request.php](https://github.com/zendframework/zf2/blob/master/library/Zend/Http/Request.php#L232-L243)
