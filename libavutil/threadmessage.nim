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
  AVThreadMessageFlags* {.size: sizeof(cint).} = enum
    AV_THREAD_MESSAGE_NONBLOCK = 1


proc av_thread_message_queue_alloc*(mq: ptr ptr AVThreadMessageQueue; nelem: cuint;
                                   elsize: cuint): cint {.cdecl,
    importc: "av_thread_message_queue_alloc", dynlib: avutildll.}
proc av_thread_message_queue_free*(mq: ptr ptr AVThreadMessageQueue) {.cdecl,
    importc: "av_thread_message_queue_free", dynlib: avutildll.}
proc av_thread_message_queue_send*(mq: ptr AVThreadMessageQueue; msg: pointer;
                                  flags: cuint): cint {.cdecl,
    importc: "av_thread_message_queue_send", dynlib: avutildll.}
proc av_thread_message_queue_recv*(mq: ptr AVThreadMessageQueue; msg: pointer;
                                  flags: cuint): cint {.cdecl,
    importc: "av_thread_message_queue_recv", dynlib: avutildll.}
proc av_thread_message_queue_set_err_send*(mq: ptr AVThreadMessageQueue; err: cint) {.
    cdecl, importc: "av_thread_message_queue_set_err_send", dynlib: avutildll.}
proc av_thread_message_queue_set_err_recv*(mq: ptr AVThreadMessageQueue; err: cint) {.
    cdecl, importc: "av_thread_message_queue_set_err_recv", dynlib: avutildll.}
proc av_thread_message_queue_set_free_func*(mq: ptr AVThreadMessageQueue;
    free_func: proc (msg: pointer) {.cdecl.}) {.cdecl,
    importc: "av_thread_message_queue_set_free_func", dynlib: avutildll.}
proc av_thread_message_flush*(mq: ptr AVThreadMessageQueue) {.cdecl,
    importc: "av_thread_message_flush", dynlib: avutildll.}