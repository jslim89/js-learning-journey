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

## Get remote IP address

```php
<?php
$request->server->get('HTTP_X_FORWARDED_FOR', $request->ip())
```

## Get database table last insert ID without insert record

```php
<?php
$table_status = \DB::select('SHOW TABLE STATUS FROM ' . env('DB_DATABASE') . ' WHERE Name = "table_name"');
if (empty($table_status)) {
	throw new \Exception('Table not found');
}
$last_id = $table_status[0]->Auto_increment;
```
