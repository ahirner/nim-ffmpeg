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
  AVVideotoolboxContext* {.bycopy.} = object
    session*: VTDecompressionSessionRef
    output_callback*: VTDecompressionOutputCallback
    cv_pix_fmt_type*: OSType
    cm_fmt_desc*: CMVideoFormatDescriptionRef
    cm_codec_type*: cint


proc av_videotoolbox_alloc_context*(): ptr AVVideotoolboxContext {.cdecl,
    importc: "av_videotoolbox_alloc_context", dynlib: avcodecdll.}
proc av_videotoolbox_default_init*(avctx: ptr AVCodecContext): cint {.cdecl,
    importc: "av_videotoolbox_default_init", dynlib: avcodecdll.}
proc av_videotoolbox_default_init2*(avctx: ptr AVCodecContext;
                                   vtctx: ptr AVVideotoolboxContext): cint {.cdecl,
    importc: "av_videotoolbox_default_init2", dynlib: avcodecdll.}
proc av_videotoolbox_default_free*(avctx: ptr AVCodecContext) {.cdecl,
    importc: "av_videotoolbox_default_free", dynlib: avcodecdll.}