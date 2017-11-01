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
#include "macros.h"
#include "pixfmt.h"


























unsigned avutil_version(void);






const char *av_version_info(void);




const char *avutil_configuration(void);




const char *avutil_license(void);










enum AVMediaType {
    AVMEDIA_TYPE_UNKNOWN = -1,  ///< Usually treated as AVMEDIA_TYPE_DATA
    AVMEDIA_TYPE_VIDEO,
    AVMEDIA_TYPE_AUDIO,
    AVMEDIA_TYPE_DATA,          ///< Opaque data information usually continuous
    AVMEDIA_TYPE_SUBTITLE,
    AVMEDIA_TYPE_ATTACHMENT,    ///< Opaque data information usually sparse
    AVMEDIA_TYPE_NB
};





const char *av_get_media_type_string(enum AVMediaType media_type);


























































enum AVPictureType {
    AV_PICTURE_TYPE_NONE = 0, ///< Undefined
    AV_PICTURE_TYPE_I,     ///< Intra
    AV_PICTURE_TYPE_P,     ///< Predicted
    AV_PICTURE_TYPE_B,     ///< Bi-dir predicted
    AV_PICTURE_TYPE_S,     ///< S(GMC)-VOP MPEG-4
    AV_PICTURE_TYPE_SI,    ///< Switching Intra
    AV_PICTURE_TYPE_SP,    ///< Switching Predicted
    AV_PICTURE_TYPE_BI,    ///< BI type
};








char av_get_picture_type_char(enum AVPictureType pict_type);





//#include "common.h" // #295
//#include "error.h" // #296
//#include "rational.h" // #297
//#include "version.h" // #298
//#include "macros.h" // #299
//#include "mathematics.h" // #300
//#include "log.h" // #301
//#include "pixfmt.h" // #302




static inline void *av_x_if_null(const void *p, const void *x)
{
    return (void *)(intptr_t)(p ? p : x);
}









unsigned av_int_list_length_for_size(unsigned elsize,
                                     const void *list, uint64_t term) av_pure;
















FILE *av_fopen_utf8(const char *path, const char *mode);




AVRational av_get_time_base_q(void);













char *av_fourcc_make_string(char *buf, uint32_t fourcc);







