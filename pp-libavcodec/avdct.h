    #ifdef C2NIM
    #  dynlib avcodecdll
    #  cdecl
    #  if defined(windows)
    #    define avcodecdll "avcodec.dll"
    #  elif defined(macosx)
    #    define avcodecdll "libavcodec.dylib"
    #  else
    #    define avcodecdll "libavcodec.so"
    #  endif
    #endif
    #include "../nim_ffmpeg_common.h"
#include "../libavutil/opt.h"





//#include "libavutil/opt.h" // #21






typedef struct AVDCT {
    const AVClass *av_class;

    void (*idct)(int16_t *block );

    

    uint8_t idct_permutation[64];

    void (*fdct)(int16_t *block );


    



    int dct_algo;

    



    int idct_algo;

    void (*get_pixels)(int16_t *block ,
                       const uint8_t *pixels ,
                       ptrdiff_t line_size);

    int bits_per_sample;
} AVDCT;








AVDCT *avcodec_dct_alloc(void);
int avcodec_dct_init(AVDCT *);

const AVClass *avcodec_dct_get_class(void);


