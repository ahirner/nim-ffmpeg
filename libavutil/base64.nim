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


proc av_base64_decode*(`out`: ptr uint8_t; `in`: cstring; out_size: cint): cint {.cdecl,
    importc: "av_base64_decode", dynlib: avutildll.}
proc av_base64_encode*(`out`: cstring; out_size: cint; `in`: ptr uint8_t; in_size: cint): cstring {.
    cdecl, importc: "av_base64_encode", dynlib: avutildll.}