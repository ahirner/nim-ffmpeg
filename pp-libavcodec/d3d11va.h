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
















//#include <stdint.h> // #37
//#include <d3d11.h> // #38



















typedef struct AVD3D11VAContext {
    


    ID3D11VideoDecoder *decoder;

    


    ID3D11VideoContext *video_context;

    


    D3D11_VIDEO_DECODER_CONFIG *cfg;

    


    unsigned surface_count;

    


    ID3D11VideoDecoderOutputView **surface;

    


    uint64_t workaround;

    


    unsigned report_id;

    


    HANDLE  context_mutex;
} AVD3D11VAContext;






AVD3D11VAContext *av_d3d11va_alloc_context(void);






