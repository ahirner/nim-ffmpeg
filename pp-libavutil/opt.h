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
#include "dict.h"
#include "pixfmt.h"
#include "samplefmt.h"










//#include "rational.h" // #29
//#include "avutil.h" // #30
//#include "dict.h" // #31
//#include "log.h" // #32
//#include "pixfmt.h" // #33
//#include "samplefmt.h" // #34
//#include "version.h" // #35




enum AVOptionType{
    AV_OPT_TYPE_FLAGS,
    AV_OPT_TYPE_INT,
    AV_OPT_TYPE_INT64,
    AV_OPT_TYPE_DOUBLE,
    AV_OPT_TYPE_FLOAT,
    AV_OPT_TYPE_STRING,
    AV_OPT_TYPE_RATIONAL,
    AV_OPT_TYPE_BINARY,  ///< offset must point to a pointer immediately followed by an int for the length
    AV_OPT_TYPE_DICT,
    AV_OPT_TYPE_UINT64,
    AV_OPT_TYPE_CONST = 128,
    AV_OPT_TYPE_IMAGE_SIZE = MKBETAG('S','I','Z','E'), ///< offset must point to two consecutive integers
    AV_OPT_TYPE_PIXEL_FMT  = MKBETAG('P','F','M','T'),
    AV_OPT_TYPE_SAMPLE_FMT = MKBETAG('S','F','M','T'),
    AV_OPT_TYPE_VIDEO_RATE = MKBETAG('V','R','A','T'), ///< offset must point to AVRational
    AV_OPT_TYPE_DURATION   = MKBETAG('D','U','R',' '),
    AV_OPT_TYPE_COLOR      = MKBETAG('C','O','L','R'),
    AV_OPT_TYPE_CHANNEL_LAYOUT = MKBETAG('C','H','L','A'),
    AV_OPT_TYPE_BOOL           = MKBETAG('B','O','O','L'),
};




typedef struct AVOption {
    const char *name;

    



    const char *help;

    



    int offset;
    enum AVOptionType type;

    


    union {
        int64_t i64;
        double dbl;
        const char *str;
        
        AVRational q;
    } default_val;
    double min;                 ///< minimum valid value for the option
    double max;                 ///< maximum valid value for the option

    int flags;


















//FIXME think about enc-audio, ... style flags

    




    const char *unit;
} AVOption;




typedef struct AVOptionRange {
    const char *str;
    




    double value_min, value_max;
    



    double component_min, component_max;
    



    int is_range;
} AVOptionRange;




typedef struct AVOptionRanges {
    

    AVOptionRange **range;
    


    int nb_ranges;
    


    int nb_components;
} AVOptionRanges;










int av_opt_show2(void *obj, void *av_log_obj, int req_flags, int rej_flags);






void av_opt_set_defaults(void *s);










void av_opt_set_defaults2(void *s, int mask, int flags);



int av_set_options_string(void *ctx, const char *opts,
                          const char *key_val_sep, const char *pairs_sep);



int av_opt_set_from_string(void *ctx, const char *opts,
                           const char *const *shorthand,
                           const char *key_val_sep, const char *pairs_sep);



void av_opt_free(void *obj);









int av_opt_flag_is_set(void *obj, const char *field_name, const char *flag_name);



int av_opt_set_dict(void *obj, struct AVDictionary **options);




int av_opt_set_dict2(void *obj, struct AVDictionary **options, int search_flags);



int av_opt_get_key_value(const char **ropts,
                         const char *key_val_sep, const char *pairs_sep,
                         unsigned flags,
                         char **rkey, char **rval);

enum {

    



    AV_OPT_FLAG_IMPLICIT_KEY = 1,
};



int av_opt_eval_flags (void *obj, const AVOption *o, const char *val, int        *flags_out);
int av_opt_eval_int   (void *obj, const AVOption *o, const char *val, int        *int_out);
int av_opt_eval_int64 (void *obj, const AVOption *o, const char *val, int64_t    *int64_out);
int av_opt_eval_float (void *obj, const AVOption *o, const char *val, float      *float_out);
int av_opt_eval_double(void *obj, const AVOption *o, const char *val, double     *double_out);
int av_opt_eval_q     (void *obj, const AVOption *o, const char *val, AVRational *q_out);





























const AVOption *av_opt_find(void *obj, const char *name, const char *unit,
                            int opt_flags, int search_flags);



const AVOption *av_opt_find2(void *obj, const char *name, const char *unit,
                             int opt_flags, int search_flags, void **target_obj);










const AVOption *av_opt_next(const void *obj, const AVOption *prev);







void *av_opt_child_next(void *obj, void *prev);







const AVClass *av_opt_child_class_next(const AVClass *parent, const AVClass *prev);



int av_opt_set         (void *obj, const char *name, const char *val, int search_flags);
int av_opt_set_int     (void *obj, const char *name, int64_t     val, int search_flags);
int av_opt_set_double  (void *obj, const char *name, double      val, int search_flags);
int av_opt_set_q       (void *obj, const char *name, AVRational  val, int search_flags);
int av_opt_set_bin     (void *obj, const char *name, const uint8_t *val, int size, int search_flags);
int av_opt_set_image_size(void *obj, const char *name, int w, int h, int search_flags);
int av_opt_set_pixel_fmt (void *obj, const char *name, enum AVPixelFormat fmt, int search_flags);
int av_opt_set_sample_fmt(void *obj, const char *name, enum AVSampleFormat fmt, int search_flags);
int av_opt_set_video_rate(void *obj, const char *name, AVRational val, int search_flags);
int av_opt_set_channel_layout(void *obj, const char *name, int64_t ch_layout, int search_flags);




int av_opt_set_dict_val(void *obj, const char *name, const AVDictionary *val, int search_flags);






















int av_opt_get         (void *obj, const char *name, int search_flags, uint8_t   **out_val);
int av_opt_get_int     (void *obj, const char *name, int search_flags, int64_t    *out_val);
int av_opt_get_double  (void *obj, const char *name, int search_flags, double     *out_val);
int av_opt_get_q       (void *obj, const char *name, int search_flags, AVRational *out_val);
int av_opt_get_image_size(void *obj, const char *name, int search_flags, int *w_out, int *h_out);
int av_opt_get_pixel_fmt (void *obj, const char *name, int search_flags, enum AVPixelFormat *out_fmt);
int av_opt_get_sample_fmt(void *obj, const char *name, int search_flags, enum AVSampleFormat *out_fmt);
int av_opt_get_video_rate(void *obj, const char *name, int search_flags, AVRational *out_val);
int av_opt_get_channel_layout(void *obj, const char *name, int search_flags, int64_t *ch_layout);




int av_opt_get_dict_val(void *obj, const char *name, int search_flags, AVDictionary **out_val);











void *av_opt_ptr(const AVClass *avclass, void *obj, const char *name);




void av_opt_freep_ranges(AVOptionRanges **ranges);



int av_opt_query_ranges(AVOptionRanges **, void *obj, const char *key, int flags);



int av_opt_copy(void *dest, const void *src);



int av_opt_query_ranges_default(AVOptionRanges **, void *obj, const char *key, int flags);



int av_opt_is_set_to_default(void *obj, const AVOption *o);



int av_opt_is_set_to_default_by_name(void *obj, const char *name, int search_flags);







int av_opt_serialize(void *obj, int opt_flags, int flags, char **buffer,
                     const char key_val_sep, const char pairs_sep);





