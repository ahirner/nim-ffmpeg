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









extern const int av_md5_size;

struct AVMD5;




struct AVMD5 *av_md5_alloc(void);






void av_md5_init(struct AVMD5 *ctx);








void av_md5_update(struct AVMD5 *ctx, const uint8_t *src, int len);







void av_md5_final(struct AVMD5 *ctx, uint8_t *dst);








void av_md5_sum(uint8_t *dst, const uint8_t *src, const int len);






