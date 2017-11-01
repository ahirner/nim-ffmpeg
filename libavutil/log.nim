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
  ../nim_ffmpeg_common, avutil, attributes, version


type
  AVClassCategory* {.size: sizeof(cint).} = enum
    AV_CLASS_CATEGORY_NA = 0, AV_CLASS_CATEGORY_INPUT, AV_CLASS_CATEGORY_OUTPUT,
    AV_CLASS_CATEGORY_MUXER, AV_CLASS_CATEGORY_DEMUXER, AV_CLASS_CATEGORY_ENCODER,
    AV_CLASS_CATEGORY_DECODER, AV_CLASS_CATEGORY_FILTER,
    AV_CLASS_CATEGORY_BITSTREAM_FILTER, AV_CLASS_CATEGORY_SWSCALER,
    AV_CLASS_CATEGORY_SWRESAMPLER, AV_CLASS_CATEGORY_DEVICE_VIDEO_OUTPUT = 40,
    AV_CLASS_CATEGORY_DEVICE_VIDEO_INPUT, AV_CLASS_CATEGORY_DEVICE_AUDIO_OUTPUT,
    AV_CLASS_CATEGORY_DEVICE_AUDIO_INPUT, AV_CLASS_CATEGORY_DEVICE_OUTPUT,
    AV_CLASS_CATEGORY_DEVICE_INPUT, AV_CLASS_CATEGORY_NB


type
  AVOptionRanges* {.bycopy.} = object
  
  AVClass* {.bycopy.} = object
    class_name*: cstring
    item_name*: proc (ctx: pointer): cstring {.cdecl.}
    option*: ptr AVOption
    version*: cint
    log_level_offset_offset*: cint
    parent_log_context_offset*: cint
    child_next*: proc (obj: pointer; prev: pointer): pointer {.cdecl.}
    child_class_next*: proc (prev: ptr AVClass): ptr AVClass {.cdecl.}
    category*: AVClassCategory
    get_category*: proc (ctx: pointer): AVClassCategory {.cdecl.}
    query_ranges*: proc (a2: ptr ptr AVOptionRanges; obj: pointer; key: cstring;
                       flags: cint): cint {.cdecl.}


proc av_log*(avcl: pointer; level: cint; fmt: cstring) {.varargs, cdecl,
    importc: "av_log", dynlib: avutildll.}
proc av_vlog*(avcl: pointer; level: cint; fmt: cstring; vl: va_list) {.cdecl,
    importc: "av_vlog", dynlib: avutildll.}
proc av_log_get_level*(): cint {.cdecl, importc: "av_log_get_level", dynlib: avutildll.}
proc av_log_set_level*(level: cint) {.cdecl, importc: "av_log_set_level",
                                   dynlib: avutildll.}
proc av_log_set_callback*(callback: proc (a2: pointer; a3: cint; a4: cstring; a5: va_list) {.
    cdecl.}) {.cdecl, importc: "av_log_set_callback", dynlib: avutildll.}
proc av_log_default_callback*(avcl: pointer; level: cint; fmt: cstring; vl: va_list) {.
    cdecl, importc: "av_log_default_callback", dynlib: avutildll.}
proc av_default_item_name*(ctx: pointer): cstring {.cdecl,
    importc: "av_default_item_name", dynlib: avutildll.}
proc av_default_get_category*(`ptr`: pointer): AVClassCategory {.cdecl,
    importc: "av_default_get_category", dynlib: avutildll.}
proc av_log_format_line*(`ptr`: pointer; level: cint; fmt: cstring; vl: va_list;
                        line: cstring; line_size: cint; print_prefix: ptr cint) {.
    cdecl, importc: "av_log_format_line", dynlib: avutildll.}
proc av_log_format_line2*(`ptr`: pointer; level: cint; fmt: cstring; vl: va_list;
                         line: cstring; line_size: cint; print_prefix: ptr cint): cint {.
    cdecl, importc: "av_log_format_line2", dynlib: avutildll.}
proc av_log_set_flags*(arg: cint) {.cdecl, importc: "av_log_set_flags",
                                 dynlib: avutildll.}
proc av_log_get_flags*(): cint {.cdecl, importc: "av_log_get_flags", dynlib: avutildll.}