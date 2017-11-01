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


var av_aes_size* {.importc: "av_aes_size", dynlib: avutildll.}: cint

type
  AVAES* {.bycopy.} = object
  

proc av_aes_alloc*(): ptr AVAES {.cdecl, importc: "av_aes_alloc", dynlib: avutildll.}
proc av_aes_init*(a: ptr AVAES; key: ptr uint8_t; key_bits: cint; decrypt: cint): cint {.
    cdecl, importc: "av_aes_init", dynlib: avutildll.}
proc av_aes_crypt*(a: ptr AVAES; dst: ptr uint8_t; src: ptr uint8_t; count: cint;
                  iv: ptr uint8_t; decrypt: cint) {.cdecl, importc: "av_aes_crypt",
    dynlib: avutildll.}