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
  ../nim_ffmpeg_common, macros, pixfmt

proc avutil_version*(): cuint {.cdecl, importc: "avutil_version", dynlib: avutildll.}
proc av_version_info*(): cstring {.cdecl, importc: "av_version_info",
                                dynlib: avutildll.}
proc avutil_configuration*(): cstring {.cdecl, importc: "avutil_configuration",
                                     dynlib: avutildll.}
proc avutil_license*(): cstring {.cdecl, importc: "avutil_license", dynlib: avutildll.}
type
  AVMediaType* {.size: sizeof(cint).} = enum
    AVMEDIA_TYPE_UNKNOWN = - 1, AVMEDIA_TYPE_VIDEO, AVMEDIA_TYPE_AUDIO,
    AVMEDIA_TYPE_DATA, AVMEDIA_TYPE_SUBTITLE, AVMEDIA_TYPE_ATTACHMENT,
    AVMEDIA_TYPE_NB


proc av_get_media_type_string*(media_type: AVMediaType): cstring {.cdecl,
    importc: "av_get_media_type_string", dynlib: avutildll.}
type
  AVPictureType* {.size: sizeof(cint).} = enum
    AV_PICTURE_TYPE_NONE = 0, AV_PICTURE_TYPE_I, AV_PICTURE_TYPE_P,
    AV_PICTURE_TYPE_B, AV_PICTURE_TYPE_S, AV_PICTURE_TYPE_SI, AV_PICTURE_TYPE_SP,
    AV_PICTURE_TYPE_BI


proc av_get_picture_type_char*(pict_type: AVPictureType): char {.cdecl,
    importc: "av_get_picture_type_char", dynlib: avutildll.}

#proc av_x_if_null*(p: pointer; x: pointer): pointer {.inline, cdecl.} =
#  return cast[pointer](cast[ptr cint]((if p: p else: x)))

proc av_int_list_length_for_size*(elsize: cuint; list: pointer; term: uint64_t): cuint {.
    cdecl, importc: "av_int_list_length_for_size", dynlib: avutildll.}
proc av_fopen_utf8*(path: cstring; mode: cstring): ptr FILE {.cdecl,
    importc: "av_fopen_utf8", dynlib: avutildll.}
proc av_get_time_base_q*(): AVRational {.cdecl, importc: "av_get_time_base_q",
                                      dynlib: avutildll.}
proc av_fourcc_make_string*(buf: cstring; fourcc: uint32_t): cstring {.cdecl,
    importc: "av_fourcc_make_string", dynlib: avutildll.}