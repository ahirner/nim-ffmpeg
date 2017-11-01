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





//#include <stdint.h> // #24

typedef struct AVLFG {
    unsigned int state[64];
    int index;
} AVLFG;

void av_lfg_init(AVLFG *c, unsigned int seed);






int av_lfg_init_from_data(AVLFG *c, const uint8_t *data, unsigned int length);







static inline unsigned int av_lfg_get(AVLFG *c){
    c->state[c->index & 63] = c->state[(c->index-24) & 63] + c->state[(c->index-55) & 63];
    return c->state[c->index++ & 63];
}






static inline unsigned int av_mlfg_get(AVLFG *c){
    unsigned int a= c->state[(c->index-55) & 63];
    unsigned int b= c->state[(c->index-24) & 63];
    return c->state[c->index++ & 63] = 2*a*b+a+b;
}







void av_bmg_get(AVLFG *lfg, double out[2]);


