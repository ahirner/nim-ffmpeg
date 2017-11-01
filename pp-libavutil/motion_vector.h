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





//#include <stdint.h> // #21

typedef struct AVMotionVector {
    




    int32_t source;
    


    uint8_t w, h;
    


    int16_t src_x, src_y;
    


    int16_t dst_x, dst_y;
    



    uint64_t flags;
    




    int32_t motion_x, motion_y;
    uint16_t motion_scale;
} AVMotionVector;


