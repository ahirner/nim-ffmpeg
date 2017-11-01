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
  AVLFG* {.bycopy.} = object
    state*: array[64, cuint]
    index*: cint


proc av_lfg_init*(c: ptr AVLFG; seed: cuint) {.cdecl, importc: "av_lfg_init",
    dynlib: avutildll.}
proc av_lfg_init_from_data*(c: ptr AVLFG; data: ptr uint8_t; length: cuint): cint {.cdecl,
    importc: "av_lfg_init_from_data", dynlib: avutildll.}
proc av_lfg_get*(c: ptr AVLFG): cuint {.inline, cdecl.} =
  c.state[c.index and 63] = c.state[(c.index - 24) and 63] +
      c.state[(c.index - 55) and 63]
  return c.state[inc(c.index) and 63]

proc av_mlfg_get*(c: ptr AVLFG): cuint {.inline, cdecl.} =
  var a: cuint
  var b: cuint
  return c.state[inc(c.index) and 63] = 2 * a * b + a + b

proc av_bmg_get*(lfg: ptr AVLFG; `out`: array[2, cdouble]) {.cdecl,
    importc: "av_bmg_get", dynlib: avutildll.}