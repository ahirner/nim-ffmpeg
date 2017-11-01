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
#include "avutil.h"





//#include <stdint.h> // #21

//#include "avutil.h" // #23








av_warn_unused_result
int av_file_map(const char *filename, uint8_t **bufptr, size_t *size,
                int log_offset, void *log_ctx);







void av_file_unmap(uint8_t *bufptr, size_t size);



int av_tempfile(const char *prefix, char **filename, int log_offset, void *log_ctx);


