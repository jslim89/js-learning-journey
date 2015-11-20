# Lessons

## MassAssignmentException exception in seeder

```php
public function run()
{
    Eloquent::unguard(); // <----- Add this

    // ...
}
```

Reference: [MassAssignmentException in Laravel](http://stackoverflow.com/questions/22280136/massassignmentexception-in-laravel/25566046#25566046)
