 {.deadCodeElim: on.}
when defined(windows):
  const
    avformatdll* = "avformat.dll"
elif defined(macosx):
  const
    avformatdll* = "libavformat.dylib"
else:
  const
    avformatdll* = "libavformat.so"
import
  ../nim_ffmpeg_common, ../libavutil/version

