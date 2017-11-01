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
#include "attributes.h"
#include "pixfmt.h"





//#include <inttypes.h> // #24

//#include "attributes.h" // #26
//#include "pixfmt.h" // #27
//#include "version.h" // #28

typedef struct AVComponentDescriptor {
    


    int plane;

    



    int step;

    



    int offset;

    



    int shift;

    


    int depth;


} AVComponentDescriptor;










typedef struct AVPixFmtDescriptor {
    const char *name;
    uint8_t nb_components;  ///< The number of components each pixel has, (1-4)

    






    uint8_t log2_chroma_w;

    






    uint8_t log2_chroma_h;

    


    uint64_t flags;

    








    AVComponentDescriptor comp[4];

    


    const char *alias;
} AVPixFmtDescriptor;






















































int av_get_bits_per_pixel(const AVPixFmtDescriptor *pixdesc);





int av_get_padded_bits_per_pixel(const AVPixFmtDescriptor *pixdesc);





const AVPixFmtDescriptor *av_pix_fmt_desc_get(enum AVPixelFormat pix_fmt);








const AVPixFmtDescriptor *av_pix_fmt_desc_next(const AVPixFmtDescriptor *prev);





enum AVPixelFormat av_pix_fmt_desc_get_id(const AVPixFmtDescriptor *desc);



int av_pix_fmt_get_chroma_sub_sample(enum AVPixelFormat pix_fmt,
                                     int *h_shift, int *v_shift);





int av_pix_fmt_count_planes(enum AVPixelFormat pix_fmt);




const char *av_color_range_name(enum AVColorRange range);




const char *av_color_primaries_name(enum AVColorPrimaries primaries);




const char *av_color_transfer_name(enum AVColorTransferCharacteristic transfer);




const char *av_color_space_name(enum AVColorSpace space);




const char *av_chroma_location_name(enum AVChromaLocation location);



enum AVPixelFormat av_get_pix_fmt(const char *name);







const char *av_get_pix_fmt_name(enum AVPixelFormat pix_fmt);



char *av_get_pix_fmt_string(char *buf, int buf_size,
                            enum AVPixelFormat pix_fmt);



void av_read_image_line(uint16_t *dst, const uint8_t *data[4],
                        const int linesize[4], const AVPixFmtDescriptor *desc,
                        int x, int y, int c, int w, int read_pal_component);



void av_write_image_line(const uint16_t *src, uint8_t *data[4],
                         const int linesize[4], const AVPixFmtDescriptor *desc,
                         int x, int y, int c, int w);









enum AVPixelFormat av_pix_fmt_swap_endianness(enum AVPixelFormat pix_fmt);










int av_get_pix_fmt_loss(enum AVPixelFormat dst_pix_fmt,
                        enum AVPixelFormat src_pix_fmt,
                        int has_alpha);



enum AVPixelFormat av_find_best_pix_fmt_of_2(enum AVPixelFormat dst_pix_fmt1, enum AVPixelFormat dst_pix_fmt2,
                                             enum AVPixelFormat src_pix_fmt, int has_alpha, int *loss_ptr);


