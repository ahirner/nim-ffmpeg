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
  ../nim_ffmpeg_common, attributes


proc av_get_cpu_flags*(): cint {.cdecl, importc: "av_get_cpu_flags", dynlib: avutildll.}
proc av_force_cpu_flags*(flags: cint) {.cdecl, importc: "av_force_cpu_flags",
                                     dynlib: avutildll.}
proc av_set_cpu_flags_mask*(mask: cint) {.cdecl, importc: "av_set_cpu_flags_mask",
                                       dynlib: avutildll.}
proc av_parse_cpu_flags*(s: cstring): cint {.cdecl, importc: "av_parse_cpu_flags",
    dynlib: avutildll.}
proc av_parse_cpu_caps*(flags: ptr cuint; s: cstring): cint {.cdecl,
    importc: "av_parse_cpu_caps", dynlib: avutildll.}
proc av_cpu_count*(): cint {.cdecl, importc: "av_cpu_count", dynlib: avutildll.}