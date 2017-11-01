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
  ../nim_ffmpeg_common, attributes


var av_sha_size* {.importc: "av_sha_size", dynlib: avutildll.}: cint

type
  AVSHA* {.bycopy.} = object
  

proc av_sha_alloc*(): ptr AVSHA {.cdecl, importc: "av_sha_alloc", dynlib: avutildll.}
proc av_sha_init*(context: ptr AVSHA; bits: cint): cint {.cdecl, importc: "av_sha_init",
    dynlib: avutildll.}
proc av_sha_update*(context: ptr AVSHA; data: ptr uint8_t; len: cuint) {.cdecl,
    importc: "av_sha_update", dynlib: avutildll.}
proc av_sha_final*(context: ptr AVSHA; digest: ptr uint8_t) {.cdecl,
    importc: "av_sha_final", dynlib: avutildll.}