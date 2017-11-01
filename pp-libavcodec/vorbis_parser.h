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












//#include <stdint.h> // #28

typedef struct AVVorbisParseContext AVVorbisParseContext;







AVVorbisParseContext *av_vorbis_parse_init(const uint8_t *extradata,
                                           int extradata_size);




void av_vorbis_parse_free(AVVorbisParseContext **s);







int av_vorbis_parse_frame_flags(AVVorbisParseContext *s, const uint8_t *buf,
                                int buf_size, int *flags);








int av_vorbis_parse_frame(AVVorbisParseContext *s, const uint8_t *buf,
                          int buf_size);

void av_vorbis_parse_reset(AVVorbisParseContext *s);


