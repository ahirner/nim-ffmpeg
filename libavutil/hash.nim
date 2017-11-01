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
  AVHashContext* {.bycopy.} = object
  

proc av_hash_alloc*(ctx: ptr ptr AVHashContext; name: cstring): cint {.cdecl,
    importc: "av_hash_alloc", dynlib: avutildll.}
proc av_hash_names*(i: cint): cstring {.cdecl, importc: "av_hash_names",
                                    dynlib: avutildll.}
proc av_hash_get_name*(ctx: ptr AVHashContext): cstring {.cdecl,
    importc: "av_hash_get_name", dynlib: avutildll.}
proc av_hash_get_size*(ctx: ptr AVHashContext): cint {.cdecl,
    importc: "av_hash_get_size", dynlib: avutildll.}
proc av_hash_init*(ctx: ptr AVHashContext) {.cdecl, importc: "av_hash_init",
    dynlib: avutildll.}
proc av_hash_update*(ctx: ptr AVHashContext; src: ptr uint8_t; len: cint) {.cdecl,
    importc: "av_hash_update", dynlib: avutildll.}
proc av_hash_final*(ctx: ptr AVHashContext; dst: ptr uint8_t) {.cdecl,
    importc: "av_hash_final", dynlib: avutildll.}
proc av_hash_final_bin*(ctx: ptr AVHashContext; dst: ptr uint8_t; size: cint) {.cdecl,
    importc: "av_hash_final_bin", dynlib: avutildll.}
proc av_hash_final_hex*(ctx: ptr AVHashContext; dst: ptr uint8_t; size: cint) {.cdecl,
    importc: "av_hash_final_hex", dynlib: avutildll.}
proc av_hash_final_b64*(ctx: ptr AVHashContext; dst: ptr uint8_t; size: cint) {.cdecl,
    importc: "av_hash_final_b64", dynlib: avutildll.}
proc av_hash_freep*(ctx: ptr ptr AVHashContext) {.cdecl, importc: "av_hash_freep",
    dynlib: avutildll.}