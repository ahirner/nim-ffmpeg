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
  AVReplayGain* {.bycopy.} = object
    track_gain*: int32_t
    track_peak*: uint32_t
    album_gain*: int32_t
    album_peak*: uint32_t

