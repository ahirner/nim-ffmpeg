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











//#include "libavcodec/avcodec.h" // #31

//#include <stdint.h> // #33

// emmintrin.h is unable to compile with -std=c99 -Werror=missing-prototypes
// http://openradar.appspot.com/8026390



//#include <VideoDecodeAcceleration/VDADecoder.h> // #40


//#include "libavcodec/version.h" // #43

// extra flags not defined in VDADecoder.h
enum {
    kVDADecodeInfo_Asynchronous = 1UL << 0,
    kVDADecodeInfo_FrameDropped = 1UL << 1
};














struct vda_context {
    





    VDADecoder          decoder;

    





    CVPixelBufferRef    cv_buffer;

    





    int                 use_sync_decoding;

    





    int                 width;

    





    int                 height;

    





    int                 format;

    





    OSType              cv_pix_fmt_type;

    


    uint8_t             *priv_bitstream;

    


    int                 priv_bitstream_size;

    


    int                 priv_allocated_size;

    








    int                 use_ref_buffer;
};


int ff_vda_create_decoder(struct vda_context *vda_ctx,
                          uint8_t *extradata,
                          int extradata_size);


int ff_vda_destroy_decoder(struct vda_context *vda_ctx);







typedef struct AVVDAContext {
    


    VDADecoder decoder;

    



    VDADecoderOutputCallback output_callback;

    



    OSType cv_pix_fmt_type;
} AVVDAContext;



AVVDAContext *av_vda_alloc_context(void);









int av_vda_default_init(AVCodecContext *avctx);










int av_vda_default_init2(AVCodecContext *avctx, AVVDAContext *vdactx);







void av_vda_default_free(AVCodecContext *avctx);






