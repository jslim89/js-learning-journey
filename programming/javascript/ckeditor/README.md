# Lessons

## Remove the control at the bottom bar (i.e. `body`)
```js
CKEDITOR.config.removePlugins = 'elementspath';
```

Reference: [Remove status bar from CKEditor](http://stackoverflow.com/questions/2001812/remove-status-bar-from-ckeditor/2001867#2001867)

## Configure toolbar
```js
CKEDITOR.config.toolbar =
[
    { name: 'basicstyles', items : [ 'Bold','Italic','Underline' ] },
    { name: 'paragraph', items : [ 'NumberedList','BulletedList' ] }   
]
```

## Edit html source code

```js
CKEDITOR.config.toolbar =
[
    ...
    { name: 'document', items : [ 'Source' ] }
]
```
