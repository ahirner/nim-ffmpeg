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
#include "frame.h"





//#include "frame.h" // #23



















enum AVDownmixType {
    AV_DOWNMIX_TYPE_UNKNOWN, 
    AV_DOWNMIX_TYPE_LORO,    
    AV_DOWNMIX_TYPE_LTRT,    
    AV_DOWNMIX_TYPE_DPLII,   
    AV_DOWNMIX_TYPE_NB       
};







typedef struct AVDownmixInfo {
    


    enum AVDownmixType preferred_downmix_type;

    



    double center_mix_level;

    



    double center_mix_level_ltrt;

    



    double surround_mix_level;

    



    double surround_mix_level_ltrt;

    



    double lfe_mix_level;
} AVDownmixInfo;



AVDownmixInfo *av_downmix_info_update_side_data(AVFrame *frame);










