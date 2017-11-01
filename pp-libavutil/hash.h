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











//#include <stdint.h> // #29











struct AVHashContext;









int av_hash_alloc(struct AVHashContext **ctx, const char *name);









const char *av_hash_names(int i);




const char *av_hash_get_name(const struct AVHashContext *ctx);














int av_hash_get_size(const struct AVHashContext *ctx);






void av_hash_init(struct AVHashContext *ctx);








void av_hash_update(struct AVHashContext *ctx, const uint8_t *src, int len);



void av_hash_final(struct AVHashContext *ctx, uint8_t *dst);



void av_hash_final_bin(struct AVHashContext *ctx, uint8_t *dst, int size);



void av_hash_final_hex(struct AVHashContext *ctx, uint8_t *dst, int size);



void av_hash_final_b64(struct AVHashContext *ctx, uint8_t *dst, int size);






void av_hash_freep(struct AVHashContext **ctx);







