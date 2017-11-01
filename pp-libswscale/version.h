    #ifdef C2NIM
    #  dynlib swscaledll
    #  cdecl
    #  if defined(windows)
    #    define swscaledll "swscale.dll"
    #  elif defined(macosx)
    #    define swscaledll "libswscale.dylib"
    #  else
    #    define swscaledll "libswscale.so"
    #  endif
    #endif
    #include "../nim_ffmpeg_common.h"
#include "../libavutil/version.h"










//#include "libavutil/version.h" // #26


























