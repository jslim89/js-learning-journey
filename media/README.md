# Lesson

## Increase volume of a video file

```
$ ffmpeg -i input.mp4 -strict -2 -vcodec copy -af "volume=20dB" output.mp4
```

Reference:

- [How to increase volume in a video without re-encoding the video](http://breakthebit.org/post/53570840966/how-to-increase-volume-in-a-video-without)
- [“The encoder 'aac' is experimental but experimental codecs are not enabled”](http://stackoverflow.com/questions/32931685/the-encoder-aac-is-experimental-but-experimental-codecs-are-not-enabled/35247468#35247468)
