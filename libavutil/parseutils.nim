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


proc av_parse_ratio*(q: ptr AVRational; str: cstring; max: cint; log_offset: cint;
                    log_ctx: pointer): cint {.cdecl, importc: "av_parse_ratio",
    dynlib: avutildll.}
proc av_parse_video_size*(width_ptr: ptr cint; height_ptr: ptr cint; str: cstring): cint {.
    cdecl, importc: "av_parse_video_size", dynlib: avutildll.}
proc av_parse_video_rate*(rate: ptr AVRational; str: cstring): cint {.cdecl,
    importc: "av_parse_video_rate", dynlib: avutildll.}
proc av_parse_color*(rgba_color: ptr uint8_t; color_string: cstring; slen: cint;
                    log_ctx: pointer): cint {.cdecl, importc: "av_parse_color",
    dynlib: avutildll.}
proc av_get_known_color_name*(color_idx: cint; rgb: ptr ptr uint8_t): cstring {.cdecl,
    importc: "av_get_known_color_name", dynlib: avutildll.}
proc av_parse_time*(timeval: ptr int64_t; timestr: cstring; duration: cint): cint {.
    cdecl, importc: "av_parse_time", dynlib: avutildll.}
proc av_find_info_tag*(arg: cstring; arg_size: cint; tag1: cstring; info: cstring): cint {.
    cdecl, importc: "av_find_info_tag", dynlib: avutildll.}
proc av_small_strptime*(p: cstring; fmt: cstring; dt: ptr tm): cstring {.cdecl,
    importc: "av_small_strptime", dynlib: avutildll.}
proc av_timegm*(tm: ptr tm): time_t {.cdecl, importc: "av_timegm", dynlib: avutildll.}