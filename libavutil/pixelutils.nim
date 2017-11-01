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
  av_pixelutils_sad_fn* = proc (src1: ptr uint8_t; stride1: ptrdiff_t;
                             src2: ptr uint8_t; stride2: ptrdiff_t): cint {.cdecl.}

proc av_pixelutils_get_sad_fn*(w_bits: cint; h_bits: cint; aligned: cint;
                              log_ctx: pointer): av_pixelutils_sad_fn {.cdecl,
    importc: "av_pixelutils_get_sad_fn", dynlib: avutildll.}