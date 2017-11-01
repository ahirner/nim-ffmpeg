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


var av_cast5_size* {.importc: "av_cast5_size", dynlib: avutildll.}: cint

type
  AVCAST5* {.bycopy.} = object
  

proc av_cast5_alloc*(): ptr AVCAST5 {.cdecl, importc: "av_cast5_alloc",
                                  dynlib: avutildll.}
proc av_cast5_init*(ctx: ptr AVCAST5; key: ptr uint8_t; key_bits: cint): cint {.cdecl,
    importc: "av_cast5_init", dynlib: avutildll.}
proc av_cast5_crypt*(ctx: ptr AVCAST5; dst: ptr uint8_t; src: ptr uint8_t; count: cint;
                    decrypt: cint) {.cdecl, importc: "av_cast5_crypt",
                                   dynlib: avutildll.}
proc av_cast5_crypt2*(ctx: ptr AVCAST5; dst: ptr uint8_t; src: ptr uint8_t; count: cint;
                     iv: ptr uint8_t; decrypt: cint) {.cdecl,
    importc: "av_cast5_crypt2", dynlib: avutildll.}