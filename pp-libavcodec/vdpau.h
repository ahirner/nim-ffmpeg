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
#include "../libavutil/attributes.h"
#include "avcodec.h"















//#include <vdpau/vdpau.h> // #51
//#include <vdpau/vdpau_x11.h> // #52
//#include "libavutil/avconfig.h" // #53
//#include "libavutil/attributes.h" // #54

//#include "avcodec.h" // #56
//#include "version.h" // #57










struct AVCodecContext;
struct AVFrame;

typedef int (*AVVDPAU_Render2)(struct AVCodecContext *, struct AVFrame *,
                               const VdpPictureInfo *, uint32_t,
                               const VdpBitstreamBuffer *);



typedef struct AVVDPAUContext {
    




    VdpDecoder decoder;

    




    VdpDecoderRender *render;


    AVVDPAU_Render2 render2;
} AVVDPAUContext;






AVVDPAUContext *av_alloc_vdpaucontext(void);

AVVDPAU_Render2 av_vdpau_hwaccel_get_render2(const AVVDPAUContext *);
void av_vdpau_hwaccel_set_render2(AVVDPAUContext *, AVVDPAU_Render2);



int av_vdpau_bind_context(AVCodecContext *avctx, VdpDevice device,
                          VdpGetProcAddress *get_proc_address, unsigned flags);



int av_vdpau_get_surface_parameters(AVCodecContext *avctx, VdpChromaType *type,
                                    uint32_t *width, uint32_t *height);






AVVDPAUContext *av_vdpau_alloc_context(void);








