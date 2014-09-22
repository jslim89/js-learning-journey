# Lessons

## Change page title

Append the site name as prefix, edit `templates/<template name>/index.php`

```php
$this->setTitle($app->getCfg('sitename') . ' - ' . $this->getTitle());
```

- `getCfg('sitename')` - get configuration variable **Site Name**

Reference: [Customising the dynamic page title](http://docs.joomla.org/Customising_the_dynamic_page_title)

## Add language options to xml form

```xml
<field name="mylanguage" type="language" client="site" default="en-GB" label="Select a language" description="" />
```

Reference: [Language form field type](http://docs.joomla.org/Language_form_field_type)
