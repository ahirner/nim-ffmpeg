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
#include "config.h"










//#include <stdint.h> // #28
//#include "libavutil/avconfig.h" // #29
//#include "attributes.h" // #30










static av_always_inline av_const uint16_t av_bswap16(uint16_t x)
{
    x= (x>>8) | (x<<8);
    return x;
}



static av_always_inline av_const uint32_t av_bswap32(uint32_t x)
{
    return ((((x) << 8 & 0xff00) | ((x) >> 8 & 0x00ff)) << 16 | ((((x) >> 16) << 8 & 0xff00) | (((x) >> 16) >> 8 & 0x00ff)));
}



static inline uint64_t av_const av_bswap64(uint64_t x)
{
    return (uint64_t)av_bswap32(x) << 32 | av_bswap32(x >> 32);
}


// be2ne ... big-endian to native-endian
// le2ne ... little-endian to native-endian











