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





//#include <stdint.h> // #23







typedef struct AVRC4 {
    uint8_t state[256];
    int x, y;
} AVRC4;




AVRC4 *av_rc4_alloc(void);








int av_rc4_init(struct AVRC4 *d, const uint8_t *key, int key_bits, int decrypt);










void av_rc4_crypt(struct AVRC4 *d, uint8_t *dst, const uint8_t *src, int count, uint8_t *iv, int decrypt);






