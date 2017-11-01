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
  ../nim_ffmpeg_common, ../libavutil/pixfmt, avcodec


type
  AVDVProfile* {.bycopy.} = object
    dsf*: cint
    video_stype*: cint
    frame_size*: cint
    difseg_size*: cint
    n_difchan*: cint
    time_base*: AVRational
    ltc_divisor*: cint
    height*: cint
    width*: cint
    sar*: array[2, AVRational]
    pix_fmt*: AVPixelFormat
    bpm*: cint
    block_sizes*: ptr uint8_t
    audio_stride*: cint
    audio_min_samples*: array[3, cint]
    audio_samples_dist*: array[5, cint]
    audio_shuffle*: array[9, uint8_t]


proc av_dv_frame_profile*(sys: ptr AVDVProfile; frame: ptr uint8_t; buf_size: cuint): ptr AVDVProfile {.
    cdecl, importc: "av_dv_frame_profile", dynlib: avcodecdll.}
proc av_dv_codec_profile*(width: cint; height: cint; pix_fmt: AVPixelFormat): ptr AVDVProfile {.
    cdecl, importc: "av_dv_codec_profile", dynlib: avcodecdll.}
proc av_dv_codec_profile2*(width: cint; height: cint; pix_fmt: AVPixelFormat;
                          frame_rate: AVRational): ptr AVDVProfile {.cdecl,
    importc: "av_dv_codec_profile2", dynlib: avcodecdll.}