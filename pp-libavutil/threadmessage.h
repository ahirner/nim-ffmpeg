    #ifdef C2NIM
    #  dynlib avutildll
    #  cdecl
    #  if defined(windows)
    #    define avutildll "avutil.dll"
    #  elif defined(macosx)
    #    define avutildll "libavutil.dylib"
    #  else
    #    define avutildll "libavutil.so"
    #  endif
    #endif
    #include "../nim_ffmpeg_common.h"





typedef struct AVThreadMessageQueue AVThreadMessageQueue;

typedef enum AVThreadMessageFlags {

    




    AV_THREAD_MESSAGE_NONBLOCK = 1,

} AVThreadMessageFlags;










int av_thread_message_queue_alloc(AVThreadMessageQueue **mq,
                                  unsigned nelem,
                                  unsigned elsize);






void av_thread_message_queue_free(AVThreadMessageQueue **mq);




int av_thread_message_queue_send(AVThreadMessageQueue *mq,
                                 void *msg,
                                 unsigned flags);




int av_thread_message_queue_recv(AVThreadMessageQueue *mq,
                                 void *msg,
                                 unsigned flags);









void av_thread_message_queue_set_err_send(AVThreadMessageQueue *mq,
                                          int err);









void av_thread_message_queue_set_err_recv(AVThreadMessageQueue *mq,
                                          int err);





void av_thread_message_queue_set_free_func(AVThreadMessageQueue *mq,
                                           void (*free_func)(void *msg));








void av_thread_message_flush(AVThreadMessageQueue *mq);


