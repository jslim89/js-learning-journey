# Lessons

## Match decimal value

```
/\d+(\.\d+)?/
```

- `\d+` - match 1 or more digits
- `(\.\d+)` - make a group of matches, match a `.` _(dot)_ followed by 1 or more digits
- `?` - optional to match for the preceding token

Reference: [Decimal number regular expression, where digit after decimal is optional](http://stackoverflow.com/questions/12117024/decimal-number-regular-expression-where-digit-after-decimal-is-optional/12117062#12117062)

## Match OR exact value

Let's say want to match _monthly_ or _daily_

```
/\bmonthly\b|\bdaily\b/
```

Wrap the word with `\b`, means the word has no other character in front or behind.

What if **without `\b`**? then it will matches

- _monthly_
- _daily_
- foo_monthly_
- _monthly_bar
- foo_daily_
- _daily_bar

Reference: [Alternation with The Vertical Bar or Pipe Symbol](http://www.regular-expressions.info/alternation.html)
