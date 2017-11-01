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


var av_twofish_size* {.importc: "av_twofish_size", dynlib: avutildll.}: cint

type
  AVTWOFISH* {.bycopy.} = object
  

proc av_twofish_alloc*(): ptr AVTWOFISH {.cdecl, importc: "av_twofish_alloc",
                                      dynlib: avutildll.}
proc av_twofish_init*(ctx: ptr AVTWOFISH; key: ptr uint8_t; key_bits: cint): cint {.cdecl,
    importc: "av_twofish_init", dynlib: avutildll.}
proc av_twofish_crypt*(ctx: ptr AVTWOFISH; dst: ptr uint8_t; src: ptr uint8_t;
                      count: cint; iv: ptr uint8_t; decrypt: cint) {.cdecl,
    importc: "av_twofish_crypt", dynlib: avutildll.}