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
#include "rational.h"
#include "intfloat.h"











//#include <stdint.h> // #29
//#include <math.h> // #30
//#include "attributes.h" // #31
//#include "rational.h" // #32
//#include "intfloat.h" // #33












enum AVRounding {
    AV_ROUND_ZERO     = 0, ///< Round toward zero.
    AV_ROUND_INF      = 1, ///< Round away from zero.
    AV_ROUND_DOWN     = 2, ///< Round toward -infinity.
    AV_ROUND_UP       = 3, ///< Round toward +infinity.
    AV_ROUND_NEAR_INF = 5, ///< Round to nearest and halfway cases away from zero.
    

    AV_ROUND_PASS_MINMAX = 8192,
};








int64_t av_const av_gcd(int64_t a, int64_t b);



int64_t av_rescale(int64_t a, int64_t b, int64_t c) av_const;









int64_t av_rescale_rnd(int64_t a, int64_t b, int64_t c, enum AVRounding rnd) av_const;










int64_t av_rescale_q(int64_t a, AVRational bq, AVRational cq) av_const;








int64_t av_rescale_q_rnd(int64_t a, AVRational bq, AVRational cq,
                         enum AVRounding rnd) av_const;



int av_compare_ts(int64_t ts_a, AVRational tb_a, int64_t ts_b, AVRational tb_b);



int64_t av_compare_mod(uint64_t a, uint64_t b, uint64_t mod);



int64_t av_rescale_delta(AVRational in_tb, int64_t in_ts,  AVRational fs_tb, int duration, int64_t *last, AVRational out_tb);



int64_t av_add_stable(AVRational ts_tb, int64_t ts, AVRational inc_tb, int64_t inc);







