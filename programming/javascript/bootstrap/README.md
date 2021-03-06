# Bootstrap 2

## autocomplete with Ajax
```js
$(function() {
    $('#textboxid').typeahead({
        minLength: 1,
        source: function(query, process) {
            return $.getJSON('/path/to/ajax/source', {query: query}, function(data) {
                var compiledData = [];
                $.each(data, function() {
                    compiledData.push(this.name);
                });
                return process(compiledData);
            });
        },
    });
});
```
Where the data source is
```json
[
    {'id': 1, 'name': 'Foo'},
    {'id': 2, 'name': 'Bar'},
    {'id': 3, 'name': 'FooBar'},
    ...
]
```

Reference: [Ajax call populate Typeahead Bootstrap](http://stackoverflow.com/questions/12621823/ajax-call-populate-typeahead-bootstrap#answer-12622276)

# Bootstrap 3

## Callback event on navbar show/hide
```js
$('.navbar-collapse').on('shown.bs.collapse', function() {
    alert('shown');
});
$('.navbar-collapse').on('hidden.bs.collapse', function() {
    alert('hidden');
});
```
There are 4 events
```
show.bs.collapse
shown.bs.collapse
hide.bs.collapse
hidden.bs.collapse
```

Reference: [Bootstrap on collapse event](http://stackoverflow.com/questions/10641646/bootstrap-on-collapse-event/21353717#21353717)

# Bootstrap 4

## Multi-modal not scrollable

When open 1st modal, it's scrollable;
When open 2nd modal, it's scrollable;
When close the 2nd modal, the 1st modal become not scrollable.

Here's the fix

```js
$('body').on('hidden.bs.modal', '.modal', function (e) {
    if ($('.modal:visible').length) {
        $('body').addClass('modal-open');
    }
});
```

Reference: [Scrolling issues with multiple bootstrap modals](https://stackoverflow.com/questions/36460538/scrolling-issues-with-multiple-bootstrap-modals)
