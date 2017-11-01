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


proc av_lzo1x_decode*(`out`: pointer; outlen: ptr cint; `in`: pointer; inlen: ptr cint): cint {.
    cdecl, importc: "av_lzo1x_decode", dynlib: avutildll.}