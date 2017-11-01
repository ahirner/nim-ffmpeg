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










//#include <stdint.h> // #29
//#include "rational.h" // #30



enum AVTimecodeFlag {
    AV_TIMECODE_FLAG_DROPFRAME      = 1<<0, ///< timecode is drop frame
    AV_TIMECODE_FLAG_24HOURSMAX     = 1<<1, ///< timecode wraps after 24 hours
    AV_TIMECODE_FLAG_ALLOWNEGATIVE  = 1<<2, ///< negative time values are allowed
};

typedef struct {
    int start;          ///< timecode frame start (first base frame number)
    uint32_t flags;     ///< flags such as drop frame, +24 hours support, ...
    AVRational rate;    ///< frame rate in rational form
    unsigned fps;       ///< frame per second; must be consistent with the rate field
} AVTimecode;









int av_timecode_adjust_ntsc_framenum2(int framenum, int fps);



uint32_t av_timecode_get_smpte_from_framenum(const AVTimecode *tc, int framenum);



char *av_timecode_make_string(const AVTimecode *tc, char *buf, int framenum);










char *av_timecode_make_smpte_tc_string(char *buf, uint32_t tcsmpte, int prevent_df);








char *av_timecode_make_mpeg_tc_string(char *buf, uint32_t tc25bit);



int av_timecode_init(AVTimecode *tc, AVRational rate, int flags, int frame_start, void *log_ctx);



int av_timecode_init_from_string(AVTimecode *tc, AVRational rate, const char *str, void *log_ctx);






int av_timecode_check_frame_rate(AVRational rate);


