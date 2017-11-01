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
  ../nim_ffmpeg_common, avcodec


type
  AVMediaCodecContext* {.bycopy.} = object
    surface*: pointer


proc av_mediacodec_alloc_context*(): ptr AVMediaCodecContext {.cdecl,
    importc: "av_mediacodec_alloc_context", dynlib: avcodecdll.}
proc av_mediacodec_default_init*(avctx: ptr AVCodecContext;
                                ctx: ptr AVMediaCodecContext; surface: pointer): cint {.
    cdecl, importc: "av_mediacodec_default_init", dynlib: avcodecdll.}
proc av_mediacodec_default_free*(avctx: ptr AVCodecContext) {.cdecl,
    importc: "av_mediacodec_default_free", dynlib: avcodecdll.}
type
  AVMediaCodecBuffer* = MediaCodecBuffer

proc av_mediacodec_release_buffer*(buffer: ptr AVMediaCodecBuffer; render: cint): cint {.
    cdecl, importc: "av_mediacodec_release_buffer", dynlib: avcodecdll.}