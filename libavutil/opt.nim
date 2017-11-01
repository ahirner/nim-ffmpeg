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
  ../nim_ffmpeg_common, avutil, dict, pixfmt, samplefmt


type
  AVOptionType* {.size: sizeof(cint).} = enum
    AV_OPT_TYPE_FLAGS, AV_OPT_TYPE_INT, AV_OPT_TYPE_INT64, AV_OPT_TYPE_DOUBLE,
    AV_OPT_TYPE_FLOAT, AV_OPT_TYPE_STRING, AV_OPT_TYPE_RATIONAL,
    AV_OPT_TYPE_BINARY, AV_OPT_TYPE_DICT, AV_OPT_TYPE_UINT64,
    AV_OPT_TYPE_CONST = 128, AV_OPT_TYPE_IMAGE_SIZE = MKBETAG('S', 'I', 'Z', 'E'),
    AV_OPT_TYPE_PIXEL_FMT = MKBETAG('P', 'F', 'M', 'T'),
    AV_OPT_TYPE_SAMPLE_FMT = MKBETAG('S', 'F', 'M', 'T'),
    AV_OPT_TYPE_VIDEO_RATE = MKBETAG('V', 'R', 'A', 'T'),
    AV_OPT_TYPE_DURATION = MKBETAG('D', 'U', 'R', ' '),
    AV_OPT_TYPE_COLOR = MKBETAG('C', 'O', 'L', 'R'),
    AV_OPT_TYPE_CHANNEL_LAYOUT = MKBETAG('C', 'H', 'L', 'A'),
    AV_OPT_TYPE_BOOL = MKBETAG('B', 'O', 'O', 'L')


type
  INNER_C_UNION_1968994876* {.bycopy.} = object {.union.}
    i64*: int64_t
    dbl*: cdouble
    str*: cstring
    q*: AVRational

  AVOption* {.bycopy.} = object
    name*: cstring
    help*: cstring
    offset*: cint
    `type`*: AVOptionType
    default_val*: INNER_C_UNION_1968994876
    min*: cdouble
    max*: cdouble
    flags*: cint
    unit*: cstring

  AVOptionRange* {.bycopy.} = object
    str*: cstring
    value_min*: cdouble
    value_max*: cdouble
    component_min*: cdouble
    component_max*: cdouble
    is_range*: cint

  AVOptionRanges* {.bycopy.} = object
    range*: ptr ptr AVOptionRange
    nb_ranges*: cint
    nb_components*: cint


proc av_opt_show2*(obj: pointer; av_log_obj: pointer; req_flags: cint; rej_flags: cint): cint {.
    cdecl, importc: "av_opt_show2", dynlib: avutildll.}
proc av_opt_set_defaults*(s: pointer) {.cdecl, importc: "av_opt_set_defaults",
                                     dynlib: avutildll.}
proc av_opt_set_defaults2*(s: pointer; mask: cint; flags: cint) {.cdecl,
    importc: "av_opt_set_defaults2", dynlib: avutildll.}
proc av_set_options_string*(ctx: pointer; opts: cstring; key_val_sep: cstring;
                           pairs_sep: cstring): cint {.cdecl,
    importc: "av_set_options_string", dynlib: avutildll.}
proc av_opt_set_from_string*(ctx: pointer; opts: cstring; shorthand: cstringArray;
                            key_val_sep: cstring; pairs_sep: cstring): cint {.cdecl,
    importc: "av_opt_set_from_string", dynlib: avutildll.}
proc av_opt_free*(obj: pointer) {.cdecl, importc: "av_opt_free", dynlib: avutildll.}
proc av_opt_flag_is_set*(obj: pointer; field_name: cstring; flag_name: cstring): cint {.
    cdecl, importc: "av_opt_flag_is_set", dynlib: avutildll.}
proc av_opt_set_dict*(obj: pointer; options: ptr ptr AVDictionary): cint {.cdecl,
    importc: "av_opt_set_dict", dynlib: avutildll.}
proc av_opt_set_dict2*(obj: pointer; options: ptr ptr AVDictionary; search_flags: cint): cint {.
    cdecl, importc: "av_opt_set_dict2", dynlib: avutildll.}
proc av_opt_get_key_value*(ropts: cstringArray; key_val_sep: cstring;
                          pairs_sep: cstring; flags: cuint; rkey: cstringArray;
                          rval: cstringArray): cint {.cdecl,
    importc: "av_opt_get_key_value", dynlib: avutildll.}
