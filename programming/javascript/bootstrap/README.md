# Lessons

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
