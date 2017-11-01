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
  ../nim_ffmpeg_common


type
  dxva_context* {.bycopy.} = object
    decoder*: ptr IDirectXVideoDecoder
    cfg*: ptr DXVA2_ConfigPictureDecode
    surface_count*: cuint
    surface*: ptr LPDIRECT3DSURFACE9
    workaround*: uint64_t
    report_id*: cuint

