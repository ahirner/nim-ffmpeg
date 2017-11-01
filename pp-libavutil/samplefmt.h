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





//#include <stdint.h> // #21

//#include "avutil.h" // #23
//#include "attributes.h" // #24













enum AVSampleFormat {
    AV_SAMPLE_FMT_NONE = -1,
    AV_SAMPLE_FMT_U8,          ///< unsigned 8 bits
    AV_SAMPLE_FMT_S16,         ///< signed 16 bits
    AV_SAMPLE_FMT_S32,         ///< signed 32 bits
    AV_SAMPLE_FMT_FLT,         ///< float
    AV_SAMPLE_FMT_DBL,         ///< double

    AV_SAMPLE_FMT_U8P,         ///< unsigned 8 bits, planar
    AV_SAMPLE_FMT_S16P,        ///< signed 16 bits, planar
    AV_SAMPLE_FMT_S32P,        ///< signed 32 bits, planar
    AV_SAMPLE_FMT_FLTP,        ///< float, planar
    AV_SAMPLE_FMT_DBLP,        ///< double, planar
    AV_SAMPLE_FMT_S64,         ///< signed 64 bits
    AV_SAMPLE_FMT_S64P,        ///< signed 64 bits, planar

    AV_SAMPLE_FMT_NB           ///< Number of sample formats. DO NOT USE if linking dynamically
};





const char *av_get_sample_fmt_name(enum AVSampleFormat sample_fmt);





enum AVSampleFormat av_get_sample_fmt(const char *name);







enum AVSampleFormat av_get_alt_sample_fmt(enum AVSampleFormat sample_fmt, int planar);










enum AVSampleFormat av_get_packed_sample_fmt(enum AVSampleFormat sample_fmt);










enum AVSampleFormat av_get_planar_sample_fmt(enum AVSampleFormat sample_fmt);



char *av_get_sample_fmt_string(char *buf, int buf_size, enum AVSampleFormat sample_fmt);








int av_get_bytes_per_sample(enum AVSampleFormat sample_fmt);







int av_sample_fmt_is_planar(enum AVSampleFormat sample_fmt);



int av_samples_get_buffer_size(int *linesize, int nb_channels, int nb_samples,
                               enum AVSampleFormat sample_fmt, int align);












int av_samples_fill_arrays(uint8_t **audio_data, int *linesize,
                           const uint8_t *buf,
                           int nb_channels, int nb_samples,
                           enum AVSampleFormat sample_fmt, int align);



int av_samples_alloc(uint8_t **audio_data, int *linesize, int nb_channels,
                     int nb_samples, enum AVSampleFormat sample_fmt, int align);










int av_samples_alloc_array_and_samples(uint8_t ***audio_data, int *linesize, int nb_channels,
                                       int nb_samples, enum AVSampleFormat sample_fmt, int align);



int av_samples_copy(uint8_t **dst, uint8_t * const *src, int dst_offset,
                    int src_offset, int nb_samples, int nb_channels,
                    enum AVSampleFormat sample_fmt);










int av_samples_set_silence(uint8_t **audio_data, int offset, int nb_samples,
                           int nb_channels, enum AVSampleFormat sample_fmt);






