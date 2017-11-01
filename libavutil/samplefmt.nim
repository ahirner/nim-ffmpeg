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
  ../nim_ffmpeg_common, avutil, attributes


type
  AVSampleFormat* {.size: sizeof(cint).} = enum
    AV_SAMPLE_FMT_NONE = - 1, AV_SAMPLE_FMT_U8, AV_SAMPLE_FMT_S16, AV_SAMPLE_FMT_S32,
    AV_SAMPLE_FMT_FLT, AV_SAMPLE_FMT_DBL, AV_SAMPLE_FMT_U8P, AV_SAMPLE_FMT_S16P,
    AV_SAMPLE_FMT_S32P, AV_SAMPLE_FMT_FLTP, AV_SAMPLE_FMT_DBLP, AV_SAMPLE_FMT_S64,
    AV_SAMPLE_FMT_S64P, AV_SAMPLE_FMT_NB


proc av_get_sample_fmt_name*(sample_fmt: AVSampleFormat): cstring {.cdecl,
    importc: "av_get_sample_fmt_name", dynlib: avutildll.}
proc av_get_sample_fmt*(name: cstring): AVSampleFormat {.cdecl,
    importc: "av_get_sample_fmt", dynlib: avutildll.}
proc av_get_alt_sample_fmt*(sample_fmt: AVSampleFormat; planar: cint): AVSampleFormat {.
    cdecl, importc: "av_get_alt_sample_fmt", dynlib: avutildll.}
proc av_get_packed_sample_fmt*(sample_fmt: AVSampleFormat): AVSampleFormat {.cdecl,
    importc: "av_get_packed_sample_fmt", dynlib: avutildll.}
proc av_get_planar_sample_fmt*(sample_fmt: AVSampleFormat): AVSampleFormat {.cdecl,
    importc: "av_get_planar_sample_fmt", dynlib: avutildll.}
proc av_get_sample_fmt_string*(buf: cstring; buf_size: cint;
                              sample_fmt: AVSampleFormat): cstring {.cdecl,
    importc: "av_get_sample_fmt_string", dynlib: avutildll.}
proc av_get_bytes_per_sample*(sample_fmt: AVSampleFormat): cint {.cdecl,
    importc: "av_get_bytes_per_sample", dynlib: avutildll.}
proc av_sample_fmt_is_planar*(sample_fmt: AVSampleFormat): cint {.cdecl,
    importc: "av_sample_fmt_is_planar", dynlib: avutildll.}
proc av_samples_get_buffer_size*(linesize: ptr cint; nb_channels: cint;
                                nb_samples: cint; sample_fmt: AVSampleFormat;
                                align: cint): cint {.cdecl,
    importc: "av_samples_get_buffer_size", dynlib: avutildll.}
proc av_samples_fill_arrays*(audio_data: ptr ptr uint8_t; linesize: ptr cint;
                            buf: ptr uint8_t; nb_channels: cint; nb_samples: cint;
                            sample_fmt: AVSampleFormat; align: cint): cint {.cdecl,
    importc: "av_samples_fill_arrays", dynlib: avutildll.}
proc av_samples_alloc*(audio_data: ptr ptr uint8_t; linesize: ptr cint;
                      nb_channels: cint; nb_samples: cint;
                      sample_fmt: AVSampleFormat; align: cint): cint {.cdecl,
    importc: "av_samples_alloc", dynlib: avutildll.}
proc av_samples_alloc_array_and_samples*(audio_data: ptr ptr ptr uint8_t;
                                        linesize: ptr cint; nb_channels: cint;
                                        nb_samples: cint;
                                        sample_fmt: AVSampleFormat; align: cint): cint {.
    cdecl, importc: "av_samples_alloc_array_and_samples", dynlib: avutildll.}
proc av_samples_copy*(dst: ptr ptr uint8_t; src: ptr ptr uint8_t; dst_offset: cint;
                     src_offset: cint; nb_samples: cint; nb_channels: cint;
                     sample_fmt: AVSampleFormat): cint {.cdecl,
    importc: "av_samples_copy", dynlib: avutildll.}
proc av_samples_set_silence*(audio_data: ptr ptr uint8_t; offset: cint;
                            nb_samples: cint; nb_channels: cint;
                            sample_fmt: AVSampleFormat): cint {.cdecl,
    importc: "av_samples_set_silence", dynlib: avutildll.}