 {.deadCodeElim: on.}
when defined(windows):
  const
    swscaledll* = "swscale.dll"
elif defined(macosx):
  const
    swscaledll* = "libswscale.dylib"
else:
  const
    swscaledll* = "libswscale.so"
import
  ../nim_ffmpeg_common, ../libavutil/version

