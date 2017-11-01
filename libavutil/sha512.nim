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


var av_sha512_size* {.importc: "av_sha512_size", dynlib: avutildll.}: cint

type
  AVSHA512* {.bycopy.} = object
  

proc av_sha512_alloc*(): ptr AVSHA512 {.cdecl, importc: "av_sha512_alloc",
                                    dynlib: avutildll.}
proc av_sha512_init*(context: ptr AVSHA512; bits: cint): cint {.cdecl,
    importc: "av_sha512_init", dynlib: avutildll.}
proc av_sha512_update*(context: ptr AVSHA512; data: ptr uint8_t; len: cuint) {.cdecl,
    importc: "av_sha512_update", dynlib: avutildll.}
proc av_sha512_final*(context: ptr AVSHA512; digest: ptr uint8_t) {.cdecl,
    importc: "av_sha512_final", dynlib: avutildll.}