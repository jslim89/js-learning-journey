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

## Drop database

```sh
$ mongo <dbname> --eval "db.dropDatabase()"
```

Reference: [How do I drop a MongoDB database from the command line?](http://stackoverflow.com/questions/8857276/how-do-i-drop-a-mongodb-database-from-the-command-line/8857373#8857373)
