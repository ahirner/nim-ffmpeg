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


proc av_murmur3_alloc*(): ptr AVMurMur3 {.cdecl, importc: "av_murmur3_alloc",
                                      dynlib: avutildll.}
proc av_murmur3_init_seeded*(c: ptr AVMurMur3; seed: uint64_t) {.cdecl,
    importc: "av_murmur3_init_seeded", dynlib: avutildll.}
proc av_murmur3_init*(c: ptr AVMurMur3) {.cdecl, importc: "av_murmur3_init",
                                      dynlib: avutildll.}
proc av_murmur3_update*(c: ptr AVMurMur3; src: ptr uint8_t; len: cint) {.cdecl,
    importc: "av_murmur3_update", dynlib: avutildll.}
proc av_murmur3_final*(c: ptr AVMurMur3; dst: array[16, uint8_t]) {.cdecl,
    importc: "av_murmur3_final", dynlib: avutildll.}