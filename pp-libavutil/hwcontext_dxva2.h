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
















//#include <d3d9.h> // #32
//#include <dxva2api.h> // #33




typedef struct AVDXVA2DeviceContext {
    IDirect3DDeviceManager9 *devmgr;
} AVDXVA2DeviceContext;




typedef struct AVDXVA2FramesContext {
    



    DWORD               surface_type;

    




    IDirect3DSurface9 **surfaces;
    int              nb_surfaces;

    







    IDirectXVideoDecoder *decoder_to_release;
} AVDXVA2FramesContext;


