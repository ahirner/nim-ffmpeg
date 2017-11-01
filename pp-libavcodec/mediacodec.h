    #ifdef C2NIM
    #  dynlib avcodecdll
    #  cdecl
    #  if defined(windows)
    #    define avcodecdll "avcodec.dll"
    #  elif defined(macosx)
    #    define avcodecdll "libavcodec.dylib"
    #  else
    #    define avcodecdll "libavcodec.so"
    #  endif
    #endif
    #include "../nim_ffmpeg_common.h"
#include "avcodec.h"





//#include "libavcodec/avcodec.h" // #25






typedef struct AVMediaCodecContext {

    


    void *surface;

} AVMediaCodecContext;









AVMediaCodecContext *av_mediacodec_alloc_context(void);









int av_mediacodec_default_init(AVCodecContext *avctx, AVMediaCodecContext *ctx, void *surface);







void av_mediacodec_default_free(AVCodecContext *avctx);




typedef struct MediaCodecBuffer AVMediaCodecBuffer;



int av_mediacodec_release_buffer(AVMediaCodecBuffer *buffer, int render);


