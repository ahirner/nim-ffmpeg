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
  AVMotionVector* {.bycopy.} = object
    source*: int32_t
    w*: uint8_t
    h*: uint8_t
    src_x*: int16_t
    src_y*: int16_t
    dst_x*: int16_t
    dst_y*: int16_t
    flags*: uint64_t
    motion_x*: int32_t
    motion_y*: int32_t
    motion_scale*: uint16_t

