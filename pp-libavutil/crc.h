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
//#include <stddef.h> // #30
//#include "attributes.h" // #31
//#include "version.h" // #32




typedef uint32_t AVCRC;

typedef enum {
    AV_CRC_8_ATM,
    AV_CRC_16_ANSI,
    AV_CRC_16_CCITT,
    AV_CRC_32_IEEE,
    AV_CRC_32_IEEE_LE,  
    AV_CRC_16_ANSI_LE,  



    AV_CRC_24_IEEE,

    AV_CRC_MAX,         
}AVCRCId;



int av_crc_init(AVCRC *ctx, int le, int bits, uint32_t poly, int ctx_size);






const AVCRC *av_crc_get_table(AVCRCId crc_id);








uint32_t av_crc(const AVCRC *ctx, uint32_t crc,
                const uint8_t *buffer, size_t length) av_pure;






