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
  AVRC4* {.bycopy.} = object
    state*: array[256, uint8_t]
    x*: cint
    y*: cint


proc av_rc4_alloc*(): ptr AVRC4 {.cdecl, importc: "av_rc4_alloc", dynlib: avutildll.}
proc av_rc4_init*(d: ptr AVRC4; key: ptr uint8_t; key_bits: cint; decrypt: cint): cint {.
    cdecl, importc: "av_rc4_init", dynlib: avutildll.}
proc av_rc4_crypt*(d: ptr AVRC4; dst: ptr uint8_t; src: ptr uint8_t; count: cint;
                  iv: ptr uint8_t; decrypt: cint) {.cdecl, importc: "av_rc4_crypt",
    dynlib: avutildll.}