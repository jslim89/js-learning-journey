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
