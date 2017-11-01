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
  AVVDPAUDeviceContext* {.bycopy.} = object
    device*: VdpDevice
    get_proc_address*: ptr VdpGetProcAddress

