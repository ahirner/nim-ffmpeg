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










//#include <stddef.h> // #28
//#include <stdint.h> // #29




















enum AVSphericalProjection {
    



    AV_SPHERICAL_EQUIRECTANGULAR,

    






    AV_SPHERICAL_CUBEMAP,

    




    AV_SPHERICAL_EQUIRECTANGULAR_TILE,
};








typedef struct AVSphericalMapping {
    


    enum AVSphericalProjection projection;

    

    int32_t yaw;   ///< Rotation around the up vector [-180, 180].
    int32_t pitch; ///< Rotation around the right vector [-90, 90].
    int32_t roll;  ///< Rotation around the forward vector [-180, 180].
    



    

    uint32_t bound_left;   ///< Distance from the left edge
    uint32_t bound_top;    ///< Distance from the top edge
    uint32_t bound_right;  ///< Distance from the right edge
    uint32_t bound_bottom; ///< Distance from the bottom edge
    



    






    uint32_t padding;
} AVSphericalMapping;







AVSphericalMapping *av_spherical_alloc(size_t *size);



void av_spherical_tile_bounds(const AVSphericalMapping *map,
                              size_t width, size_t height,
                              size_t *left, size_t *top,
                              size_t *right, size_t *bottom);








const char *av_spherical_projection_name(enum AVSphericalProjection projection);








int av_spherical_from_name(const char *name);






