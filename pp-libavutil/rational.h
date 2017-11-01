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












//#include <stdint.h> // #31
//#include <limits.h> // #32
//#include "attributes.h" // #33







typedef struct AVRational{
    int num; ///< Numerator
    int den; ///< Denominator
} AVRational;









static inline AVRational av_make_q(int num, int den)
{
    AVRational r = { num, den };
    return r;
}



static inline int av_cmp_q(AVRational a, AVRational b){
    const int64_t tmp= a.num * (int64_t)b.den - b.num * (int64_t)a.den;

    if(tmp) return (int)((tmp ^ a.den ^ b.den)>>63)|1;
    else if(b.den && a.den) return 0;
    else if(a.num && b.num) return (a.num>>31) - (b.num>>31);
    else                    return INT_MIN;
}







static inline double av_q2d(AVRational a){
    return a.num / (double) a.den;
}



int av_reduce(int *dst_num, int *dst_den, int64_t num, int64_t den, int64_t max);







AVRational av_mul_q(AVRational b, AVRational c) av_const;







AVRational av_div_q(AVRational b, AVRational c) av_const;







AVRational av_add_q(AVRational b, AVRational c) av_const;







AVRational av_sub_q(AVRational b, AVRational c) av_const;






static av_always_inline AVRational av_inv_q(AVRational q)
{
    AVRational r = { q.den, q.num };
    return r;
}



AVRational av_d2q(double d, int max) av_const;



int av_nearer_q(AVRational q, AVRational q1, AVRational q2);








int av_find_nearest_q_idx(AVRational q, const AVRational* q_list);










uint32_t av_q2intfloat(AVRational q);






