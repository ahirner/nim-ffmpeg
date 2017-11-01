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




extern const int av_sha512_size;

struct AVSHA512;




struct AVSHA512 *av_sha512_alloc(void);








int av_sha512_init(struct AVSHA512* context, int bits);








void av_sha512_update(struct AVSHA512* context, const uint8_t* data, unsigned int len);







void av_sha512_final(struct AVSHA512* context, uint8_t *digest);






