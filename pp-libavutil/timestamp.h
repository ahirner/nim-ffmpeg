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










//#include "common.h" // #26















static inline char *av_ts_make_string(char *buf, int64_t ts)
{
    if (ts == AV_NOPTS_VALUE) snprintf(buf, 32, "NOPTS");
    else                      snprintf(buf, 32, "%" PRId64, ts);
    return buf;
}
















static inline char *av_ts_make_time_string(char *buf, int64_t ts, AVRational *tb)
{
    if (ts == AV_NOPTS_VALUE) snprintf(buf, 32, "NOPTS");
    else                      snprintf(buf, 32, "%.6g", av_q2d(*tb) * ts);
    return buf;
}








