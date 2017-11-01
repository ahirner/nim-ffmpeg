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

proc av_jni_set_java_vm*(vm: pointer; log_ctx: pointer): cint {.cdecl,
    importc: "av_jni_set_java_vm", dynlib: avcodecdll.}
proc av_jni_get_java_vm*(log_ctx: pointer): pointer {.cdecl,
    importc: "av_jni_get_java_vm", dynlib: avcodecdll.}