# Lessons

## Match decimal value

```
/\d+(\.\d+)?/
```

- `\d+` - match 1 or more digits
- `(\.\d+)` - make a group of matches, match a `.` _(dot)_ followed by 1 or more digits
- `?` - optional to match for the preceding token

Reference: [Decimal number regular expression, where digit after decimal is optional](http://stackoverflow.com/questions/12117024/decimal-number-regular-expression-where-digit-after-decimal-is-optional/12117062#12117062)
