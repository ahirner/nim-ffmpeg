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
  ../nim_ffmpeg_common, ../libavutil/attributes, avcodec


type
  AVCodecContext* {.bycopy.} = object
  
  AVFrame* {.bycopy.} = object
  
  AVVDPAU_Render2* = proc (a2: ptr AVCodecContext; a3: ptr AVFrame;
                        a4: ptr VdpPictureInfo; a5: uint32_t;
                        a6: ptr VdpBitstreamBuffer): cint {.cdecl.}
  AVVDPAUContext* {.bycopy.} = object
    decoder*: VdpDecoder
    render*: ptr VdpDecoderRender
    render2*: AVVDPAU_Render2


proc av_alloc_vdpaucontext*(): ptr AVVDPAUContext {.cdecl,
    importc: "av_alloc_vdpaucontext", dynlib: avcodecdll.}
proc av_vdpau_hwaccel_get_render2*(a2: ptr AVVDPAUContext): AVVDPAU_Render2 {.cdecl,
    importc: "av_vdpau_hwaccel_get_render2", dynlib: avcodecdll.}
proc av_vdpau_hwaccel_set_render2*(a2: ptr AVVDPAUContext; a3: AVVDPAU_Render2) {.
    cdecl, importc: "av_vdpau_hwaccel_set_render2", dynlib: avcodecdll.}
proc av_vdpau_bind_context*(avctx: ptr AVCodecContext; device: VdpDevice;
                           get_proc_address: ptr VdpGetProcAddress; flags: cuint): cint {.
    cdecl, importc: "av_vdpau_bind_context", dynlib: avcodecdll.}
proc av_vdpau_get_surface_parameters*(avctx: ptr AVCodecContext;
                                     `type`: ptr VdpChromaType;
                                     width: ptr uint32_t; height: ptr uint32_t): cint {.
    cdecl, importc: "av_vdpau_get_surface_parameters", dynlib: avcodecdll.}
proc av_vdpau_alloc_context*(): ptr AVVDPAUContext {.cdecl,
    importc: "av_vdpau_alloc_context", dynlib: avcodecdll.}