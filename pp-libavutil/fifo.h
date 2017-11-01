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
#include "avutil.h"
#include "attributes.h"










//#include <stdint.h> // #26
//#include "avutil.h" // #27
//#include "attributes.h" // #28

typedef struct AVFifoBuffer {
    uint8_t *buffer;
    uint8_t *rptr, *wptr, *end;
    uint32_t rndx, wndx;
} AVFifoBuffer;






AVFifoBuffer *av_fifo_alloc(unsigned int size);







AVFifoBuffer *av_fifo_alloc_array(size_t nmemb, size_t size);





void av_fifo_free(AVFifoBuffer *f);





void av_fifo_freep(AVFifoBuffer **f);





void av_fifo_reset(AVFifoBuffer *f);







int av_fifo_size(const AVFifoBuffer *f);







int av_fifo_space(const AVFifoBuffer *f);










int av_fifo_generic_peek_at(AVFifoBuffer *f, void *dest, int offset, int buf_size, void (*func)(void*, void*, int));









int av_fifo_generic_peek(AVFifoBuffer *f, void *dest, int buf_size, void (*func)(void*, void*, int));








int av_fifo_generic_read(AVFifoBuffer *f, void *dest, int buf_size, void (*func)(void*, void*, int));



int av_fifo_generic_write(AVFifoBuffer *f, void *src, int size, int (*func)(void*, void*, int));









int av_fifo_realloc2(AVFifoBuffer *f, unsigned int size);










int av_fifo_grow(AVFifoBuffer *f, unsigned int additional_space);






void av_fifo_drain(AVFifoBuffer *f, int size);



static inline uint8_t *av_fifo_peek2(const AVFifoBuffer *f, int offs)
{
    uint8_t *ptr = f->rptr + offs;
    if (ptr >= f->end)
        ptr = f->buffer + (ptr - f->end);
    else if (ptr < f->buffer)
        ptr = f->end - (f->buffer - ptr);
    return ptr;
}


