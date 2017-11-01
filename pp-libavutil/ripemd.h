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











//#include <stdint.h> // #30

//#include "attributes.h" // #32
//#include "version.h" // #33









extern const int av_ripemd_size;

struct AVRIPEMD;




struct AVRIPEMD *av_ripemd_alloc(void);








int av_ripemd_init(struct AVRIPEMD* context, int bits);








void av_ripemd_update(struct AVRIPEMD* context, const uint8_t* data, unsigned int len);







void av_ripemd_final(struct AVRIPEMD* context, uint8_t *digest);






