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
  AVDictionaryEntry* {.bycopy.} = object
    key*: cstring
    value*: cstring


proc av_dict_get*(m: ptr AVDictionary; key: cstring; prev: ptr AVDictionaryEntry;
                 flags: cint): ptr AVDictionaryEntry {.cdecl, importc: "av_dict_get",
    dynlib: avutildll.}
proc av_dict_count*(m: ptr AVDictionary): cint {.cdecl, importc: "av_dict_count",
    dynlib: avutildll.}
proc av_dict_set*(pm: ptr ptr AVDictionary; key: cstring; value: cstring; flags: cint): cint {.
    cdecl, importc: "av_dict_set", dynlib: avutildll.}
proc av_dict_set_int*(pm: ptr ptr AVDictionary; key: cstring; value: int64_t; flags: cint): cint {.
    cdecl, importc: "av_dict_set_int", dynlib: avutildll.}
proc av_dict_parse_string*(pm: ptr ptr AVDictionary; str: cstring;
                          key_val_sep: cstring; pairs_sep: cstring; flags: cint): cint {.
    cdecl, importc: "av_dict_parse_string", dynlib: avutildll.}
proc av_dict_copy*(dst: ptr ptr AVDictionary; src: ptr AVDictionary; flags: cint): cint {.
    cdecl, importc: "av_dict_copy", dynlib: avutildll.}
proc av_dict_free*(m: ptr ptr AVDictionary) {.cdecl, importc: "av_dict_free",
    dynlib: avutildll.}
proc av_dict_get_string*(m: ptr AVDictionary; buffer: cstringArray; key_val_sep: char;
                        pairs_sep: char): cint {.cdecl,
    importc: "av_dict_get_string", dynlib: avutildll.}