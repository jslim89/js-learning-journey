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
