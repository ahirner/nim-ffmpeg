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





//#include <stdint.h> // #24

//#include "attributes.h" // #26
//#include "version.h" // #27




struct AVAESCTR;




struct AVAESCTR *av_aes_ctr_alloc(void);





int av_aes_ctr_init(struct AVAESCTR *a, const uint8_t *key);




void av_aes_ctr_free(struct AVAESCTR *a);







void av_aes_ctr_crypt(struct AVAESCTR *a, uint8_t *dst, const uint8_t *src, int size);




const uint8_t* av_aes_ctr_get_iv(struct AVAESCTR *a);




void av_aes_ctr_set_random_iv(struct AVAESCTR *a);




void av_aes_ctr_set_iv(struct AVAESCTR *a, const uint8_t* iv);




void av_aes_ctr_increment_iv(struct AVAESCTR *a);






