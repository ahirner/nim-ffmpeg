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
  AVSphericalProjection* {.size: sizeof(cint).} = enum
    AV_SPHERICAL_EQUIRECTANGULAR, AV_SPHERICAL_CUBEMAP,
    AV_SPHERICAL_EQUIRECTANGULAR_TILE


type
  AVSphericalMapping* {.bycopy.} = object
    projection*: AVSphericalProjection
    yaw*: int32_t
    pitch*: int32_t
    roll*: int32_t
    bound_left*: uint32_t
    bound_top*: uint32_t
    bound_right*: uint32_t
    bound_bottom*: uint32_t
    padding*: uint32_t


proc av_spherical_alloc*(size: ptr csize): ptr AVSphericalMapping {.cdecl,
    importc: "av_spherical_alloc", dynlib: avutildll.}
proc av_spherical_tile_bounds*(map: ptr AVSphericalMapping; width: csize;
                              height: csize; left: ptr csize; top: ptr csize;
                              right: ptr csize; bottom: ptr csize) {.cdecl,
    importc: "av_spherical_tile_bounds", dynlib: avutildll.}
proc av_spherical_projection_name*(projection: AVSphericalProjection): cstring {.
    cdecl, importc: "av_spherical_projection_name", dynlib: avutildll.}
proc av_spherical_from_name*(name: cstring): cint {.cdecl,
    importc: "av_spherical_from_name", dynlib: avutildll.}