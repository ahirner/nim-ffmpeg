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





//#include <stddef.h> // #21
//#include <stdint.h> // #22
//#include "common.h" // #23




typedef int (*av_pixelutils_sad_fn)(const uint8_t *src1, ptrdiff_t stride1,
                                    const uint8_t *src2, ptrdiff_t stride2);



av_pixelutils_sad_fn av_pixelutils_get_sad_fn(int w_bits, int h_bits,
                                              int aligned, void *log_ctx);


