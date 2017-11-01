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


var av_tea_size* {.importc: "av_tea_size", dynlib: avutildll.}: cint

type
  AVTEA* {.bycopy.} = object
  

proc av_tea_alloc*(): ptr AVTEA {.cdecl, importc: "av_tea_alloc", dynlib: avutildll.}
proc av_tea_init*(ctx: ptr AVTEA; key: array[16, uint8_t]; rounds: cint) {.cdecl,
    importc: "av_tea_init", dynlib: avutildll.}
proc av_tea_crypt*(ctx: ptr AVTEA; dst: ptr uint8_t; src: ptr uint8_t; count: cint;
                  iv: ptr uint8_t; decrypt: cint) {.cdecl, importc: "av_tea_crypt",
    dynlib: avutildll.}