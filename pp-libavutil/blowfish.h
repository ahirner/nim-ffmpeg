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









typedef struct AVBlowfish {
    uint32_t p[16 + 2];
    uint32_t s[4][256];
} AVBlowfish;




AVBlowfish *av_blowfish_alloc(void);








void av_blowfish_init(struct AVBlowfish *ctx, const uint8_t *key, int key_len);









void av_blowfish_crypt_ecb(struct AVBlowfish *ctx, uint32_t *xl, uint32_t *xr,
                           int decrypt);



void av_blowfish_crypt(struct AVBlowfish *ctx, uint8_t *dst, const uint8_t *src,
                       int count, uint8_t *iv, int decrypt);






