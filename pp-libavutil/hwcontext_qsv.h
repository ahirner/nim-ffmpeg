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





//#include <mfx/mfxvideo.h> // #21












typedef struct AVQSVDeviceContext {
    mfxSession session;
} AVQSVDeviceContext;




typedef struct AVQSVFramesContext {
    mfxFrameSurface1 *surfaces;
    int            nb_surfaces;

    


    int frame_type;
} AVQSVFramesContext;




