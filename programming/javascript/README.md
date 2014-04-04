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

## Get total row in a table
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
**OR** using callback function
```js
var str = "abc_efg";
var new_str = str.replace(/([A-Za-z]+)_([A-Za-z]+)/, function(s, p1, p2) {
    // p1 refer to first submatch (i.e. abc), p2 refer to second submatch (i.e. efg)
    return [p1, p2].join('-');
});
document.write(new_str); // abc-efg
```

* `[A-Za-z]` - only match alphabet excluding underscore **(_)**
* `(.....)` - keep the text inside the parenthesis into a variable _(`$1` in this case as it is the first parenthesis, if second then use `$2`)_
* `\d` - match only integer
* `+` - one or more occurance

References:

- [Using Parenthesized Substring Matches](http://www.websina.com/bugzero/kb/regexp.html#1008659)
- [replace](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/String/replace#Specifying_a_function_as_a_parameter)

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

## Store $.ajax result to global variable
```js
function foo(arg1, arg2) {
    var bar;

    $.ajax({
        type: 'POST',
        url: '/path/to/action.php',
        data: {
            param1: arg1,
            param2: arg2
        },
        success: function(data) {
            bar = data.bar;
        },
        complete: function(jqXHR, textStatus) {
            alert(textStatus);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert(errorThrown);
        },
        async: false // force the client to wait
    });

    return bar;
}
```
By setting `async` to `false`, so it won't continue to run until the request is completed.

Reference: [JavaScript: Global variables after Ajax requests](http://stackoverflow.com/questions/3222347/javascript-global-variables-after-ajax-requests#answers)

## Get selected text from dropdown list
```js
$('#dropdown :selected').text();
```

Reference: [jquery get label value from dropdown](http://stackoverflow.com/questions/3838965/jquery-get-label-value-from-dropdown#answer-3838982)

## jQuery - add a wrapper to element
Initial
```html
<div class="inner">Some content</div>
```
Add a wrapper via jQuery
```js
$('.inner').wrapAll($('<div></div>').addClass('outer'));
```

Page rendered
```html
<div class="outer">
    <div class="inner">Some content</div>
</div>
```

Reference: [jquery add wrapper divs around 2 divs where content can be varient length](http://stackoverflow.com/questions/12343960/jquery-add-wrapper-divs-around-2-divs-where-content-can-be-varient-length#answers)

## Match certain text via RegEx
Example to retrive the element name from HTML text.
```js
var str = '<input class="required" type="text" value="" required="required" placeholder="First Name" name="first_name">'; 
var result = str.match(/name="(\w+)"/);
/*
 *  result[0] => 'name: "first_name"'
 *  result[1] => 'first_name'
 */
```

Reference: [JavaScript match() Method](http://www.w3schools.com/jsref/jsref_match.asp)

## Remove next element
In jQuery
```js
$('#foo').next().remove();
```
In pure JavaScript
```js
// store the DOM object into a variable
var fooObject = document.getElementById('foo');
// store the next object into a variable
var nextElement = fooObject.nextSibling;
// access the parent element and remove the next element by removeChild method
fooObject.parentNode.removeChild(nextElement);
```

Reference: [JavaScript: remove element by id](http://stackoverflow.com/questions/3387427/javascript-remove-element-by-id)

## Access class variable inside callback function
Example here:
```js
function Foo() {
    this.username = 'mr foo';

    this.loadSomeDataFromServer = function(url) {
        $.ajax({
            url: url,
            success: function(data) {
                // LOOK AT HERE
                var text = 'Dear ' + this.username + '\n';
                text += data;

                alert(text);
            }
        });
    }
}
```
You're not able to get the actual value from `this.username`, as the word `this` is refer to the **success function**, in order to use the variable, create a **`that`** variable

```js
function Foo() {
    // LOOK AT HERE
    var that = this;

    this.username = 'mr foo';

    this.loadSomeDataFromServer = function(url) {
        $.ajax({
            url: url,
            success: function(data) {
                // NOW YOU SHOULD BE ABLE TO GET THE RIGHT username
                var text = 'Dear ' + that.username + '\n';
                text += data;

                alert(text);
            }
        });
    }
}
```

Reference: [javascript class variable scope in callback function](http://stackoverflow.com/questions/8317724/javascript-class-variable-scope-in-callback-function#answers)

## jQuery ajax request from other domain
There are no error, textStatus is `0`, finally I solved it using `jsonp`

```js
$.ajax({
    url: 'http://otherdomain.com/api.php',
    type: 'GET',
    dataType: 'jsonp',  // <----- IMPORTANT
    data: {
        param1: 'foo',
        param2: 'bar'
    },
    success: function(data) {
        console.log(data);
    },
    complete: function(jqXHR, textStatus) {
        alert(textStatus);
    },
    error: function(jqXHR, textStatus, errorThrown) {
        alert(errorThrown);
    }
});
```

Reference: [JQuery ajax cross domain](http://stackoverflow.com/questions/3506208/jquery-ajax-cross-domain/3506306#3506306)

## jQuery check if method exists
```js
// check before use it
if (!!$.prototype.functionName) {
    $('#dom-id').functionName();
}
```

Reference: [jQuery test for whether an object has a method?](http://stackoverflow.com/questions/5108832/jquery-test-for-whether-an-object-has-a-method/5108845#5108845)

## Trigger dropdown on change event by jQuery
```js
$('#dropdown').change();
```

Reference: [How to select jQuery drop down val() AND trigger the event?](http://stackoverflow.com/questions/5808180/how-to-select-jquery-drop-down-val-and-trigger-the-event/5808221#5808221)

## jQuery check is dropdown contain a value
```js
if ($('#dropdown > option[value="foo"]').length > 0) {
    alert('The dropdown menu contains a "Foo" value');
}
```

Reference: [how to check a dropdown has a value in jquery?](http://stackoverflow.com/questions/9079353/how-to-check-a-dropdown-has-a-value-in-jquery/9079421#9079421)

## Get image width & height
```js
function getImgSize(imgSrc) {
    var newImg = new Image();

    newImg.onload = function() {
        var height = newImg.height;
        var width = newImg.width;
        console.log('The image size is '+width+' x '+height);
    }

    newImg.src = imgSrc; // this must be done AFTER setting onload
}
```

Reference: [Determine original size of image cross browser?](http://stackoverflow.com/questions/1944280/determine-original-size-of-image-cross-browser/1944298#1944298)

## Prepend zero in front like `sprintf` in PHP
i.e. get the result like `sprintf('%03d' 3)`
```js
var someInteger = 3;
// add 3 '0' in front of it, then get the last 3 characters
('0' + someInteger).slice(-3);
```

Reference: [How to prepend a zero in front of any number below 10 in Javascript using Regexp](http://stackoverflow.com/questions/8169785/how-to-prepend-a-zero-in-front-of-any-number-below-10-in-javascript-using-regexp/8169833#8169833)

## Clear file input element with jQuery

```js
$('#myfile').wrap('<form>').closest('form').get(0).reset();
$('#myfile').unwrap();
```

Reference: [Clearing <input type='file' /> using jQuery](http://stackoverflow.com/questions/1043957/clearing-input-type-file-using-jquery/13351234#13351234)

## delegate & datepicker on text field
```js
$('#wrapper').delegate('#birthday', 'focusin', function() {
   $(this).datepicker({
        dateFormat: 'yy-mm-dd'
    });
});
```

Reference: [JQuery: delegate and datepicker](http://stackoverflow.com/questions/7313573/jquery-delegate-and-datepicker/7313723#7313723)
