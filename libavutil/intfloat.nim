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
  av_intfloat32* {.bycopy.} = object {.union.}
    i*: uint32_t
    f*: cfloat

  av_intfloat64* {.bycopy.} = object {.union.}
    i*: uint64_t
    f*: cdouble


proc av_int2float*(i: uint32_t): cfloat {.cdecl.} =
  var v: av_intfloat32
  v.i = i
  return v.f

proc av_float2int*(f: cfloat): uint32_t {.cdecl.} =
  var v: av_intfloat32
  v.f = f
  return v.i

proc av_int2double*(i: uint64_t): cdouble {.cdecl.} =
  var v: av_intfloat64
  v.i = i
  return v.f

proc av_double2int*(f: cdouble): uint64_t {.cdecl.} =
  var v: av_intfloat64
  v.f = f
  return v.i
