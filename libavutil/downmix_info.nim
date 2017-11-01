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
  ../nim_ffmpeg_common, frame


type
  AVDownmixType* {.size: sizeof(cint).} = enum
    AV_DOWNMIX_TYPE_UNKNOWN, AV_DOWNMIX_TYPE_LORO, AV_DOWNMIX_TYPE_LTRT,
    AV_DOWNMIX_TYPE_DPLII, AV_DOWNMIX_TYPE_NB


type
  AVDownmixInfo* {.bycopy.} = object
    preferred_downmix_type*: AVDownmixType
    center_mix_level*: cdouble
    center_mix_level_ltrt*: cdouble
    surround_mix_level*: cdouble
    surround_mix_level_ltrt*: cdouble
    lfe_mix_level*: cdouble


proc av_downmix_info_update_side_data*(frame: ptr AVFrame): ptr AVDownmixInfo {.cdecl,
    importc: "av_downmix_info_update_side_data", dynlib: avutildll.}