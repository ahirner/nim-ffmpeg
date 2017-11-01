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
#include "version.h"





//#include <stdarg.h> // #23
//#include "avutil.h" // #24
//#include "attributes.h" // #25
//#include "version.h" // #26

typedef enum {
    AV_CLASS_CATEGORY_NA = 0,
    AV_CLASS_CATEGORY_INPUT,
    AV_CLASS_CATEGORY_OUTPUT,
    AV_CLASS_CATEGORY_MUXER,
    AV_CLASS_CATEGORY_DEMUXER,
    AV_CLASS_CATEGORY_ENCODER,
    AV_CLASS_CATEGORY_DECODER,
    AV_CLASS_CATEGORY_FILTER,
    AV_CLASS_CATEGORY_BITSTREAM_FILTER,
    AV_CLASS_CATEGORY_SWSCALER,
    AV_CLASS_CATEGORY_SWRESAMPLER,
    AV_CLASS_CATEGORY_DEVICE_VIDEO_OUTPUT = 40,
    AV_CLASS_CATEGORY_DEVICE_VIDEO_INPUT,
    AV_CLASS_CATEGORY_DEVICE_AUDIO_OUTPUT,
    AV_CLASS_CATEGORY_DEVICE_AUDIO_INPUT,
    AV_CLASS_CATEGORY_DEVICE_OUTPUT,
    AV_CLASS_CATEGORY_DEVICE_INPUT,
    AV_CLASS_CATEGORY_NB  ///< not part of ABI/API
}AVClassCategory;











struct AVOptionRanges;






typedef struct AVClass {
    



    const char* class_name;

    



    const char* (*item_name)(void* ctx);

    




    const struct AVOption *option;

    





    int version;

    



    int log_level_offset_offset;

    






    int parent_log_context_offset;

    


    void* (*child_next)(void *obj, void *prev);

    







    const struct AVClass* (*child_class_next)(const struct AVClass *prev);

    




    AVClassCategory category;

    



    AVClassCategory (*get_category)(void* ctx);

    



    int (*query_ranges)(struct AVOptionRanges **, void *obj, const char *key, int flags);
} AVClass;














































































void av_log(void *avcl, int level, const char *fmt, ...) av_printf_format(3, 4);




void av_vlog(void *avcl, int level, const char *fmt, va_list vl);








int av_log_get_level(void);








void av_log_set_level(int level);



void av_log_set_callback(void (*callback)(void*, int, const char*, va_list));



void av_log_default_callback(void *avcl, int level, const char *fmt,
                             va_list vl);








const char* av_default_item_name(void* ctx);
AVClassCategory av_default_get_category(void *ptr);








void av_log_format_line(void *ptr, int level, const char *fmt, va_list vl,
                        char *line, int line_size, int *print_prefix);



int av_log_format_line2(void *ptr, int level, const char *fmt, va_list vl,
                        char *line, int line_size, int *print_prefix);





















void av_log_set_flags(int arg);
int av_log_get_flags(void);






