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





//#include <stdint.h> // #23

//#include "frame.h" // #25




enum AVStereo3DType {
    


    AV_STEREO3D_2D,

    







    AV_STEREO3D_SIDEBYSIDE,

    







    AV_STEREO3D_TOPBOTTOM,

    








    AV_STEREO3D_FRAMESEQUENCE,

    







    AV_STEREO3D_CHECKERBOARD,

    








    AV_STEREO3D_SIDEBYSIDE_QUINCUNX,

    







    AV_STEREO3D_LINES,

    







    AV_STEREO3D_COLUMNS,
};














typedef struct AVStereo3D {
    


    enum AVStereo3DType type;

    


    int flags;
} AVStereo3D;







AVStereo3D *av_stereo3d_alloc(void);








AVStereo3D *av_stereo3d_create_side_data(AVFrame *frame);








const char *av_stereo3d_type_name(unsigned int type);








int av_stereo3d_from_name(const char *name);


