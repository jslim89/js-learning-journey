# Lessons

## Elixir copy files except some files

Copy all _js_ files except for **app.js** & **bootstrap.js**

```js
mix.copy(['resources/assets/js/*.js', '!resources/assets/js/app.js', '!resources/assets/js/bootstrap.js'], 'public/assets/js');
```

Reference: [Laravel 5 Elixir: copy all files except some](http://stackoverflow.com/questions/35845947/laravel-5-elixir-copy-all-files-except-some/39166100#39166100)
