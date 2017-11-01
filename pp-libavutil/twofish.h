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










extern const int av_twofish_size;

struct AVTWOFISH;





struct AVTWOFISH *av_twofish_alloc(void);








int av_twofish_init(struct AVTWOFISH *ctx, const uint8_t *key, int key_bits);



void av_twofish_crypt(struct AVTWOFISH *ctx, uint8_t *dst, const uint8_t *src, int count, uint8_t* iv, int decrypt);





