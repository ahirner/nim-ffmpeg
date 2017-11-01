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











//#include <stdint.h> // #31


//#include <VideoToolbox/VideoToolbox.h> // #34


//#include "libavcodec/avcodec.h" // #37







typedef struct AVVideotoolboxContext {
    



    VTDecompressionSessionRef session;

    



    VTDecompressionOutputCallback output_callback;

    




    OSType cv_pix_fmt_type;

    



    CMVideoFormatDescriptionRef cm_fmt_desc;

    



    int cm_codec_type;
} AVVideotoolboxContext;



AVVideotoolboxContext *av_videotoolbox_alloc_context(void);









int av_videotoolbox_default_init(AVCodecContext *avctx);










int av_videotoolbox_default_init2(AVCodecContext *avctx, AVVideotoolboxContext *vtctx);







void av_videotoolbox_default_free(AVCodecContext *avctx);






