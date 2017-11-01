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


const
  AV_VAAPI_DRIVER_QUIRK_USER_SET* = (1 shl 0)
  AV_VAAPI_DRIVER_QUIRK_RENDER_PARAM_BUFFERS* = (1 shl 1)
  AV_VAAPI_DRIVER_QUIRK_ATTRIB_MEMTYPE* = (1 shl 2)

type
  AVVAAPIDeviceContext* {.bycopy.} = object
    display*: VADisplay
    driver_quirks*: cuint

  AVVAAPIFramesContext* {.bycopy.} = object
    attributes*: ptr VASurfaceAttrib
    nb_attributes*: cint
    surface_ids*: ptr VASurfaceID
    nb_surfaces*: cint

  AVVAAPIHWConfig* {.bycopy.} = object
    config_id*: VAConfigID

