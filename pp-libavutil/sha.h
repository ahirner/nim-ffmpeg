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











//#include <stdint.h> // #29

//#include "attributes.h" // #31
//#include "version.h" // #32




extern const int av_sha_size;

struct AVSHA;




struct AVSHA *av_sha_alloc(void);








int av_sha_init(struct AVSHA* context, int bits);








void av_sha_update(struct AVSHA* context, const uint8_t* data, unsigned int len);







void av_sha_final(struct AVSHA* context, uint8_t *digest);






