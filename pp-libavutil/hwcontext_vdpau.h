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





//#include <vdpau/vdpau.h> // #21












typedef struct AVVDPAUDeviceContext {
    VdpDevice          device;
    VdpGetProcAddress *get_proc_address;
} AVVDPAUDeviceContext;






