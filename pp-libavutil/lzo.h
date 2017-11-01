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












//#include <stdint.h> // #31



/// end of the input buffer reached before decoding finished

/// decoded data did not fit into output buffer

/// a reference to previously decoded data was wrong

/// a non-specific error in the compressed bitstream








int av_lzo1x_decode(void *out, int *outlen, const void *in, int *inlen);






