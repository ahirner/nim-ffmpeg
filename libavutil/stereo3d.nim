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
  ../nim_ffmpeg_common, frame


type
  AVStereo3DType* {.size: sizeof(cint).} = enum
    AV_STEREO3D_2D, AV_STEREO3D_SIDEBYSIDE, AV_STEREO3D_TOPBOTTOM,
    AV_STEREO3D_FRAMESEQUENCE, AV_STEREO3D_CHECKERBOARD,
    AV_STEREO3D_SIDEBYSIDE_QUINCUNX, AV_STEREO3D_LINES, AV_STEREO3D_COLUMNS


type
  AVStereo3D* {.bycopy.} = object
    `type`*: AVStereo3DType
    flags*: cint


proc av_stereo3d_alloc*(): ptr AVStereo3D {.cdecl, importc: "av_stereo3d_alloc",
                                        dynlib: avutildll.}
proc av_stereo3d_create_side_data*(frame: ptr AVFrame): ptr AVStereo3D {.cdecl,
    importc: "av_stereo3d_create_side_data", dynlib: avutildll.}
proc av_stereo3d_type_name*(`type`: cuint): cstring {.cdecl,
    importc: "av_stereo3d_type_name", dynlib: avutildll.}
proc av_stereo3d_from_name*(name: cstring): cint {.cdecl,
    importc: "av_stereo3d_from_name", dynlib: avutildll.}