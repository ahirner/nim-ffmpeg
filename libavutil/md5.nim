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


var av_md5_size* {.importc: "av_md5_size", dynlib: avutildll.}: cint

type
  AVMD5* {.bycopy.} = object
  

proc av_md5_alloc*(): ptr AVMD5 {.cdecl, importc: "av_md5_alloc", dynlib: avutildll.}
proc av_md5_init*(ctx: ptr AVMD5) {.cdecl, importc: "av_md5_init", dynlib: avutildll.}
proc av_md5_update*(ctx: ptr AVMD5; src: ptr uint8_t; len: cint) {.cdecl,
    importc: "av_md5_update", dynlib: avutildll.}
proc av_md5_final*(ctx: ptr AVMD5; dst: ptr uint8_t) {.cdecl, importc: "av_md5_final",
    dynlib: avutildll.}
proc av_md5_sum*(dst: ptr uint8_t; src: ptr uint8_t; len: cint) {.cdecl,
    importc: "av_md5_sum", dynlib: avutildll.}