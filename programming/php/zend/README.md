# Lessons

## Use validator to validate password
The password requirement normally must contain at least ONE digit, ONE uppercase, ONE lowercase and at least few characters long.

```php
<?php
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
<?php
$keyword = $this->getRequest()->getQuery('keyword');
```

Reference: [Github: zf2 / library / Zend / Http / Request.php](https://github.com/zendframework/zf2/blob/master/library/Zend/Http/Request.php#L232-L243)

## Get query string in view
In layout
```php
<?php
$children = $this->viewModel()->getCurrent()->getChildren();
$variables = $children[0]->getVariables();

echo $variables['param1'];
echo $variables['param2'];
```

In view
```php
<?php
$variables = $this->viewModel()->getCurrent()->getVariables();

echo $variables['param1'];
echo $variables['param2'];
```

## Add custom error message
```php
<?php
$form->get('element')->setMessages(array(
    'foo has this error',
    'bar has another error',
    ...
));

if ($form->isValid() && !$form->get('element')->getMessages()) {
    // no more error
}
```

Reference: [Set Zend\Form Error Messages from Controller](http://stackoverflow.com/questions/12896624/set-zend-form-error-messages-from-controller#answer-12912336)

## Get config in view
First create a view helper (Refer to [here](http://jslim.net/blog/2013/04/19/zendframework-2-create-a-custom-view-helper/))

**./module/Application/src/Application/View/Helper/Config.php**
```php
<?php
namespace Application\View\Helper;

use Zend\View\Helper\AbstractHelper;

class Config extends AbstractHelper
{
    private $_sm;

    public function __construct($sm)
    {
        $this->_sm = $sm;
    }

    public function __invoke()
    {
        return $this->_sm->getServiceLocator()->get('Config');
    }
}
```

In **./module/Application/Module.php**
```php
<?php
...
public function getViewHelperConfig()
{
    return array(
        'factories' => array(
            'getConfig' => function($sm) {
                $helper = new \Application\View\Helper\Config($sm);
                return $helper;
            },
        ),
    );
}
...
```

Now you can use it in your view
```php
<div id="foo">
    <pre><?php print_r($this->getConfig()); ?></pre>
</div>
```
