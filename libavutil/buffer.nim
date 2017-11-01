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
  AVBufferRef* {.bycopy.} = object
    buffer*: ptr AVBuffer
    data*: ptr uint8_t
    size*: cint


proc av_buffer_alloc*(size: cint): ptr AVBufferRef {.cdecl,
    importc: "av_buffer_alloc", dynlib: avutildll.}
proc av_buffer_allocz*(size: cint): ptr AVBufferRef {.cdecl,
    importc: "av_buffer_allocz", dynlib: avutildll.}
proc av_buffer_create*(data: ptr uint8_t; size: cint;
                      free: proc (opaque: pointer; data: ptr uint8_t) {.cdecl.};
                      opaque: pointer; flags: cint): ptr AVBufferRef {.cdecl,
    importc: "av_buffer_create", dynlib: avutildll.}
proc av_buffer_default_free*(opaque: pointer; data: ptr uint8_t) {.cdecl,
    importc: "av_buffer_default_free", dynlib: avutildll.}
proc av_buffer_ref*(buf: ptr AVBufferRef): ptr AVBufferRef {.cdecl,
    importc: "av_buffer_ref", dynlib: avutildll.}
proc av_buffer_unref*(buf: ptr ptr AVBufferRef) {.cdecl, importc: "av_buffer_unref",
    dynlib: avutildll.}
proc av_buffer_is_writable*(buf: ptr AVBufferRef): cint {.cdecl,
    importc: "av_buffer_is_writable", dynlib: avutildll.}
proc av_buffer_get_opaque*(buf: ptr AVBufferRef): pointer {.cdecl,
    importc: "av_buffer_get_opaque", dynlib: avutildll.}
proc av_buffer_get_ref_count*(buf: ptr AVBufferRef): cint {.cdecl,
    importc: "av_buffer_get_ref_count", dynlib: avutildll.}
proc av_buffer_make_writable*(buf: ptr ptr AVBufferRef): cint {.cdecl,
    importc: "av_buffer_make_writable", dynlib: avutildll.}
proc av_buffer_realloc*(buf: ptr ptr AVBufferRef; size: cint): cint {.cdecl,
    importc: "av_buffer_realloc", dynlib: avutildll.}

proc av_buffer_pool_init*(size: cint;
                         alloc: proc (size: cint): ptr AVBufferRef {.cdecl.}): ptr AVBufferPool {.
    cdecl, importc: "av_buffer_pool_init", dynlib: avutildll.}
proc av_buffer_pool_init2*(size: cint; opaque: pointer; alloc: proc (opaque: pointer;
    size: cint): ptr AVBufferRef {.cdecl.};
                          pool_free: proc (opaque: pointer) {.cdecl.}): ptr AVBufferPool {.
    cdecl, importc: "av_buffer_pool_init2", dynlib: avutildll.}
proc av_buffer_pool_uninit*(pool: ptr ptr AVBufferPool) {.cdecl,
    importc: "av_buffer_pool_uninit", dynlib: avutildll.}
proc av_buffer_pool_get*(pool: ptr AVBufferPool): ptr AVBufferRef {.cdecl,
    importc: "av_buffer_pool_get", dynlib: avutildll.}