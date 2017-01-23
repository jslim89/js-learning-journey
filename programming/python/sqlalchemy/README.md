# Lessons

## Compare Date with DateTime

_Cast_ the **DateTime** to **Date**

```py
query = (session.query(
             Obj.user_id.label('customer_id'),
             func.count(Obj.id).label('total')
         ).
         filter(
             sqlalchemy.cast(Obj.date_time,Date) > Obj.some_date
             ).
         group_by(Obj.user_id)
         )
```

Reference: [Make Sqlalchemy Use Date In Filter Using Postgresql](http://stackoverflow.com/questions/7075828/make-sqlalchemy-use-date-in-filter-using-postgresql/7103274#7103274)


## Print sql

```py
query = (session.query(
             FooModelClass.min.label('min'),
             FooModelClass.max.label('max'),
             FooModelClass.score.label('score'),
         ).  
         filter(
             FooModelClass.min >= row.qty,
             FooModelClass.max <= row.qty
             )   
         )   
print(str(query))
```

Output:

```
SELECT foo.min AS min, foo.max AS max, foo.score AS score
FROM foo 
WHERE foo.min >= %s AND foo.max <= %s
```

Reference: [Printing actual SQLAlchemy queries](http://nicolascadou.com/blog/2014/01/printing-actual-sqlalchemy-queries/)
