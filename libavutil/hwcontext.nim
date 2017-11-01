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
  ../nim_ffmpeg_common, buffer, frame, pixfmt


type
  AVHWDeviceType* {.size: sizeof(cint).} = enum
    AV_HWDEVICE_TYPE_VDPAU, AV_HWDEVICE_TYPE_CUDA, AV_HWDEVICE_TYPE_VAAPI,
    AV_HWDEVICE_TYPE_DXVA2, AV_HWDEVICE_TYPE_QSV


type
  AVHWDeviceContext* {.bycopy.} = object
    av_class*: ptr AVClass
    internal*: ptr AVHWDeviceInternal
    `type`*: AVHWDeviceType
    hwctx*: pointer
    free*: proc (ctx: ptr AVHWDeviceContext) {.cdecl.}
    user_opaque*: pointer

  AVHWFramesContext* {.bycopy.} = object
    av_class*: ptr AVClass
    internal*: ptr AVHWFramesInternal
    device_ref*: ptr AVBufferRef
    device_ctx*: ptr AVHWDeviceContext
    hwctx*: pointer
    free*: proc (ctx: ptr AVHWFramesContext) {.cdecl.}
    user_opaque*: pointer
    pool*: ptr AVBufferPool
    initial_pool_size*: cint
    format*: AVPixelFormat
    sw_format*: AVPixelFormat
    width*: cint
    height*: cint


proc av_hwdevice_ctx_alloc*(`type`: AVHWDeviceType): ptr AVBufferRef {.cdecl,
    importc: "av_hwdevice_ctx_alloc", dynlib: avutildll.}
proc av_hwdevice_ctx_init*(`ref`: ptr AVBufferRef): cint {.cdecl,
    importc: "av_hwdevice_ctx_init", dynlib: avutildll.}
proc av_hwdevice_ctx_create*(device_ctx: ptr ptr AVBufferRef; `type`: AVHWDeviceType;
                            device: cstring; opts: ptr AVDictionary; flags: cint): cint {.
    cdecl, importc: "av_hwdevice_ctx_create", dynlib: avutildll.}
proc av_hwframe_ctx_alloc*(device_ctx: ptr AVBufferRef): ptr AVBufferRef {.cdecl,
    importc: "av_hwframe_ctx_alloc", dynlib: avutildll.}
proc av_hwframe_ctx_init*(`ref`: ptr AVBufferRef): cint {.cdecl,
    importc: "av_hwframe_ctx_init", dynlib: avutildll.}
proc av_hwframe_get_buffer*(hwframe_ctx: ptr AVBufferRef; frame: ptr AVFrame;
                           flags: cint): cint {.cdecl,
    importc: "av_hwframe_get_buffer", dynlib: avutildll.}
proc av_hwframe_transfer_data*(dst: ptr AVFrame; src: ptr AVFrame; flags: cint): cint {.
    cdecl, importc: "av_hwframe_transfer_data", dynlib: avutildll.}
type
  AVHWFrameTransferDirection* {.size: sizeof(cint).} = enum
    AV_HWFRAME_TRANSFER_DIRECTION_FROM, AV_HWFRAME_TRANSFER_DIRECTION_TO


proc av_hwframe_transfer_get_formats*(hwframe_ctx: ptr AVBufferRef;
                                     dir: AVHWFrameTransferDirection;
                                     formats: ptr ptr AVPixelFormat; flags: cint): cint {.
    cdecl, importc: "av_hwframe_transfer_get_formats", dynlib: avutildll.}
type
  AVHWFramesConstraints* {.bycopy.} = object
    valid_hw_formats*: ptr AVPixelFormat
    valid_sw_formats*: ptr AVPixelFormat
    min_width*: cint
    min_height*: cint
    max_width*: cint
    max_height*: cint


proc av_hwdevice_hwconfig_alloc*(device_ctx: ptr AVBufferRef): pointer {.cdecl,
    importc: "av_hwdevice_hwconfig_alloc", dynlib: avutildll.}
proc av_hwdevice_get_hwframe_constraints*(`ref`: ptr AVBufferRef; hwconfig: pointer): ptr AVHWFramesConstraints {.
    cdecl, importc: "av_hwdevice_get_hwframe_constraints", dynlib: avutildll.}
proc av_hwframe_constraints_free*(constraints: ptr ptr AVHWFramesConstraints) {.
    cdecl, importc: "av_hwframe_constraints_free", dynlib: avutildll.}
const
  AV_HWFRAME_MAP_READ* = 1 shl 0
  AV_HWFRAME_MAP_WRITE* = 1 shl 1
  AV_HWFRAME_MAP_OVERWRITE* = 1 shl 2
  AV_HWFRAME_MAP_DIRECT* = 1 shl 3

proc av_hwframe_map*(dst: ptr AVFrame; src: ptr AVFrame; flags: cint): cint {.cdecl,
    importc: "av_hwframe_map", dynlib: avutildll.}
proc av_hwframe_ctx_create_derived*(derived_frame_ctx: ptr ptr AVBufferRef;
                                   format: AVPixelFormat;
                                   derived_device_ctx: ptr AVBufferRef;
                                   source_frame_ctx: ptr AVBufferRef; flags: cint): cint {.
    cdecl, importc: "av_hwframe_ctx_create_derived", dynlib: avutildll.}