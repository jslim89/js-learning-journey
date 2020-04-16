# Lessons

## Reload table with new params

```js
function getFilters() {
    let data = {
        q: $('#q').val(),
    };
    let status = $('#status').select2('val');
    if (status) {
        data.status = status;
    }
    return data;
}

...

'ajax': {
    'url': '/path/to/data-table',
    'type': 'GET',
    'data': function (d) {
        Object.assign(d, getFilters());
        return d;
    },
    'beforeSend': function (request) {
    },
    'error': function () {
    }
},
```

Must use `function (d) { ... return d; }`

Reference: [DataTable ajax.reload()](https://datatables.net/reference/api/ajax.reload())
