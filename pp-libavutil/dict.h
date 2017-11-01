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








//#include <stdint.h> // #32

//#include "version.h" // #34






typedef struct AVDictionaryEntry {
    char *key;
    char *value;
} AVDictionaryEntry;

typedef struct AVDictionary AVDictionary;



AVDictionaryEntry *av_dict_get(const AVDictionary *m, const char *key,
                               const AVDictionaryEntry *prev, int flags);







int av_dict_count(const AVDictionary *m);



int av_dict_set(AVDictionary **pm, const char *key, const char *value, int flags);







int av_dict_set_int(AVDictionary **pm, const char *key, int64_t value, int flags);



int av_dict_parse_string(AVDictionary **pm, const char *str,
                         const char *key_val_sep, const char *pairs_sep,
                         int flags);



int av_dict_copy(AVDictionary **dst, const AVDictionary *src, int flags);





void av_dict_free(AVDictionary **m);



int av_dict_get_string(const AVDictionary *m, char **buffer,
                       const char key_val_sep, const char pairs_sep);






