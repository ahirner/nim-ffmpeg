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











//#include <stdint.h> // #27








typedef struct AVBuffer AVBuffer;







typedef struct AVBufferRef {
    AVBuffer *buffer;

    




    uint8_t *data;
    


    int      size;
} AVBufferRef;






AVBufferRef *av_buffer_alloc(int size);





AVBufferRef *av_buffer_allocz(int size);









AVBufferRef *av_buffer_create(uint8_t *data, int size,
                              void (*free)(void *opaque, uint8_t *data),
                              void *opaque, int flags);






void av_buffer_default_free(void *opaque, uint8_t *data);







AVBufferRef *av_buffer_ref(AVBufferRef *buf);







void av_buffer_unref(AVBufferRef **buf);







int av_buffer_is_writable(const AVBufferRef *buf);




void *av_buffer_get_opaque(const AVBufferRef *buf);

int av_buffer_get_ref_count(const AVBufferRef *buf);










int av_buffer_make_writable(AVBufferRef **buf);



int av_buffer_realloc(AVBufferRef **buf, int size);













typedef struct AVBufferPool AVBufferPool;










AVBufferPool *av_buffer_pool_init(int size, AVBufferRef* (*alloc)(int size));



AVBufferPool *av_buffer_pool_init2(int size, void *opaque,
                                   AVBufferRef* (*alloc)(void *opaque, int size),
                                   void (*pool_free)(void *opaque));









void av_buffer_pool_uninit(AVBufferPool **pool);







AVBufferRef *av_buffer_pool_get(AVBufferPool *pool);






