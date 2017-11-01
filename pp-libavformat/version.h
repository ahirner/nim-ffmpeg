    #ifdef C2NIM
    #  dynlib avformatdll
    #  cdecl
    #  if defined(windows)
    #    define avformatdll "avformat.dll"
    #  elif defined(macosx)
    #    define avformatdll "libavformat.dylib"
    #  else
    #    define avformatdll "libavformat.so"
    #  endif
    #endif
    #include "../nim_ffmpeg_common.h"
#include "../libavutil/version.h"











//#include "libavutil/version.h" // #29

// Major bumping may affect Ticket5467, 5421, 5451(compatibility with Chromium)
// Also please add any ticket numbers that you believe might be affected here




















