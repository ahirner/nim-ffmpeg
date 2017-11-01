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
#include "attributes.h"





//#include "attributes.h" // #23



    







                                        ///< than regular MMX/SSE (e.g. Core1)



                                        ///< than regular MMX/SSE (e.g. Core1)














int av_get_cpu_flags(void);





void av_force_cpu_flags(int flags);






attribute_deprecated void av_set_cpu_flags_mask(int mask);










attribute_deprecated
int av_parse_cpu_flags(const char *s);






int av_parse_cpu_caps(unsigned *flags, const char *s);




int av_cpu_count(void);


