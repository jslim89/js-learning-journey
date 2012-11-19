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
