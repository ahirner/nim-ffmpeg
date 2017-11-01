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











//#include <X11/extensions/XvMC.h> // #29

//#include "libavutil/attributes.h" // #31
//#include "version.h" // #32
//#include "avcodec.h" // #33











struct attribute_deprecated xvmc_pix_fmt {
    





    int             xvmc_id;

    






    short*          data_blocks;

    




    XvMCMacroBlock* mv_blocks;

    




    int             allocated_mv_blocks;

    



    int             allocated_data_blocks;

    




    int             idct;

    




    int             unsigned_intra;

    





    XvMCSurface*    p_surface;



//@{
    



    XvMCSurface*    p_past_surface;

    



    XvMCSurface*    p_future_surface;

    



    unsigned int    picture_structure;

    



    unsigned int    flags;
//}@

    






    int             start_mv_blocks_num;

    






    int             filled_mv_blocks_num;

    

    int             next_free_data_block_num;
};






