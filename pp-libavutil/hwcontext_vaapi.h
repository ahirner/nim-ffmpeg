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





//#include <va/va.h> // #21




enum {
    



    AV_VAAPI_DRIVER_QUIRK_USER_SET = (1 << 0),
    




    AV_VAAPI_DRIVER_QUIRK_RENDER_PARAM_BUFFERS = (1 << 1),

    



    AV_VAAPI_DRIVER_QUIRK_ATTRIB_MEMTYPE = (1 << 2),
};






typedef struct AVVAAPIDeviceContext {
    


    VADisplay display;
    






    unsigned int driver_quirks;
} AVVAAPIDeviceContext;






typedef struct AVVAAPIFramesContext {
    



    VASurfaceAttrib *attributes;
    int           nb_attributes;
    





    VASurfaceID     *surface_ids;
    int           nb_surfaces;
} AVVAAPIFramesContext;






typedef struct AVVAAPIHWConfig {
    


    VAConfigID config_id;
} AVVAAPIHWConfig;


