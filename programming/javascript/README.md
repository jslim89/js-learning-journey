# Lessons

## Check whether a function exists
```js
if(typeof functionName == 'function') {
    /* Your code here */
}
```

Reference: [Check if a Javascript Function Exists or Is Defined] (http://www.idealog.us/2007/02/check_if_a_java.html)

## Validation using RegExp
Example, to validate a **Year**:
```js
var year = 2012;
var myRegex = /^\d{4}$/;
if(myRegex.test(year)) {
    alert('Is a valid year');
}
```
`/^` indicate a beginning of the pattern  
`$/` indicate an ending of the pattern  
`\d` refer to integer  
`{4}` exactly 4 occurance must matched

Reference: [JavaScript - Test for an integer] (http://stackoverflow.com/questions/1019515/javascript-test-for-an-integer#answers)

## Check whether a function exists
```js
var totalRows = document.getElementById('tableId').getElementsByTagName('tr').length;
```

Reference: [Obtain the number of rows in a table] (http://www.delphifaq.com/faq/f771.shtml)

## Replace text with submatch (parenthesis)
Change a text **abc_123** to **abc_321**
```js
var str = "abc_123";
var new_str = str.replace(/([A-Za-z]+)_\d+/, "$1_321");
document.write(new_str); // abc_321
```
* `[A-Za-z]` - only match alphabet excluding underscore **(_)**
* `(.....)` - keep the text inside the parenthesis into a variable _(`$1` in this case as it is the first parenthesis, if second then use `$2`)_
* `\d` - match only integer
* `+` - one or more occurance

Reference: [Using Parenthesized Substring Matches] (http://www.websina.com/bugzero/kb/regexp.html#1008659)

## Change element's ID
```js
document.getElementById('originalId').id = "newId";
```

Reference: [How do I change the ID of a HTML element with JavaScript?] (http://stackoverflow.com/questions/1650299/how-do-i-change-the-id-of-a-html-element-with-javascript)

## For each row in table
```js
var rows = document.getElementById('tableName').rows;
for(rowIndex in rows) {
    if(/^\d+$/.test(rowIndex)) {
        /*
        Your code here, accessed by rows[rowIndex]
        i.e. rows[rowIndex].id = "resetNewId";
        */
    }
}
```
**NOTE**  
`if(/^\d+$/.test(rowIndex))` is to get only the integer index, because in `document.getElementById('tableName').rows` there are extra 3 attributes: `length`, `item` and `namedItem`. I just want to ignore this 3 attributes. Since the indexes are all integer, so I use regular expression to filter it.

Reference: [How do I iterate through table rows and cells in javascript?] (http://stackoverflow.com/questions/3065342/how-do-i-iterate-through-table-rows-and-cells-in-javascript#answers)

## Remove DOM element attribute
```js
document.getElementById('elementId').removeAttribute('class');
```

Reference: [DOM Element removeAttribute() Method](http://www.w3schools.com/jsref/met_element_removeattribute.asp)

## Binding event on future (i.e. add row) using jQuery
If you have an **Add Row** function, the normal binding doesn't affected. i.e.
```js
$(function() {
    $('.row-div').click(function() {
        // This doesn't work
        alert('added a new row');
    });
});
```
The example above doesn't work because it already binded when the page loaded, thus the elements after added doesn't bind. In order for this to work, use `delegate`
```js
$(function() {
    $('.parent-element').delegate('.row-div', 'click', function() {
        // This work
        alert('added a new row');
    });
});
```

Reference: [jQuery - .delegate()](http://api.jquery.com/delegate/)

## Disable a hyperlink and resume it back when is needed using jQuery
**Disable:** This cannot be done by `disabled` attribute
```js
$(function() {
    $('a#hyperlink').click(function (e) {
        // To avoid its default behavior
        e.preventDefault();
    });
});
```
**Resume:** There is no way to resume this, but you can _hack_ on it.
```js
$(function() {
    $('a#hyperlink').click(function() {
        window.location.href = $(this).attr('href');
    });
});
```

References:  
* [jQuery disable a link](http://stackoverflow.com/questions/970388/jquery-disable-a-link#answers)
* [When the user clicks an element: Prevent default action, present menu(s), then resume default action when menu is clicked](http://stackoverflow.com/questions/3964548/when-the-user-clicks-an-element-prevent-default-action-present-menus-then-r#answers)

## Select second child element using jQuery
```html
<div id="main-div">
    <div>Some text here</div>
    <div>Some <em>description</em> here</div>
</div>
```
Let say you want to access the second `div`
```js
var contentHtml = $('div#main-div').children().eq(1).html();
alert(contentHtml);
```
Output will be:
```
Some <em>description</em> here
```
**Note:** `eq(1)` the digit inside the `eq` is refer to index which is start with **0**

Reference: [jQuery, get second child](http://stackoverflow.com/questions/4727263/jquery-get-second-child#answers)

## Remove all inside a DOM element using jQuery
```js
// Easiest way
$('#foo').html('');

// Other way
$('#foo').empty();
```

References:  
* [What is the fastest way to remove child elements from the DOM in IE?](http://stackoverflow.com/questions/2298927/what-is-the-fastest-way-to-remove-child-elements-from-the-dom-in-ie#answers)
* [jQuery - .empty()](http://api.jquery.com/empty/)

## Access the content of style using jQuery
```js
// Set the height value to 100px
$('#foo').css('height', '100px');

// Get the height value
var height = $('#foo').css('height');
```

Reference: [jQuery - .css()](http://api.jquery.com/css/)

## Select elements with `:not` operator using jQuery
Let say we have an html
```html
<ul>
    <li class="foo">I don't want this</li>
    <li class="bar">I don't want this as well</li>
    <li>I just want this</li>
    <li>this</li>
    <li>and this</li>
</ul>
```

In jQuery
```js
$(function() {
    $('ul li:not([class=foo]):not([class=bar])').each(function(index) {
        // do something here
    });
});
```

Reference: [jQuery get all divs which do not have class attribute](http://stackoverflow.com/questions/1962247/jquery-get-all-divs-which-do-not-have-class-attribute#answer-1962250)
