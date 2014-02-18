# Lessons

## Align height of HTML table row

Adjust the `line-height` & `font-size`, otherwise it won't work.

Example
```html
<table cellpadding="0">
    <tr style="line-height: 5px; font-size: 4px;">
        <td>Your content here</td>
    </tr>
</table>
```

**NOTE: margin & padding properties won't work here**

Reference: [TCPDF - Is there a way to adjust single table row height?](http://stackoverflow.com/questions/19294288/tcpdf-is-there-a-way-to-adjust-single-table-row-height/19351885#19351885)
