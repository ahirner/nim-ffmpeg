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


type
  AVAESCTR* {.bycopy.} = object
  

proc av_aes_ctr_alloc*(): ptr AVAESCTR {.cdecl, importc: "av_aes_ctr_alloc",
                                     dynlib: avutildll.}
proc av_aes_ctr_init*(a: ptr AVAESCTR; key: ptr uint8_t): cint {.cdecl,
    importc: "av_aes_ctr_init", dynlib: avutildll.}
proc av_aes_ctr_free*(a: ptr AVAESCTR) {.cdecl, importc: "av_aes_ctr_free",
                                     dynlib: avutildll.}
proc av_aes_ctr_crypt*(a: ptr AVAESCTR; dst: ptr uint8_t; src: ptr uint8_t; size: cint) {.
    cdecl, importc: "av_aes_ctr_crypt", dynlib: avutildll.}
proc av_aes_ctr_get_iv*(a: ptr AVAESCTR): ptr uint8_t {.cdecl,
    importc: "av_aes_ctr_get_iv", dynlib: avutildll.}
proc av_aes_ctr_set_random_iv*(a: ptr AVAESCTR) {.cdecl,
    importc: "av_aes_ctr_set_random_iv", dynlib: avutildll.}
proc av_aes_ctr_set_iv*(a: ptr AVAESCTR; iv: ptr uint8_t) {.cdecl,
    importc: "av_aes_ctr_set_iv", dynlib: avutildll.}
proc av_aes_ctr_increment_iv*(a: ptr AVAESCTR) {.cdecl,
    importc: "av_aes_ctr_increment_iv", dynlib: avutildll.}