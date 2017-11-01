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





//#include <stdint.h> // #24



























enum AVMatrixEncoding {
    AV_MATRIX_ENCODING_NONE,
    AV_MATRIX_ENCODING_DOLBY,
    AV_MATRIX_ENCODING_DPLII,
    AV_MATRIX_ENCODING_DPLIIX,
    AV_MATRIX_ENCODING_DPLIIZ,
    AV_MATRIX_ENCODING_DOLBYEX,
    AV_MATRIX_ENCODING_DOLBYHEADPHONE,
    AV_MATRIX_ENCODING_NB
};



uint64_t av_get_channel_layout(const char *name);



int av_get_extended_channel_layout(const char *name, uint64_t* channel_layout, int* nb_channels);








void av_get_channel_layout_string(char *buf, int buf_size, int nb_channels, uint64_t channel_layout);

struct AVBPrint;



void av_bprint_channel_layout(struct AVBPrint *bp, int nb_channels, uint64_t channel_layout);




int av_get_channel_layout_nb_channels(uint64_t channel_layout);




int64_t av_get_default_channel_layout(int nb_channels);










int av_get_channel_layout_channel_index(uint64_t channel_layout,
                                        uint64_t channel);




uint64_t av_channel_layout_extract_channel(uint64_t channel_layout, int index);






const char *av_get_channel_name(uint64_t channel);







const char *av_get_channel_description(uint64_t channel);










int av_get_standard_channel_layout(unsigned index, uint64_t *layout,
                                   const char **name);







