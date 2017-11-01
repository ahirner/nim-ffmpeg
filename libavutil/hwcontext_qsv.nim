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
  AVQSVDeviceContext* {.bycopy.} = object
    session*: mfxSession

  AVQSVFramesContext* {.bycopy.} = object
    surfaces*: ptr mfxFrameSurface1
    nb_surfaces*: cint
    frame_type*: cint

