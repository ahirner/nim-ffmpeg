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


proc av_gettime*(): int64_t {.cdecl, importc: "av_gettime", dynlib: avutildll.}
proc av_gettime_relative*(): int64_t {.cdecl, importc: "av_gettime_relative",
                                    dynlib: avutildll.}
proc av_gettime_relative_is_monotonic*(): cint {.cdecl,
    importc: "av_gettime_relative_is_monotonic", dynlib: avutildll.}
proc av_usleep*(usec: cuint): cint {.cdecl, importc: "av_usleep", dynlib: avutildll.}