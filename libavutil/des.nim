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
  AVDES* {.bycopy.} = object
    round_keys*: array[3, array[16, uint64_t]]
    triple_des*: cint


proc av_des_alloc*(): ptr AVDES {.cdecl, importc: "av_des_alloc", dynlib: avutildll.}
proc av_des_init*(d: ptr AVDES; key: ptr uint8_t; key_bits: cint; decrypt: cint): cint {.
    cdecl, importc: "av_des_init", dynlib: avutildll.}
proc av_des_crypt*(d: ptr AVDES; dst: ptr uint8_t; src: ptr uint8_t; count: cint;
                  iv: ptr uint8_t; decrypt: cint) {.cdecl, importc: "av_des_crypt",
    dynlib: avutildll.}
proc av_des_mac*(d: ptr AVDES; dst: ptr uint8_t; src: ptr uint8_t; count: cint) {.cdecl,
    importc: "av_des_mac", dynlib: avutildll.}