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
  AVHMACType* {.size: sizeof(cint).} = enum
    AV_HMAC_MD5, AV_HMAC_SHA1, AV_HMAC_SHA224, AV_HMAC_SHA256, AV_HMAC_SHA384 = 12,
    AV_HMAC_SHA512



proc av_hmac_alloc*(`type`: AVHMACType): ptr AVHMAC {.cdecl, importc: "av_hmac_alloc",
    dynlib: avutildll.}
proc av_hmac_free*(ctx: ptr AVHMAC) {.cdecl, importc: "av_hmac_free", dynlib: avutildll.}
proc av_hmac_init*(ctx: ptr AVHMAC; key: ptr uint8_t; keylen: cuint) {.cdecl,
    importc: "av_hmac_init", dynlib: avutildll.}
proc av_hmac_update*(ctx: ptr AVHMAC; data: ptr uint8_t; len: cuint) {.cdecl,
    importc: "av_hmac_update", dynlib: avutildll.}
proc av_hmac_final*(ctx: ptr AVHMAC; `out`: ptr uint8_t; outlen: cuint): cint {.cdecl,
    importc: "av_hmac_final", dynlib: avutildll.}
proc av_hmac_calc*(ctx: ptr AVHMAC; data: ptr uint8_t; len: cuint; key: ptr uint8_t;
                  keylen: cuint; `out`: ptr uint8_t; outlen: cuint): cint {.cdecl,
    importc: "av_hmac_calc", dynlib: avutildll.}