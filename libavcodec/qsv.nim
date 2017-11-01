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
  ../nim_ffmpeg_common, ../libavutil/buffer


type
  AVQSVContext* {.bycopy.} = object
    session*: mfxSession
    iopattern*: cint
    ext_buffers*: ptr ptr mfxExtBuffer
    nb_ext_buffers*: cint
    opaque_alloc*: cint
    nb_opaque_surfaces*: cint
    opaque_surfaces*: ptr AVBufferRef
    opaque_alloc_type*: cint


proc av_qsv_alloc_context*(): ptr AVQSVContext {.cdecl,
    importc: "av_qsv_alloc_context", dynlib: avcodecdll.}