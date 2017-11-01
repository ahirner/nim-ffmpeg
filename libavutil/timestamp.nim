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


proc av_ts_make_string*(buf: cstring; ts: int64_t): cstring {.inline, cdecl.} =
  if ts == AV_NOPTS_VALUE: snprintf(buf, 32, "NOPTS")
  else: snprintf(buf, 32, "%", PRId64, ts)
  return buf

proc av_ts_make_time_string*(buf: cstring; ts: int64_t; tb: ptr AVRational): cstring {.
    inline, cdecl.} =
  if ts == AV_NOPTS_VALUE: snprintf(buf, 32, "NOPTS")
  else: snprintf(buf, 32, "%.6g", av_q2d(tb[]) * ts)
  return buf
