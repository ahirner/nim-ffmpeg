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


proc av_display_rotation_get*(matrix: array[9, int32_t]): cdouble {.cdecl,
    importc: "av_display_rotation_get", dynlib: avutildll.}
proc av_display_rotation_set*(matrix: array[9, int32_t]; angle: cdouble) {.cdecl,
    importc: "av_display_rotation_set", dynlib: avutildll.}
proc av_display_matrix_flip*(matrix: array[9, int32_t]; hflip: cint; vflip: cint) {.
    cdecl, importc: "av_display_matrix_flip", dynlib: avutildll.}