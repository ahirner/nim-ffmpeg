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
  ../nim_ffmpeg_common


type
  AVD3D11VAContext* {.bycopy.} = object
    decoder*: ptr ID3D11VideoDecoder
    video_context*: ptr ID3D11VideoContext
    cfg*: ptr D3D11_VIDEO_DECODER_CONFIG
    surface_count*: cuint
    surface*: ptr ptr ID3D11VideoDecoderOutputView
    workaround*: uint64_t
    report_id*: cuint
    context_mutex*: HANDLE


proc av_d3d11va_alloc_context*(): ptr AVD3D11VAContext {.cdecl,
    importc: "av_d3d11va_alloc_context", dynlib: avcodecdll.}