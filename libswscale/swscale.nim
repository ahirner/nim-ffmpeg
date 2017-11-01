 {.deadCodeElim: on.}
when defined(windows):
  const
    swscaledll* = "swscale.dll"
elif defined(macosx):
  const
    swscaledll* = "libswscale.dylib"
else:
  const
    swscaledll* = "libswscale.so"
import
  ../nim_ffmpeg_common, ../libavutil/avutil, ../libavutil/pixfmt


proc swscale_version*(): cuint {.cdecl, importc: "swscale_version", dynlib: swscaledll.}
proc swscale_configuration*(): cstring {.cdecl, importc: "swscale_configuration",
                                      dynlib: swscaledll.}
proc swscale_license*(): cstring {.cdecl, importc: "swscale_license",
                                dynlib: swscaledll.}

proc sws_getCoefficients*(colorspace: cint): ptr cint {.cdecl,
    importc: "sws_getCoefficients", dynlib: swscaledll.}

type
  SwsVector* {.bycopy.} = object
    coeff*: ptr cdouble
    length*: cint



type
  SwsFilter* {.bycopy.} = object
    lumH*: ptr SwsVector
    lumV*: ptr SwsVector
    chrH*: ptr SwsVector
    chrV*: ptr SwsVector

  SwsContext* {.bycopy.} = object
  

proc sws_isSupportedInput*(pix_fmt: AVPixelFormat): cint {.cdecl,
    importc: "sws_isSupportedInput", dynlib: swscaledll.}
proc sws_isSupportedOutput*(pix_fmt: AVPixelFormat): cint {.cdecl,
    importc: "sws_isSupportedOutput", dynlib: swscaledll.}
proc sws_isSupportedEndiannessConversion*(pix_fmt: AVPixelFormat): cint {.cdecl,
    importc: "sws_isSupportedEndiannessConversion", dynlib: swscaledll.}
proc sws_alloc_context*(): ptr SwsContext {.cdecl, importc: "sws_alloc_context",
                                        dynlib: swscaledll.}
proc sws_init_context*(sws_context: ptr SwsContext; srcFilter: ptr SwsFilter;
                      dstFilter: ptr SwsFilter): cint {.cdecl,
    importc: "sws_init_context", dynlib: swscaledll.}
proc sws_freeContext*(swsContext: ptr SwsContext) {.cdecl,
    importc: "sws_freeContext", dynlib: swscaledll.}
proc sws_getContext*(srcW: cint; srcH: cint; srcFormat: AVPixelFormat; dstW: cint;
                    dstH: cint; dstFormat: AVPixelFormat; flags: cint;
                    srcFilter: ptr SwsFilter; dstFilter: ptr SwsFilter;
                    param: ptr cdouble): ptr SwsContext {.cdecl,
    importc: "sws_getContext", dynlib: swscaledll.}
proc sws_scale*(c: ptr SwsContext; srcSlice: ptr ptr uint8_t; srcStride: ptr cint;
               srcSliceY: cint; srcSliceH: cint; dst: ptr ptr uint8_t;
               dstStride: ptr cint): cint {.cdecl, importc: "sws_scale",
                                        dynlib: swscaledll.}
proc sws_setColorspaceDetails*(c: ptr SwsContext; inv_table: array[4, cint];
                              srcRange: cint; table: array[4, cint]; dstRange: cint;
                              brightness: cint; contrast: cint; saturation: cint): cint {.
    cdecl, importc: "sws_setColorspaceDetails", dynlib: swscaledll.}
proc sws_getColorspaceDetails*(c: ptr SwsContext; inv_table: ptr ptr cint;
                              srcRange: ptr cint; table: ptr ptr cint;
                              dstRange: ptr cint; brightness: ptr cint;
                              contrast: ptr cint; saturation: ptr cint): cint {.cdecl,
    importc: "sws_getColorspaceDetails", dynlib: swscaledll.}
proc sws_allocVec*(length: cint): ptr SwsVector {.cdecl, importc: "sws_allocVec",
    dynlib: swscaledll.}
proc sws_getGaussianVec*(variance: cdouble; quality: cdouble): ptr SwsVector {.cdecl,
    importc: "sws_getGaussianVec", dynlib: swscaledll.}
proc sws_scaleVec*(a: ptr SwsVector; scalar: cdouble) {.cdecl, importc: "sws_scaleVec",
    dynlib: swscaledll.}
proc sws_normalizeVec*(a: ptr SwsVector; height: cdouble) {.cdecl,
    importc: "sws_normalizeVec", dynlib: swscaledll.}
proc sws_freeVec*(a: ptr SwsVector) {.cdecl, importc: "sws_freeVec", dynlib: swscaledll.}
proc sws_getDefaultFilter*(lumaGBlur: cfloat; chromaGBlur: cfloat;
                          lumaSharpen: cfloat; chromaSharpen: cfloat;
                          chromaHShift: cfloat; chromaVShift: cfloat; verbose: cint): ptr SwsFilter {.
    cdecl, importc: "sws_getDefaultFilter", dynlib: swscaledll.}
proc sws_freeFilter*(filter: ptr SwsFilter) {.cdecl, importc: "sws_freeFilter",
    dynlib: swscaledll.}
proc sws_getCachedContext*(context: ptr SwsContext; srcW: cint; srcH: cint;
                          srcFormat: AVPixelFormat; dstW: cint; dstH: cint;
                          dstFormat: AVPixelFormat; flags: cint;
                          srcFilter: ptr SwsFilter; dstFilter: ptr SwsFilter;
                          param: ptr cdouble): ptr SwsContext {.cdecl,
    importc: "sws_getCachedContext", dynlib: swscaledll.}
proc sws_convertPalette8ToPacked32*(src: ptr uint8_t; dst: ptr uint8_t;
                                   num_pixels: cint; palette: ptr uint8_t) {.cdecl,
    importc: "sws_convertPalette8ToPacked32", dynlib: swscaledll.}
proc sws_convertPalette8ToPacked24*(src: ptr uint8_t; dst: ptr uint8_t;
                                   num_pixels: cint; palette: ptr uint8_t) {.cdecl,
    importc: "sws_convertPalette8ToPacked24", dynlib: swscaledll.}
proc sws_get_class*(): ptr AVClass {.cdecl, importc: "sws_get_class",
                                 dynlib: swscaledll.}