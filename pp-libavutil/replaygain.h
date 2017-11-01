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






typedef struct AVReplayGain {
    



    int32_t track_gain;
    



    uint32_t track_peak;
    


    int32_t album_gain;
    


    uint32_t album_peak;
} AVReplayGain;


