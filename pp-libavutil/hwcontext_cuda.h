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
#include "pixfmt.h"







//#include <cuda.h> // #23


//#include "pixfmt.h" // #26









typedef struct AVCUDADeviceContextInternal AVCUDADeviceContextInternal;




typedef struct AVCUDADeviceContext {
    CUcontext cuda_ctx;
    AVCUDADeviceContextInternal *internal;
} AVCUDADeviceContext;






