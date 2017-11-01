 {.deadCodeElim: on.}
when defined(windows):
  const
    avcodecdll* = "avcodec.dll"
elif defined(macosx):
  const
    avcodecdll* = "libavcodec.dylib"
else:
  const
    avcodecdll* = "libavcodec.so"
import
  ../nim_ffmpeg_common

type
  FFTSample* = cfloat
  FFTComplex* {.bycopy.} = object
    re*: FFTSample
    im*: FFTSample


proc av_fft_init*(nbits: cint; inverse: cint): ptr FFTContext {.cdecl,
    importc: "av_fft_init", dynlib: avcodecdll.}
proc av_fft_permute*(s: ptr FFTContext; z: ptr FFTComplex) {.cdecl,
    importc: "av_fft_permute", dynlib: avcodecdll.}
proc av_fft_calc*(s: ptr FFTContext; z: ptr FFTComplex) {.cdecl, importc: "av_fft_calc",
    dynlib: avcodecdll.}
proc av_fft_end*(s: ptr FFTContext) {.cdecl, importc: "av_fft_end", dynlib: avcodecdll.}
proc av_mdct_init*(nbits: cint; inverse: cint; scale: cdouble): ptr FFTContext {.cdecl,
    importc: "av_mdct_init", dynlib: avcodecdll.}
proc av_imdct_calc*(s: ptr FFTContext; output: ptr FFTSample; input: ptr FFTSample) {.
    cdecl, importc: "av_imdct_calc", dynlib: avcodecdll.}
proc av_imdct_half*(s: ptr FFTContext; output: ptr FFTSample; input: ptr FFTSample) {.
    cdecl, importc: "av_imdct_half", dynlib: avcodecdll.}
proc av_mdct_calc*(s: ptr FFTContext; output: ptr FFTSample; input: ptr FFTSample) {.
    cdecl, importc: "av_mdct_calc", dynlib: avcodecdll.}
proc av_mdct_end*(s: ptr FFTContext) {.cdecl, importc: "av_mdct_end",
                                   dynlib: avcodecdll.}
type
  RDFTransformType* {.size: sizeof(cint).} = enum
    DFT_R2C, IDFT_C2R, IDFT_R2C, DFT_C2R



proc av_rdft_init*(nbits: cint; trans: RDFTransformType): ptr RDFTContext {.cdecl,
    importc: "av_rdft_init", dynlib: avcodecdll.}
proc av_rdft_calc*(s: ptr RDFTContext; data: ptr FFTSample) {.cdecl,
    importc: "av_rdft_calc", dynlib: avcodecdll.}
proc av_rdft_end*(s: ptr RDFTContext) {.cdecl, importc: "av_rdft_end",
                                    dynlib: avcodecdll.}
type
  DCTTransformType* {.size: sizeof(cint).} = enum
    DCT_II = 0, DCT_III, DCT_I, DST_I


proc av_dct_init*(nbits: cint; `type`: DCTTransformType): ptr DCTContext {.cdecl,
    importc: "av_dct_init", dynlib: avcodecdll.}
proc av_dct_calc*(s: ptr DCTContext; data: ptr FFTSample) {.cdecl,
    importc: "av_dct_calc", dynlib: avcodecdll.}
proc av_dct_end*(s: ptr DCTContext) {.cdecl, importc: "av_dct_end", dynlib: avcodecdll.}