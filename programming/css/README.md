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

## CSS3 odd & even
Take a table rows as example
```css
table tr:nth-child(even) {
    background-color: #dfdfdf;
}
table tr:nth-child(odd) {
    background-color: #b38a2f;
}
```

Reference: [EVEN AND ODD RULES](http://www.w3.org/Style/Examples/007/evenodd.en.html)

## Position a `div` on top of `img`

```html
<div id="container">
    <img src="http://example.com/img.jpg">
    <div id="inner">This is my div</div>div>
</img>div>
```

Set the container position to `relative`, and the inner div to `absolute`.
```css
#container {
    position: relative;    
}

#inner {
   position: absolute;
   top: 10px; // position y
   left: 10px; // position x
    
   padding: 5px;
   background-color: white;
   border: 2px solid red;
}
```

Reference: [position a div on top of an image](http://stackoverflow.com/questions/4218204/position-a-div-on-top-of-an-image/4218306#4218306)

## Background image 100%
```css
#wrapper {
    background: url('../img/bg.jpg') no-repeat center center fixed; 
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
```

Reference: [Perfect Full Page Background Image](http://css-tricks.com/perfect-full-page-background-image/)

## Add border to text
Add white border with 2px width
```css
text-shadow: 2px 0 0 #fff, -2px 0 0 #fff, 0 2px 0 #fff, 0 -2px 0 #fff, 1px 1px #fff, -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff;
```

Reference: [Text border using css (border around text)](http://stackoverflow.com/questions/13426875/text-border-using-css-border-around-text/13427256#13427256)

## Set 100% height by CSS only

Set the height of a `div` relative to `body`

```css
#slideshow {
    height: 100vh;
}
```

Reference: [How to Make Div Element 100% Height of Browser Window Using CSS Only](http://stanislav.it/how-to-make-div-element-100-height-of-browser-window-using-css-only/)

## Google map zoom control not showing properly
```css
.gmnoprint img {
    max-width: none; 
}
```

Reference: [google map zoom controls not displaying correctly](https://stackoverflow.com/questions/9904379/google-map-zoom-controls-not-displaying-correctly/18723355#18723355)
