# Lessons

## Ajax call in front-end

In javascript section
```js
$.ajax({
    // ajaxurl is only in back-end
    url: '<?php echo admin_url('admin-ajax.php'); ?>',
    data: {
        action: 'my_unique_ajax_action',
        param1: 'my query string'
    },
    success: function(data, textStatus, jqXHR) {
        console.log(data);
    },
    complete: function(jqXHR, textStatus) {
        console.log(textStatus);
    },
    error: function(jqXHR, textStatus, errorThrown) {
        console.log(errorThrown);
    }
});
```

In your **themes/awesome_theme/functions.php**
```php
if (!function_exists('ajax_my_unique_action')) {

    function ajax_my_unique_action() {
        echo json_encode(array(
            'data1' => 'foo',
            'data2' => 'bar',
        ));
        header('Content-Type: application/json');
        exit;
    }

    // when user is logged in
    add_action('wp_ajax_nopriv_my_unique_ajax_action', 'ajax_my_unique_action' );
    // when user is not logged in
    add_action( 'wp_ajax_my_unique_ajax_action', 'ajax_my_unique_action' );
}
```

Reference: [ajaxurl is not defined](http://wordpress.org/support/topic/ajaxurl-is-not-defined#post-1989445)

## Hide `Add New` submenu from custom post type

```php
function hide_add_new_custom_type() {
    global $submenu;
    // replace my_type with the name of your post type
    unset($submenu['edit.php?post_type=my_type'][10]);
}
add_action('admin_menu', 'hide_add_new_custom_type');
```

Reference: [WordPress: Disable “Add New” on Custom Post Type](http://stackoverflow.com/questions/3235257/wordpress-disable-add-new-on-custom-post-type/3248103#3248103)
