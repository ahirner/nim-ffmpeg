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
  AVBlowfish* {.bycopy.} = object
    p*: array[16 + 2, uint32_t]
    s*: array[4, array[256, uint32_t]]


proc av_blowfish_alloc*(): ptr AVBlowfish {.cdecl, importc: "av_blowfish_alloc",
                                        dynlib: avutildll.}
proc av_blowfish_init*(ctx: ptr AVBlowfish; key: ptr uint8_t; key_len: cint) {.cdecl,
    importc: "av_blowfish_init", dynlib: avutildll.}
proc av_blowfish_crypt_ecb*(ctx: ptr AVBlowfish; xl: ptr uint32_t; xr: ptr uint32_t;
                           decrypt: cint) {.cdecl,
    importc: "av_blowfish_crypt_ecb", dynlib: avutildll.}
proc av_blowfish_crypt*(ctx: ptr AVBlowfish; dst: ptr uint8_t; src: ptr uint8_t;
                       count: cint; iv: ptr uint8_t; decrypt: cint) {.cdecl,
    importc: "av_blowfish_crypt", dynlib: avutildll.}