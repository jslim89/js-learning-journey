# Lessons

## Search
```
// change database
> use mydb
switched to db mydb
> db.user.find({'name': 'John Smith'}); // find the user with name "John Smith"
```

## Update a query
```
// db.collection.update(criteria, value to set, upsert, multi)
> db.user.update({'name': 'John Smith'}, {$set: {email: 'john.smith@example.com'}, false, true)
```

Reference: [Add new field to a collection in MongoDB](http://stackoverflow.com/questions/7714216/add-new-field-to-a-collection-in-mongodb/7714428#7714428)
