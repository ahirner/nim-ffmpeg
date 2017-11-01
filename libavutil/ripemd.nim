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


var av_ripemd_size* {.importc: "av_ripemd_size", dynlib: avutildll.}: cint

type
  AVRIPEMD* {.bycopy.} = object
  

proc av_ripemd_alloc*(): ptr AVRIPEMD {.cdecl, importc: "av_ripemd_alloc",
                                    dynlib: avutildll.}
proc av_ripemd_init*(context: ptr AVRIPEMD; bits: cint): cint {.cdecl,
    importc: "av_ripemd_init", dynlib: avutildll.}
proc av_ripemd_update*(context: ptr AVRIPEMD; data: ptr uint8_t; len: cuint) {.cdecl,
    importc: "av_ripemd_update", dynlib: avutildll.}
proc av_ripemd_final*(context: ptr AVRIPEMD; digest: ptr uint8_t) {.cdecl,
    importc: "av_ripemd_final", dynlib: avutildll.}