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
  ../nim_ffmpeg_common, attributes


type
  AVRational* {.bycopy.} = object
    num*: cint
    den*: cint


proc av_make_q*(num: cint; den: cint): AVRational {.inline, cdecl.} =
  var r: AVRational
  return r

proc av_cmp_q*(a: AVRational; b: AVRational): cint {.inline, cdecl.} =
  var tmp: int64_t
  if tmp: return (int)((tmp xor a.den xor b.den) shr 63) or 1
  elif b.den and a.den: return 0
  elif a.num and b.num: return (a.num shr 31) - (b.num shr 31)
  else: return INT_MIN
  
proc av_q2d*(a: AVRational): cdouble {.inline, cdecl.} =
  return a.num div cast[cdouble](a.den)

proc av_reduce*(dst_num: ptr cint; dst_den: ptr cint; num: int64_t; den: int64_t;
               max: int64_t): cint {.cdecl, importc: "av_reduce", dynlib: avutildll.}
proc av_mul_q*(b: AVRational; c: AVRational): AVRational {.cdecl, importc: "av_mul_q",
    dynlib: avutildll.}
proc av_div_q*(b: AVRational; c: AVRational): AVRational {.cdecl, importc: "av_div_q",
    dynlib: avutildll.}
proc av_add_q*(b: AVRational; c: AVRational): AVRational {.cdecl, importc: "av_add_q",
    dynlib: avutildll.}
proc av_sub_q*(b: AVRational; c: AVRational): AVRational {.cdecl, importc: "av_sub_q",
    dynlib: avutildll.}
proc av_inv_q*(q: AVRational): AVRational {.cdecl.} =
  var r: AVRational
  return r

proc av_d2q*(d: cdouble; max: cint): AVRational {.cdecl, importc: "av_d2q",
    dynlib: avutildll.}
proc av_nearer_q*(q: AVRational; q1: AVRational; q2: AVRational): cint {.cdecl,
    importc: "av_nearer_q", dynlib: avutildll.}
proc av_find_nearest_q_idx*(q: AVRational; q_list: ptr AVRational): cint {.cdecl,
    importc: "av_find_nearest_q_idx", dynlib: avutildll.}
proc av_q2intfloat*(q: AVRational): uint32_t {.cdecl, importc: "av_q2intfloat",
    dynlib: avutildll.}