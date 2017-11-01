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
#include "pixdesc.h"













//#include "avutil.h" // #29
//#include "pixdesc.h" // #30
//#include "rational.h" // #31



void av_image_fill_max_pixsteps(int max_pixsteps[4], int max_pixstep_comps[4],
                                const AVPixFmtDescriptor *pixdesc);







int av_image_get_linesize(enum AVPixelFormat pix_fmt, int width, int plane);








int av_image_fill_linesizes(int linesizes[4], enum AVPixelFormat pix_fmt, int width);



int av_image_fill_pointers(uint8_t *data[4], enum AVPixelFormat pix_fmt, int height,
                           uint8_t *ptr, const int linesizes[4]);



int av_image_alloc(uint8_t *pointers[4], int linesizes[4],
                   int w, int h, enum AVPixelFormat pix_fmt, int align);



void av_image_copy_plane(uint8_t       *dst, int dst_linesize,
                         const uint8_t *src, int src_linesize,
                         int bytewidth, int height);







void av_image_copy(uint8_t *dst_data[4], int dst_linesizes[4],
                   const uint8_t *src_data[4], const int src_linesizes[4],
                   enum AVPixelFormat pix_fmt, int width, int height);



void av_image_copy_uc_from(uint8_t *dst_data[4],       const ptrdiff_t dst_linesizes[4],
                           const uint8_t *src_data[4], const ptrdiff_t src_linesizes[4],
                           enum AVPixelFormat pix_fmt, int width, int height);



int av_image_fill_arrays(uint8_t *dst_data[4], int dst_linesize[4],
                         const uint8_t *src,
                         enum AVPixelFormat pix_fmt, int width, int height, int align);







int av_image_get_buffer_size(enum AVPixelFormat pix_fmt, int width, int height, int align);



int av_image_copy_to_buffer(uint8_t *dst, int dst_size,
                            const uint8_t * const src_data[4], const int src_linesize[4],
                            enum AVPixelFormat pix_fmt, int width, int height, int align);



int av_image_check_size(unsigned int w, unsigned int h, int log_offset, void *log_ctx);



int av_image_check_size2(unsigned int w, unsigned int h, int64_t max_pixels, enum AVPixelFormat pix_fmt, int log_offset, void *log_ctx);



int av_image_check_sar(unsigned int w, unsigned int h, AVRational sar);







