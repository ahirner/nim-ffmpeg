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
  AVTimecodeFlag* {.size: sizeof(cint).} = enum
    AV_TIMECODE_FLAG_DROPFRAME = 1 shl 0, AV_TIMECODE_FLAG_24HOURSMAX = 1 shl 1,
    AV_TIMECODE_FLAG_ALLOWNEGATIVE = 1 shl 2


type
  AVTimecode* {.bycopy.} = object
    start*: cint
    flags*: uint32_t
    rate*: AVRational
    fps*: cuint


proc av_timecode_adjust_ntsc_framenum2*(framenum: cint; fps: cint): cint {.cdecl,
    importc: "av_timecode_adjust_ntsc_framenum2", dynlib: avutildll.}
proc av_timecode_get_smpte_from_framenum*(tc: ptr AVTimecode; framenum: cint): uint32_t {.
    cdecl, importc: "av_timecode_get_smpte_from_framenum", dynlib: avutildll.}
proc av_timecode_make_string*(tc: ptr AVTimecode; buf: cstring; framenum: cint): cstring {.
    cdecl, importc: "av_timecode_make_string", dynlib: avutildll.}
proc av_timecode_make_smpte_tc_string*(buf: cstring; tcsmpte: uint32_t;
                                      prevent_df: cint): cstring {.cdecl,
    importc: "av_timecode_make_smpte_tc_string", dynlib: avutildll.}
proc av_timecode_make_mpeg_tc_string*(buf: cstring; tc25bit: uint32_t): cstring {.
    cdecl, importc: "av_timecode_make_mpeg_tc_string", dynlib: avutildll.}
proc av_timecode_init*(tc: ptr AVTimecode; rate: AVRational; flags: cint;
                      frame_start: cint; log_ctx: pointer): cint {.cdecl,
    importc: "av_timecode_init", dynlib: avutildll.}
proc av_timecode_init_from_string*(tc: ptr AVTimecode; rate: AVRational; str: cstring;
                                  log_ctx: pointer): cint {.cdecl,
    importc: "av_timecode_init_from_string", dynlib: avutildll.}
proc av_timecode_check_frame_rate*(rate: AVRational): cint {.cdecl,
    importc: "av_timecode_check_frame_rate", dynlib: avutildll.}