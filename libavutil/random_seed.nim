 {.deadCodeElim: on.}
when defined(windows):
  const
    avutildll* = "avutil.dll"
elif defined(macosx):
  const
    avutildll* = "libavutil.dylib"
else:
  const
    avutildll* = "libavutil.so"
import
  ../nim_ffmpeg_common


proc av_get_random_seed*(): uint32_t {.cdecl, importc: "av_get_random_seed",
                                    dynlib: avutildll.}