const
  AV_OPT_FLAG_IMPLICIT_KEY* = 1

proc av_opt_eval_flags*(obj: pointer; o: ptr AVOption; val: cstring; flags_out: ptr cint): cint {.
    cdecl, importc: "av_opt_eval_flags", dynlib: avutildll.}
proc av_opt_eval_int*(obj: pointer; o: ptr AVOption; val: cstring; int_out: ptr cint): cint {.
    cdecl, importc: "av_opt_eval_int", dynlib: avutildll.}
proc av_opt_eval_int64*(obj: pointer; o: ptr AVOption; val: cstring;
                       int64_out: ptr int64_t): cint {.cdecl,
    importc: "av_opt_eval_int64", dynlib: avutildll.}
proc av_opt_eval_float*(obj: pointer; o: ptr AVOption; val: cstring;
                       float_out: ptr cfloat): cint {.cdecl,
    importc: "av_opt_eval_float", dynlib: avutildll.}
proc av_opt_eval_double*(obj: pointer; o: ptr AVOption; val: cstring;
                        double_out: ptr cdouble): cint {.cdecl,
    importc: "av_opt_eval_double", dynlib: avutildll.}
proc av_opt_eval_q*(obj: pointer; o: ptr AVOption; val: cstring; q_out: ptr AVRational): cint {.
    cdecl, importc: "av_opt_eval_q", dynlib: avutildll.}
proc av_opt_find*(obj: pointer; name: cstring; unit: cstring; opt_flags: cint;
                 search_flags: cint): ptr AVOption {.cdecl, importc: "av_opt_find",
    dynlib: avutildll.}
proc av_opt_find2*(obj: pointer; name: cstring; unit: cstring; opt_flags: cint;
                  search_flags: cint; target_obj: ptr pointer): ptr AVOption {.cdecl,
    importc: "av_opt_find2", dynlib: avutildll.}
proc av_opt_next*(obj: pointer; prev: ptr AVOption): ptr AVOption {.cdecl,
    importc: "av_opt_next", dynlib: avutildll.}
proc av_opt_child_next*(obj: pointer; prev: pointer): pointer {.cdecl,
    importc: "av_opt_child_next", dynlib: avutildll.}
proc av_opt_child_class_next*(parent: ptr AVClass; prev: ptr AVClass): ptr AVClass {.
    cdecl, importc: "av_opt_child_class_next", dynlib: avutildll.}
proc av_opt_set*(obj: pointer; name: cstring; val: cstring; search_flags: cint): cint {.
    cdecl, importc: "av_opt_set", dynlib: avutildll.}
proc av_opt_set_int*(obj: pointer; name: cstring; val: int64_t; search_flags: cint): cint {.
    cdecl, importc: "av_opt_set_int", dynlib: avutildll.}
proc av_opt_set_double*(obj: pointer; name: cstring; val: cdouble; search_flags: cint): cint {.
    cdecl, importc: "av_opt_set_double", dynlib: avutildll.}
proc av_opt_set_q*(obj: pointer; name: cstring; val: AVRational; search_flags: cint): cint {.
    cdecl, importc: "av_opt_set_q", dynlib: avutildll.}
proc av_opt_set_bin*(obj: pointer; name: cstring; val: ptr uint8_t; size: cint;
                    search_flags: cint): cint {.cdecl, importc: "av_opt_set_bin",
    dynlib: avutildll.}
proc av_opt_set_image_size*(obj: pointer; name: cstring; w: cint; h: cint;
                           search_flags: cint): cint {.cdecl,
    importc: "av_opt_set_image_size", dynlib: avutildll.}
proc av_opt_set_pixel_fmt*(obj: pointer; name: cstring; fmt: AVPixelFormat;
                          search_flags: cint): cint {.cdecl,
    importc: "av_opt_set_pixel_fmt", dynlib: avutildll.}
proc av_opt_set_sample_fmt*(obj: pointer; name: cstring; fmt: AVSampleFormat;
                           search_flags: cint): cint {.cdecl,
    importc: "av_opt_set_sample_fmt", dynlib: avutildll.}
proc av_opt_set_video_rate*(obj: pointer; name: cstring; val: AVRational;
                           search_flags: cint): cint {.cdecl,
    importc: "av_opt_set_video_rate", dynlib: avutildll.}
