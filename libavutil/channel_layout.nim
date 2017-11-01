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
  AVMatrixEncoding* {.size: sizeof(cint).} = enum
    AV_MATRIX_ENCODING_NONE, AV_MATRIX_ENCODING_DOLBY, AV_MATRIX_ENCODING_DPLII,
    AV_MATRIX_ENCODING_DPLIIX, AV_MATRIX_ENCODING_DPLIIZ,
    AV_MATRIX_ENCODING_DOLBYEX, AV_MATRIX_ENCODING_DOLBYHEADPHONE,
    AV_MATRIX_ENCODING_NB


proc av_get_channel_layout*(name: cstring): uint64_t {.cdecl,
    importc: "av_get_channel_layout", dynlib: avutildll.}
proc av_get_extended_channel_layout*(name: cstring; channel_layout: ptr uint64_t;
                                    nb_channels: ptr cint): cint {.cdecl,
    importc: "av_get_extended_channel_layout", dynlib: avutildll.}
proc av_get_channel_layout_string*(buf: cstring; buf_size: cint; nb_channels: cint;
                                  channel_layout: uint64_t) {.cdecl,
    importc: "av_get_channel_layout_string", dynlib: avutildll.}
type
  AVBPrint* {.bycopy.} = object
  

proc av_bprint_channel_layout*(bp: ptr AVBPrint; nb_channels: cint;
                              channel_layout: uint64_t) {.cdecl,
    importc: "av_bprint_channel_layout", dynlib: avutildll.}
proc av_get_channel_layout_nb_channels*(channel_layout: uint64_t): cint {.cdecl,
    importc: "av_get_channel_layout_nb_channels", dynlib: avutildll.}
proc av_get_default_channel_layout*(nb_channels: cint): int64_t {.cdecl,
    importc: "av_get_default_channel_layout", dynlib: avutildll.}
proc av_get_channel_layout_channel_index*(channel_layout: uint64_t;
    channel: uint64_t): cint {.cdecl,
                            importc: "av_get_channel_layout_channel_index",
                            dynlib: avutildll.}
proc av_channel_layout_extract_channel*(channel_layout: uint64_t; index: cint): uint64_t {.
    cdecl, importc: "av_channel_layout_extract_channel", dynlib: avutildll.}
proc av_get_channel_name*(channel: uint64_t): cstring {.cdecl,
    importc: "av_get_channel_name", dynlib: avutildll.}
proc av_get_channel_description*(channel: uint64_t): cstring {.cdecl,
    importc: "av_get_channel_description", dynlib: avutildll.}
proc av_get_standard_channel_layout*(index: cuint; layout: ptr uint64_t;
                                    name: cstringArray): cint {.cdecl,
    importc: "av_get_standard_channel_layout", dynlib: avutildll.}