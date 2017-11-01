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











//#include <stdint.h> // #29









struct AVMurMur3 *av_murmur3_alloc(void);



void av_murmur3_init_seeded(struct AVMurMur3 *c, uint64_t seed);



void av_murmur3_init(struct AVMurMur3 *c);








void av_murmur3_update(struct AVMurMur3 *c, const uint8_t *src, int len);







void av_murmur3_final(struct AVMurMur3 *c, uint8_t dst[16]);






