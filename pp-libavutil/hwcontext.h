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
#include "buffer.h"
#include "frame.h"
#include "pixfmt.h"





//#include "buffer.h" // #21
//#include "frame.h" // #22
//#include "log.h" // #23
//#include "pixfmt.h" // #24

enum AVHWDeviceType {
    AV_HWDEVICE_TYPE_VDPAU,
    AV_HWDEVICE_TYPE_CUDA,
    AV_HWDEVICE_TYPE_VAAPI,
    AV_HWDEVICE_TYPE_DXVA2,
    AV_HWDEVICE_TYPE_QSV,
};

typedef struct AVHWDeviceInternal AVHWDeviceInternal;



typedef struct AVHWDeviceContext {
    


    const AVClass *av_class;

    



    AVHWDeviceInternal *internal;

    





    enum AVHWDeviceType type;

    

    void *hwctx;

    

    void (*free)(struct AVHWDeviceContext *ctx);

    


    void *user_opaque;
} AVHWDeviceContext;

typedef struct AVHWFramesInternal AVHWFramesInternal;



typedef struct AVHWFramesContext {
    


    const AVClass *av_class;

    



    AVHWFramesInternal *internal;

    




    AVBufferRef *device_ref;

    





    AVHWDeviceContext *device_ctx;

    

    void *hwctx;

    





    void (*free)(struct AVHWFramesContext *ctx);

    


    void *user_opaque;

    

    AVBufferPool *pool;

    






    int initial_pool_size;

    







    enum AVPixelFormat format;

    

    enum AVPixelFormat sw_format;

    




    int width, height;
} AVHWFramesContext;








AVBufferRef *av_hwdevice_ctx_alloc(enum AVHWDeviceType type);









int av_hwdevice_ctx_init(AVBufferRef *ref);



int av_hwdevice_ctx_create(AVBufferRef **device_ctx, enum AVHWDeviceType type,
                           const char *device, AVDictionary *opts, int flags);










AVBufferRef *av_hwframe_ctx_alloc(AVBufferRef *device_ctx);









int av_hwframe_ctx_init(AVBufferRef *ref);










int av_hwframe_get_buffer(AVBufferRef *hwframe_ctx, AVFrame *frame, int flags);



int av_hwframe_transfer_data(AVFrame *dst, const AVFrame *src, int flags);

enum AVHWFrameTransferDirection {
    


    AV_HWFRAME_TRANSFER_DIRECTION_FROM,

    


    AV_HWFRAME_TRANSFER_DIRECTION_TO,
};



int av_hwframe_transfer_get_formats(AVBufferRef *hwframe_ctx,
                                    enum AVHWFrameTransferDirection dir,
                                    enum AVPixelFormat **formats, int flags);








typedef struct AVHWFramesConstraints {
    



    enum AVPixelFormat *valid_hw_formats;

    




    enum AVPixelFormat *valid_sw_formats;

    



    int min_width;
    int min_height;

    



    int max_width;
    int max_height;
} AVHWFramesConstraints;



void *av_hwdevice_hwconfig_alloc(AVBufferRef *device_ctx);



AVHWFramesConstraints *av_hwdevice_get_hwframe_constraints(AVBufferRef *ref,
                                                           const void *hwconfig);






void av_hwframe_constraints_free(AVHWFramesConstraints **constraints);





enum {
    


    AV_HWFRAME_MAP_READ      = 1 << 0,
    


    AV_HWFRAME_MAP_WRITE     = 1 << 1,
    




    AV_HWFRAME_MAP_OVERWRITE = 1 << 2,
    




    AV_HWFRAME_MAP_DIRECT    = 1 << 3,
};



int av_hwframe_map(AVFrame *dst, const AVFrame *src, int flags);




int av_hwframe_ctx_create_derived(AVBufferRef **derived_frame_ctx,
                                  enum AVPixelFormat format,
                                  AVBufferRef *derived_device_ctx,
                                  AVBufferRef *source_frame_ctx,
                                  int flags);


