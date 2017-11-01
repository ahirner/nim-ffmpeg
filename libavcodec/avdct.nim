 {.deadCodeElim: on.}
when defined(windows):
  const
    avcodecdll* = "avcodec.dll"
elif defined(macosx):
  const
    avcodecdll* = "libavcodec.dylib"
else:
  const
    avcodecdll* = "libavcodec.so"
import
  ../nim_ffmpeg_common, ../libavutil/opt


type
  AVDCT* {.bycopy.} = object
    av_class*: ptr AVClass
    idct*: proc (`block`: ptr int16_t) {.cdecl.}
    idct_permutation*: array[64, uint8_t]
    fdct*: proc (`block`: ptr int16_t) {.cdecl.}
    dct_algo*: cint
    idct_algo*: cint
    get_pixels*: proc (`block`: ptr int16_t; pixels: ptr uint8_t; line_size: ptrdiff_t) {.
        cdecl.}
    bits_per_sample*: cint


proc avcodec_dct_alloc*(): ptr AVDCT {.cdecl, importc: "avcodec_dct_alloc",
                                   dynlib: avcodecdll.}
proc avcodec_dct_init*(a2: ptr AVDCT): cint {.cdecl, importc: "avcodec_dct_init",
    dynlib: avcodecdll.}
proc avcodec_dct_get_class*(): ptr AVClass {.cdecl, importc: "avcodec_dct_get_class",
    dynlib: avcodecdll.}