    #ifdef C2NIM
    #  dynlib avcodecdll
    #  cdecl
    #  if defined(windows)
    #    define avcodecdll "avcodec.dll"
    #  elif defined(macosx)
    #    define avcodecdll "libavcodec.dylib"
    #  else
    #    define avcodecdll "libavcodec.so"
    #  endif
    #endif
    #include "../nim_ffmpeg_common.h"
#include "../libavutil/buffer.h"





//#include <mfx/mfxvideo.h> // #23

//#include "libavutil/buffer.h" // #25









typedef struct AVQSVContext {
    



    mfxSession session;

    


    int iopattern;

    


    mfxExtBuffer **ext_buffers;
    int         nb_ext_buffers;

    

    int opaque_alloc;

    








    int nb_opaque_surfaces;

    

    AVBufferRef *opaque_surfaces;

    




    int opaque_alloc_type;
} AVQSVContext;






AVQSVContext *av_qsv_alloc_context(void);


