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
  ../nim_ffmpeg_common, avutil, pixdesc


proc av_image_fill_max_pixsteps*(max_pixsteps: array[4, cint];
                                max_pixstep_comps: array[4, cint];
                                pixdesc: ptr AVPixFmtDescriptor) {.cdecl,
    importc: "av_image_fill_max_pixsteps", dynlib: avutildll.}
proc av_image_get_linesize*(pix_fmt: AVPixelFormat; width: cint; plane: cint): cint {.
    cdecl, importc: "av_image_get_linesize", dynlib: avutildll.}
proc av_image_fill_linesizes*(linesizes: array[4, cint]; pix_fmt: AVPixelFormat;
                             width: cint): cint {.cdecl,
    importc: "av_image_fill_linesizes", dynlib: avutildll.}
proc av_image_fill_pointers*(data: array[4, ptr uint8_t]; pix_fmt: AVPixelFormat;
                            height: cint; `ptr`: ptr uint8_t;
                            linesizes: array[4, cint]): cint {.cdecl,
    importc: "av_image_fill_pointers", dynlib: avutildll.}
proc av_image_alloc*(pointers: array[4, ptr uint8_t]; linesizes: array[4, cint];
                    w: cint; h: cint; pix_fmt: AVPixelFormat; align: cint): cint {.cdecl,
    importc: "av_image_alloc", dynlib: avutildll.}
proc av_image_copy_plane*(dst: ptr uint8_t; dst_linesize: cint; src: ptr uint8_t;
                         src_linesize: cint; bytewidth: cint; height: cint) {.cdecl,
    importc: "av_image_copy_plane", dynlib: avutildll.}
proc av_image_copy*(dst_data: array[4, ptr uint8_t]; dst_linesizes: array[4, cint];
                   src_data: array[4, ptr uint8_t]; src_linesizes: array[4, cint];
                   pix_fmt: AVPixelFormat; width: cint; height: cint) {.cdecl,
    importc: "av_image_copy", dynlib: avutildll.}
proc av_image_copy_uc_from*(dst_data: array[4, ptr uint8_t];
                           dst_linesizes: array[4, ptrdiff_t];
                           src_data: array[4, ptr uint8_t];
                           src_linesizes: array[4, ptrdiff_t];
                           pix_fmt: AVPixelFormat; width: cint; height: cint) {.cdecl,
    importc: "av_image_copy_uc_from", dynlib: avutildll.}
proc av_image_fill_arrays*(dst_data: array[4, ptr uint8_t];
                          dst_linesize: array[4, cint]; src: ptr uint8_t;
                          pix_fmt: AVPixelFormat; width: cint; height: cint;
                          align: cint): cint {.cdecl,
    importc: "av_image_fill_arrays", dynlib: avutildll.}
proc av_image_get_buffer_size*(pix_fmt: AVPixelFormat; width: cint; height: cint;
                              align: cint): cint {.cdecl,
    importc: "av_image_get_buffer_size", dynlib: avutildll.}
proc av_image_copy_to_buffer*(dst: ptr uint8_t; dst_size: cint;
                             src_data: array[4, ptr uint8_t];
                             src_linesize: array[4, cint]; pix_fmt: AVPixelFormat;
                             width: cint; height: cint; align: cint): cint {.cdecl,
    importc: "av_image_copy_to_buffer", dynlib: avutildll.}
proc av_image_check_size*(w: cuint; h: cuint; log_offset: cint; log_ctx: pointer): cint {.
    cdecl, importc: "av_image_check_size", dynlib: avutildll.}
proc av_image_check_size2*(w: cuint; h: cuint; max_pixels: int64_t;
                          pix_fmt: AVPixelFormat; log_offset: cint; log_ctx: pointer): cint {.
    cdecl, importc: "av_image_check_size2", dynlib: avutildll.}
proc av_image_check_sar*(w: cuint; h: cuint; sar: AVRational): cint {.cdecl,
    importc: "av_image_check_sar", dynlib: avutildll.}