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
















//#include <stdint.h> // #36
//#include <d3d9.h> // #37
//#include <dxva2api.h> // #38

















struct dxva_context {
    


    IDirectXVideoDecoder *decoder;

    


    const DXVA2_ConfigPictureDecode *cfg;

    


    unsigned surface_count;

    


    LPDIRECT3DSURFACE9 *surface;

    


    uint64_t workaround;

    


    unsigned report_id;
};






