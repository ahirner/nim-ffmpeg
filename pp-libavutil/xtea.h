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









typedef struct AVXTEA {
    uint32_t key[16];
} AVXTEA;




AVXTEA *av_xtea_alloc(void);








void av_xtea_init(struct AVXTEA *ctx, const uint8_t key[16]);








void av_xtea_le_init(struct AVXTEA *ctx, const uint8_t key[16]);



void av_xtea_crypt(struct AVXTEA *ctx, uint8_t *dst, const uint8_t *src,
                   int count, uint8_t *iv, int decrypt);



void av_xtea_le_crypt(struct AVXTEA *ctx, uint8_t *dst, const uint8_t *src,
                      int count, uint8_t *iv, int decrypt);