proc av_opt_set_channel_layout*(obj: pointer; name: cstring; ch_layout: int64_t;
                               search_flags: cint): cint {.cdecl,
    importc: "av_opt_set_channel_layout", dynlib: avutildll.}
proc av_opt_set_dict_val*(obj: pointer; name: cstring; val: ptr AVDictionary;
                         search_flags: cint): cint {.cdecl,
    importc: "av_opt_set_dict_val", dynlib: avutildll.}
proc av_opt_get*(obj: pointer; name: cstring; search_flags: cint;
                out_val: ptr ptr uint8_t): cint {.cdecl, importc: "av_opt_get",
    dynlib: avutildll.}
proc av_opt_get_int*(obj: pointer; name: cstring; search_flags: cint;
                    out_val: ptr int64_t): cint {.cdecl, importc: "av_opt_get_int",
    dynlib: avutildll.}
proc av_opt_get_double*(obj: pointer; name: cstring; search_flags: cint;
                       out_val: ptr cdouble): cint {.cdecl,
    importc: "av_opt_get_double", dynlib: avutildll.}
proc av_opt_get_q*(obj: pointer; name: cstring; search_flags: cint;
                  out_val: ptr AVRational): cint {.cdecl, importc: "av_opt_get_q",
    dynlib: avutildll.}
proc av_opt_get_image_size*(obj: pointer; name: cstring; search_flags: cint;
                           w_out: ptr cint; h_out: ptr cint): cint {.cdecl,
    importc: "av_opt_get_image_size", dynlib: avutildll.}
proc av_opt_get_pixel_fmt*(obj: pointer; name: cstring; search_flags: cint;
                          out_fmt: ptr AVPixelFormat): cint {.cdecl,
    importc: "av_opt_get_pixel_fmt", dynlib: avutildll.}
proc av_opt_get_sample_fmt*(obj: pointer; name: cstring; search_flags: cint;
                           out_fmt: ptr AVSampleFormat): cint {.cdecl,
    importc: "av_opt_get_sample_fmt", dynlib: avutildll.}
proc av_opt_get_video_rate*(obj: pointer; name: cstring; search_flags: cint;
                           out_val: ptr AVRational): cint {.cdecl,
    importc: "av_opt_get_video_rate", dynlib: avutildll.}
proc av_opt_get_channel_layout*(obj: pointer; name: cstring; search_flags: cint;
                               ch_layout: ptr int64_t): cint {.cdecl,
    importc: "av_opt_get_channel_layout", dynlib: avutildll.}
proc av_opt_get_dict_val*(obj: pointer; name: cstring; search_flags: cint;
                         out_val: ptr ptr AVDictionary): cint {.cdecl,
    importc: "av_opt_get_dict_val", dynlib: avutildll.}
proc av_opt_ptr*(avclass: ptr AVClass; obj: pointer; name: cstring): pointer {.cdecl,
    importc: "av_opt_ptr", dynlib: avutildll.}
proc av_opt_freep_ranges*(ranges: ptr ptr AVOptionRanges) {.cdecl,
    importc: "av_opt_freep_ranges", dynlib: avutildll.}
proc av_opt_query_ranges*(a2: ptr ptr AVOptionRanges; obj: pointer; key: cstring;
                         flags: cint): cint {.cdecl, importc: "av_opt_query_ranges",
    dynlib: avutildll.}
proc av_opt_copy*(dest: pointer; src: pointer): cint {.cdecl, importc: "av_opt_copy",
    dynlib: avutildll.}
proc av_opt_query_ranges_default*(a2: ptr ptr AVOptionRanges; obj: pointer;
                                 key: cstring; flags: cint): cint {.cdecl,
    importc: "av_opt_query_ranges_default", dynlib: avutildll.}
proc av_opt_is_set_to_default*(obj: pointer; o: ptr AVOption): cint {.cdecl,
    importc: "av_opt_is_set_to_default", dynlib: avutildll.}
proc av_opt_is_set_to_default_by_name*(obj: pointer; name: cstring;
                                      search_flags: cint): cint {.cdecl,
    importc: "av_opt_is_set_to_default_by_name", dynlib: avutildll.}
proc av_opt_serialize*(obj: pointer; opt_flags: cint; flags: cint;
                      buffer: cstringArray; key_val_sep: char; pairs_sep: char): cint {.
    cdecl, importc: "av_opt_serialize", dynlib: avutildll.}