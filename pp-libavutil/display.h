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





//#include <stdint.h> // #23
//#include "common.h" // #24






double av_display_rotation_get(const int32_t matrix[9]);









void av_display_rotation_set(int32_t matrix[9], double angle);








void av_display_matrix_flip(int32_t matrix[9], int hflip, int vflip);


