# Lessons

## Exclude certain object to the css styling
**Original**
```html
...
<style>
  td span { border: 1px solid; display: block; }
</style>
...
<table>
  <tr><td><span class="foo">This want to be excluded from Internal Style</span></td></tr>
  <tr><td><span>This want to be follow the Internal Style</span></td></tr>
</table>
...
```
Let say I want to exclude the span with the class `foo`, just change to
```css
td span:not(.foo) { border: 1px solid; display: block; }
```

Reference: [How to exclude a CSS formatting?] (http://stackoverflow.com/questions/6585924/how-to-exclude-a-css-formatting#answers)

## Add a comma to `li` except for the last 1
```html
<ul>
    <li>alpha</li>
    <li>beta</li>
    <li>lambda</li>
    <li>kapa</li>
    <li>gamma</li>
</ul>
```
The desire output is `alpha, beta, lambda, kapa, gamma`. Add a comma to every `li` expect for the last item

```css
ul {
    line-height: 0;
}
li:not(:last-child):after {
    content: ', ';
}
```

Reference: [CSS :not(:last-child):after selector](http://stackoverflow.com/questions/5449872/css-notlast-childafter-selector)
