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
