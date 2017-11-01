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
  ../nim_ffmpeg_common, attributes, rational, intfloat


type
  AVRounding* {.size: sizeof(cint).} = enum
    AV_ROUND_ZERO = 0, AV_ROUND_INF = 1, AV_ROUND_DOWN = 2, AV_ROUND_UP = 3,
    AV_ROUND_NEAR_INF = 5, AV_ROUND_PASS_MINMAX = 8192


proc av_gcd*(a: int64_t; b: int64_t): int64_t {.cdecl, importc: "av_gcd",
    dynlib: avutildll.}
proc av_rescale*(a: int64_t; b: int64_t; c: int64_t): int64_t {.cdecl,
    importc: "av_rescale", dynlib: avutildll.}
proc av_rescale_rnd*(a: int64_t; b: int64_t; c: int64_t; rnd: AVRounding): int64_t {.
    cdecl, importc: "av_rescale_rnd", dynlib: avutildll.}
proc av_rescale_q*(a: int64_t; bq: AVRational; cq: AVRational): int64_t {.cdecl,
    importc: "av_rescale_q", dynlib: avutildll.}
proc av_rescale_q_rnd*(a: int64_t; bq: AVRational; cq: AVRational; rnd: AVRounding): int64_t {.
    cdecl, importc: "av_rescale_q_rnd", dynlib: avutildll.}
proc av_compare_ts*(ts_a: int64_t; tb_a: AVRational; ts_b: int64_t; tb_b: AVRational): cint {.
    cdecl, importc: "av_compare_ts", dynlib: avutildll.}
proc av_compare_mod*(a: uint64_t; b: uint64_t; `mod`: uint64_t): int64_t {.cdecl,
    importc: "av_compare_mod", dynlib: avutildll.}
proc av_rescale_delta*(in_tb: AVRational; in_ts: int64_t; fs_tb: AVRational;
                      duration: cint; last: ptr int64_t; out_tb: AVRational): int64_t {.
    cdecl, importc: "av_rescale_delta", dynlib: avutildll.}
proc av_add_stable*(ts_tb: AVRational; ts: int64_t; inc_tb: AVRational; inc: int64_t): int64_t {.
    cdecl, importc: "av_add_stable", dynlib: avutildll.}