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


proc av_adler32_update*(adler: culong; buf: ptr uint8_t; len: cuint): culong {.cdecl,
    importc: "av_adler32_update", dynlib: avutildll.}