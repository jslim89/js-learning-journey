# Lessons

## Communicate between 2 sibling

In component-sender.vue

```vue
this.$root.$emit('my-custom-event', data);
```

In component-receiver.vue

```vue
this.$root.$emit('my-custom-event', data);
```

Reference: [Communication between sibling components in VueJs 2.0](https://stackoverflow.com/questions/38616167/communication-between-sibling-components-in-vuejs-2-0/47004242#47004242)
