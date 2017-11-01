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
//#include "rational.h" // #24




typedef struct AVMasteringDisplayMetadata {
    


    AVRational display_primaries[3][2];

    


    AVRational white_point[2];

    


    AVRational min_luminance;

    


    AVRational max_luminance;

    


    int has_primaries;

    


    int has_luminance;

} AVMasteringDisplayMetadata;








AVMasteringDisplayMetadata *av_mastering_display_metadata_alloc(void);








AVMasteringDisplayMetadata *av_mastering_display_metadata_create_side_data(AVFrame *frame);


