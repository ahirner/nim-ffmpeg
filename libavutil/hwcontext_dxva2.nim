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
  AVDXVA2DeviceContext* {.bycopy.} = object
    devmgr*: ptr IDirect3DDeviceManager9

  AVDXVA2FramesContext* {.bycopy.} = object
    surface_type*: DWORD
    surfaces*: ptr ptr IDirect3DSurface9
    nb_surfaces*: cint
    decoder_to_release*: ptr IDirectXVideoDecoder

