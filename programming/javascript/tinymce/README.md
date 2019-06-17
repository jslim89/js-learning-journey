# Lessons

## Add in custom button with input textbox

```js
tinymce.init({
    toolbar1: 'undo redo .... insertcontent',
    setup: function (editor) {
        editor.addButton('insertcontent', {
            tooltip: 'Insert content',
            text: 'Content',
            icon: false,
            onclick: function (e) {
                editor.windowManager.open({
                    title: 'Insert Content',
                    body: [
                        {   type: 'textbox',
                            size: 150,
                            height: '100px',
                            name: 'content',
                            label: 'Content'
                        }
                    ],
                    onsubmit: function(e) {
                        tinyMCE.activeEditor.insertContent(e.data.content);
                    }
                });
            }
        });
    },
});
```
