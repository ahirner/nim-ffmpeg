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
#include "attributes.h"





//#include <stdint.h> // #23

//#include "attributes.h" // #25
//#include "version.h" // #26







extern const int av_aes_size;

struct AVAES;




struct AVAES *av_aes_alloc(void);






int av_aes_init(struct AVAES *a, const uint8_t *key, int key_bits, int decrypt);









void av_aes_crypt(struct AVAES *a, uint8_t *dst, const uint8_t *src, int count, uint8_t *iv, int decrypt);






