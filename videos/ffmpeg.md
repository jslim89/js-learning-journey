# Lessons

## Convert mp4 to gif

```sh
$ ffmpeg -i input.mp4 -vf "fps=10,scale=320:-1" -loop 0 output.gif
```

Reference: [How do I convert a video to GIF using ffmpeg, with reasonable quality?](https://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality/556031#556031)

## Reduce video size

Reduce video resolution to 1/3 of it's original

```sh
$ ffmpeg -i XS-race-2019.mp4 -vf "scale=iw/3:ih/3" a_third_the_frame_size.mp4
```

Reference: [How can I reduce a video's size with ffmpeg?](https://unix.stackexchange.com/questions/28803/how-can-i-reduce-a-videos-size-with-ffmpeg/447521#447521)
