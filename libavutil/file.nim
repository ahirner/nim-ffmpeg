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
  ../nim_ffmpeg_common, avutil


proc av_file_map*(filename: cstring; bufptr: ptr ptr uint8_t; size: ptr csize;
                 log_offset: cint; log_ctx: pointer): cint {.cdecl,
    importc: "av_file_map", dynlib: avutildll.}
proc av_file_unmap*(bufptr: ptr uint8_t; size: csize) {.cdecl,
    importc: "av_file_unmap", dynlib: avutildll.}
proc av_tempfile*(prefix: cstring; filename: cstringArray; log_offset: cint;
                 log_ctx: pointer): cint {.cdecl, importc: "av_tempfile",
                                        dynlib: avutildll.}