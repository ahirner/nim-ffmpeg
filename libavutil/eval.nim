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



proc av_expr_parse_and_eval*(res: ptr cdouble; s: cstring; const_names: cstringArray;
                            const_values: ptr cdouble; func1_names: cstringArray;
    funcs1: proc (a2: pointer; a3: cdouble): cdouble {.cdecl.};
                            func2_names: cstringArray; funcs2: proc (a2: pointer;
    a3: cdouble; a4: cdouble): cdouble {.cdecl.}; opaque: pointer; log_offset: cint;
                            log_ctx: pointer): cint {.cdecl,
    importc: "av_expr_parse_and_eval", dynlib: avutildll.}
proc av_expr_parse*(expr: ptr ptr AVExpr; s: cstring; const_names: cstringArray;
                   func1_names: cstringArray;
                   funcs1: proc (a2: pointer; a3: cdouble): cdouble {.cdecl.};
                   func2_names: cstringArray; funcs2: proc (a2: pointer; a3: cdouble;
    a4: cdouble): cdouble {.cdecl.}; log_offset: cint; log_ctx: pointer): cint {.cdecl,
    importc: "av_expr_parse", dynlib: avutildll.}
proc av_expr_eval*(e: ptr AVExpr; const_values: ptr cdouble; opaque: pointer): cdouble {.
    cdecl, importc: "av_expr_eval", dynlib: avutildll.}
proc av_expr_free*(e: ptr AVExpr) {.cdecl, importc: "av_expr_free", dynlib: avutildll.}
proc av_strtod*(numstr: cstring; tail: cstringArray): cdouble {.cdecl,
    importc: "av_strtod", dynlib: avutildll.}