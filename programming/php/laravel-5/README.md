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

## `COUNT` aggregated values with multiple conditions

Example, get the book borrowed for today, this week, this month, etc. in 1 query

```php
<?php
$today = Carbon::now()->toDateString();
$week_start = Carbon::now()->startOfWeek()->toDateString();
$week_end = Carbon::now()->endOfWeek()->toDateString();
$month_start = Carbon::now()->startOfMonth()->toDateString();
$month_end = Carbon::now()->endOfMonth()->toDateString();

$books = Book::select([
	'books.*',
	\DB::raw('COUNT(DISTINCT user_books.id) AS total_borrows'),
	\DB::raw('COUNT(DISTINCT IF(user_books.date = "' . $today . '", user_books.id, NULL)) AS today_borrows'),
	\DB::raw('COUNT(DISTINCT IF(user_books.date >= "' . $week_start . '" AND user_books.date <= "' . $week_end . '", user_books.id, NULL)) AS week_borrows'),
	\DB::raw('COUNT(DISTINCT IF(user_books.date >= "' . $month_start . '" AND user_books.date <= "' . $month_end . '", user_books.id, NULL)) AS month_borrows'),
])->join('user_books', 'user_books.book_id', '=', 'books.id')
	->groupBy('books.id')
	->get();
```
