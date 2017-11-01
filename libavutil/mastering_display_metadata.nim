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
  AVMasteringDisplayMetadata* {.bycopy.} = object
    display_primaries*: array[3, array[2, AVRational]]
    white_point*: array[2, AVRational]
    min_luminance*: AVRational
    max_luminance*: AVRational
    has_primaries*: cint
    has_luminance*: cint


proc av_mastering_display_metadata_alloc*(): ptr AVMasteringDisplayMetadata {.cdecl,
    importc: "av_mastering_display_metadata_alloc", dynlib: avutildll.}
proc av_mastering_display_metadata_create_side_data*(frame: ptr AVFrame): ptr AVMasteringDisplayMetadata {.
    cdecl, importc: "av_mastering_display_metadata_create_side_data",
    dynlib: avutildll.}