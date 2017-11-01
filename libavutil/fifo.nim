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
  ../nim_ffmpeg_common, avutil, attributes


type
  AVFifoBuffer* {.bycopy.} = object
    buffer*: ptr uint8_t
    rptr*: ptr uint8_t
    wptr*: ptr uint8_t
    `end`*: ptr uint8_t
    rndx*: uint32_t
    wndx*: uint32_t


proc av_fifo_alloc*(size: cuint): ptr AVFifoBuffer {.cdecl, importc: "av_fifo_alloc",
    dynlib: avutildll.}
proc av_fifo_alloc_array*(nmemb: csize; size: csize): ptr AVFifoBuffer {.cdecl,
    importc: "av_fifo_alloc_array", dynlib: avutildll.}
proc av_fifo_free*(f: ptr AVFifoBuffer) {.cdecl, importc: "av_fifo_free",
                                      dynlib: avutildll.}
proc av_fifo_freep*(f: ptr ptr AVFifoBuffer) {.cdecl, importc: "av_fifo_freep",
    dynlib: avutildll.}
proc av_fifo_reset*(f: ptr AVFifoBuffer) {.cdecl, importc: "av_fifo_reset",
                                       dynlib: avutildll.}
proc av_fifo_size*(f: ptr AVFifoBuffer): cint {.cdecl, importc: "av_fifo_size",
    dynlib: avutildll.}
proc av_fifo_space*(f: ptr AVFifoBuffer): cint {.cdecl, importc: "av_fifo_space",
    dynlib: avutildll.}
proc av_fifo_generic_peek_at*(f: ptr AVFifoBuffer; dest: pointer; offset: cint;
                             buf_size: cint; `func`: proc (a2: pointer; a3: pointer;
    a4: cint) {.cdecl.}): cint {.cdecl, importc: "av_fifo_generic_peek_at",
                             dynlib: avutildll.}
proc av_fifo_generic_peek*(f: ptr AVFifoBuffer; dest: pointer; buf_size: cint; `func`: proc (
    a2: pointer; a3: pointer; a4: cint) {.cdecl.}): cint {.cdecl,
    importc: "av_fifo_generic_peek", dynlib: avutildll.}
proc av_fifo_generic_read*(f: ptr AVFifoBuffer; dest: pointer; buf_size: cint; `func`: proc (
    a2: pointer; a3: pointer; a4: cint) {.cdecl.}): cint {.cdecl,
    importc: "av_fifo_generic_read", dynlib: avutildll.}
proc av_fifo_generic_write*(f: ptr AVFifoBuffer; src: pointer; size: cint; `func`: proc (
    a2: pointer; a3: pointer; a4: cint): cint {.cdecl.}): cint {.cdecl,
    importc: "av_fifo_generic_write", dynlib: avutildll.}
proc av_fifo_realloc2*(f: ptr AVFifoBuffer; size: cuint): cint {.cdecl,
    importc: "av_fifo_realloc2", dynlib: avutildll.}
proc av_fifo_grow*(f: ptr AVFifoBuffer; additional_space: cuint): cint {.cdecl,
    importc: "av_fifo_grow", dynlib: avutildll.}
proc av_fifo_drain*(f: ptr AVFifoBuffer; size: cint) {.cdecl, importc: "av_fifo_drain",
    dynlib: avutildll.}
proc av_fifo_peek2*(f: ptr AVFifoBuffer; offs: cint): ptr uint8_t {.inline, cdecl.} =
  var `ptr`: ptr uint8_t
  if `ptr` >= f.`end`: `ptr` = f.buffer + (`ptr` - f.`end`)
  elif `ptr` < f.buffer: `ptr` = f.`end` - (f.buffer - `ptr`)
  return `ptr`
