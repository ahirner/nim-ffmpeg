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



proc av_vorbis_parse_init*(extradata: ptr uint8_t; extradata_size: cint): ptr AVVorbisParseContext {.
    cdecl, importc: "av_vorbis_parse_init", dynlib: avcodecdll.}
proc av_vorbis_parse_free*(s: ptr ptr AVVorbisParseContext) {.cdecl,
    importc: "av_vorbis_parse_free", dynlib: avcodecdll.}
proc av_vorbis_parse_frame_flags*(s: ptr AVVorbisParseContext; buf: ptr uint8_t;
                                 buf_size: cint; flags: ptr cint): cint {.cdecl,
    importc: "av_vorbis_parse_frame_flags", dynlib: avcodecdll.}
proc av_vorbis_parse_frame*(s: ptr AVVorbisParseContext; buf: ptr uint8_t;
                           buf_size: cint): cint {.cdecl,
    importc: "av_vorbis_parse_frame", dynlib: avcodecdll.}
proc av_vorbis_parse_reset*(s: ptr AVVorbisParseContext) {.cdecl,
    importc: "av_vorbis_parse_reset", dynlib: avcodecdll.}