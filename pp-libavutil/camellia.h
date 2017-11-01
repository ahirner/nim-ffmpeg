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










extern const int av_camellia_size;

struct AVCAMELLIA;





struct AVCAMELLIA *av_camellia_alloc(void);








int av_camellia_init(struct AVCAMELLIA *ctx, const uint8_t *key, int key_bits);



void av_camellia_crypt(struct AVCAMELLIA *ctx, uint8_t *dst, const uint8_t *src, int count, uint8_t* iv, int decrypt);





