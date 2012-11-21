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
