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


var av_camellia_size* {.importc: "av_camellia_size", dynlib: avutildll.}: cint

type
  AVCAMELLIA* {.bycopy.} = object
  

proc av_camellia_alloc*(): ptr AVCAMELLIA {.cdecl, importc: "av_camellia_alloc",
                                        dynlib: avutildll.}
proc av_camellia_init*(ctx: ptr AVCAMELLIA; key: ptr uint8_t; key_bits: cint): cint {.
    cdecl, importc: "av_camellia_init", dynlib: avutildll.}
proc av_camellia_crypt*(ctx: ptr AVCAMELLIA; dst: ptr uint8_t; src: ptr uint8_t;
                       count: cint; iv: ptr uint8_t; decrypt: cint) {.cdecl,
    importc: "av_camellia_crypt", dynlib: avutildll.}