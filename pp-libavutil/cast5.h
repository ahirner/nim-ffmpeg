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










extern const int av_cast5_size;

struct AVCAST5;





struct AVCAST5 *av_cast5_alloc(void);








int av_cast5_init(struct AVCAST5 *ctx, const uint8_t *key, int key_bits);










void av_cast5_crypt(struct AVCAST5 *ctx, uint8_t *dst, const uint8_t *src, int count, int decrypt);



void av_cast5_crypt2(struct AVCAST5 *ctx, uint8_t *dst, const uint8_t *src, int count, uint8_t *iv, int decrypt);




