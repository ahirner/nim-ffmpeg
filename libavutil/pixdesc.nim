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
  ../nim_ffmpeg_common, attributes, pixfmt


type
  AVComponentDescriptor* {.bycopy.} = object
    plane*: cint
    step*: cint
    offset*: cint
    shift*: cint
    depth*: cint

  AVPixFmtDescriptor* {.bycopy.} = object
    name*: cstring
    nb_components*: uint8_t
    log2_chroma_w*: uint8_t
    log2_chroma_h*: uint8_t
    flags*: uint64_t
    comp*: array[4, AVComponentDescriptor]
    alias*: cstring


proc av_get_bits_per_pixel*(pixdesc: ptr AVPixFmtDescriptor): cint {.cdecl,
    importc: "av_get_bits_per_pixel", dynlib: avutildll.}
proc av_get_padded_bits_per_pixel*(pixdesc: ptr AVPixFmtDescriptor): cint {.cdecl,
    importc: "av_get_padded_bits_per_pixel", dynlib: avutildll.}
proc av_pix_fmt_desc_get*(pix_fmt: AVPixelFormat): ptr AVPixFmtDescriptor {.cdecl,
    importc: "av_pix_fmt_desc_get", dynlib: avutildll.}
proc av_pix_fmt_desc_next*(prev: ptr AVPixFmtDescriptor): ptr AVPixFmtDescriptor {.
    cdecl, importc: "av_pix_fmt_desc_next", dynlib: avutildll.}
proc av_pix_fmt_desc_get_id*(desc: ptr AVPixFmtDescriptor): AVPixelFormat {.cdecl,
    importc: "av_pix_fmt_desc_get_id", dynlib: avutildll.}
proc av_pix_fmt_get_chroma_sub_sample*(pix_fmt: AVPixelFormat; h_shift: ptr cint;
                                      v_shift: ptr cint): cint {.cdecl,
    importc: "av_pix_fmt_get_chroma_sub_sample", dynlib: avutildll.}
proc av_pix_fmt_count_planes*(pix_fmt: AVPixelFormat): cint {.cdecl,
    importc: "av_pix_fmt_count_planes", dynlib: avutildll.}
proc av_color_range_name*(range: AVColorRange): cstring {.cdecl,
    importc: "av_color_range_name", dynlib: avutildll.}
proc av_color_primaries_name*(primaries: AVColorPrimaries): cstring {.cdecl,
    importc: "av_color_primaries_name", dynlib: avutildll.}
proc av_color_transfer_name*(transfer: AVColorTransferCharacteristic): cstring {.
    cdecl, importc: "av_color_transfer_name", dynlib: avutildll.}
proc av_color_space_name*(space: AVColorSpace): cstring {.cdecl,
    importc: "av_color_space_name", dynlib: avutildll.}
proc av_chroma_location_name*(location: AVChromaLocation): cstring {.cdecl,
    importc: "av_chroma_location_name", dynlib: avutildll.}
proc av_get_pix_fmt*(name: cstring): AVPixelFormat {.cdecl,
    importc: "av_get_pix_fmt", dynlib: avutildll.}
proc av_get_pix_fmt_name*(pix_fmt: AVPixelFormat): cstring {.cdecl,
    importc: "av_get_pix_fmt_name", dynlib: avutildll.}
proc av_get_pix_fmt_string*(buf: cstring; buf_size: cint; pix_fmt: AVPixelFormat): cstring {.
    cdecl, importc: "av_get_pix_fmt_string", dynlib: avutildll.}
proc av_read_image_line*(dst: ptr uint16_t; data: array[4, ptr uint8_t];
                        linesize: array[4, cint]; desc: ptr AVPixFmtDescriptor;
                        x: cint; y: cint; c: cint; w: cint; read_pal_component: cint) {.
    cdecl, importc: "av_read_image_line", dynlib: avutildll.}
proc av_write_image_line*(src: ptr uint16_t; data: array[4, ptr uint8_t];
                         linesize: array[4, cint]; desc: ptr AVPixFmtDescriptor;
                         x: cint; y: cint; c: cint; w: cint) {.cdecl,
    importc: "av_write_image_line", dynlib: avutildll.}
proc av_pix_fmt_swap_endianness*(pix_fmt: AVPixelFormat): AVPixelFormat {.cdecl,
    importc: "av_pix_fmt_swap_endianness", dynlib: avutildll.}
proc av_get_pix_fmt_loss*(dst_pix_fmt: AVPixelFormat; src_pix_fmt: AVPixelFormat;
                         has_alpha: cint): cint {.cdecl,
    importc: "av_get_pix_fmt_loss", dynlib: avutildll.}
proc av_find_best_pix_fmt_of_2*(dst_pix_fmt1: AVPixelFormat;
                               dst_pix_fmt2: AVPixelFormat;
                               src_pix_fmt: AVPixelFormat; has_alpha: cint;
                               loss_ptr: ptr cint): AVPixelFormat {.cdecl,
    importc: "av_find_best_pix_fmt_of_2", dynlib: avutildll.}