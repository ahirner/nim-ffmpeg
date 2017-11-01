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


const
  kVDADecodeInfo_Asynchronous* = 1 shl 0
  kVDADecodeInfo_FrameDropped* = 1 shl 1

type
  vda_context* {.bycopy.} = object
    decoder*: VDADecoder
    cv_buffer*: CVPixelBufferRef
    use_sync_decoding*: cint
    width*: cint
    height*: cint
    format*: cint
    cv_pix_fmt_type*: OSType
    priv_bitstream*: ptr uint8_t
    priv_bitstream_size*: cint
    priv_allocated_size*: cint
    use_ref_buffer*: cint


proc ff_vda_create_decoder*(vda_ctx: ptr vda_context; extradata: ptr uint8_t;
                           extradata_size: cint): cint {.cdecl,
    importc: "ff_vda_create_decoder", dynlib: avcodecdll.}
proc ff_vda_destroy_decoder*(vda_ctx: ptr vda_context): cint {.cdecl,
    importc: "ff_vda_destroy_decoder", dynlib: avcodecdll.}
type
  AVVDAContext* {.bycopy.} = object
    decoder*: VDADecoder
    output_callback*: VDADecoderOutputCallback
    cv_pix_fmt_type*: OSType


proc av_vda_alloc_context*(): ptr AVVDAContext {.cdecl,
    importc: "av_vda_alloc_context", dynlib: avcodecdll.}
proc av_vda_default_init*(avctx: ptr AVCodecContext): cint {.cdecl,
    importc: "av_vda_default_init", dynlib: avcodecdll.}
proc av_vda_default_init2*(avctx: ptr AVCodecContext; vdactx: ptr AVVDAContext): cint {.
    cdecl, importc: "av_vda_default_init2", dynlib: avcodecdll.}
proc av_vda_default_free*(avctx: ptr AVCodecContext) {.cdecl,
    importc: "av_vda_default_free", dynlib: avcodecdll.}