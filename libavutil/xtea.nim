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


type
  AVXTEA* {.bycopy.} = object
    key*: array[16, uint32_t]


proc av_xtea_alloc*(): ptr AVXTEA {.cdecl, importc: "av_xtea_alloc", dynlib: avutildll.}
proc av_xtea_init*(ctx: ptr AVXTEA; key: array[16, uint8_t]) {.cdecl,
    importc: "av_xtea_init", dynlib: avutildll.}
proc av_xtea_le_init*(ctx: ptr AVXTEA; key: array[16, uint8_t]) {.cdecl,
    importc: "av_xtea_le_init", dynlib: avutildll.}
proc av_xtea_crypt*(ctx: ptr AVXTEA; dst: ptr uint8_t; src: ptr uint8_t; count: cint;
                   iv: ptr uint8_t; decrypt: cint) {.cdecl, importc: "av_xtea_crypt",
    dynlib: avutildll.}
proc av_xtea_le_crypt*(ctx: ptr AVXTEA; dst: ptr uint8_t; src: ptr uint8_t; count: cint;
                      iv: ptr uint8_t; decrypt: cint) {.cdecl,
    importc: "av_xtea_le_crypt", dynlib: avutildll.}