    #ifdef C2NIM
    #  dynlib swscaledll
    #  cdecl
    #  if defined(windows)
    #    define swscaledll "swscale.dll"
    #  elif defined(macosx)
    #    define swscaledll "libswscale.dylib"
    #  else
    #    define swscaledll "libswscale.so"
    #  endif
    #endif
    #include "../nim_ffmpeg_common.h"
#include "../libavutil/avutil.h"
#include "../libavutil/pixfmt.h"











//#include <stdint.h> // #29

//#include "libavutil/avutil.h" // #31
//#include "libavutil/log.h" // #32
//#include "libavutil/pixfmt.h" // #33
//#include "version.h" // #34









unsigned swscale_version(void);




const char *swscale_configuration(void);




const char *swscale_license(void);











//the following 3 flags are not completely implemented
//internal chrominance subsampling info

//input subsampling info
























const int *sws_getCoefficients(int colorspace);

// when used for filters they must have an odd number of elements
// coeffs cannot be shared between vectors
typedef struct SwsVector {
    double *coeff;              ///< pointer to the list of coefficients
    int length;                 ///< number of coefficients in the vector
} SwsVector;

// vectors can be shared
typedef struct SwsFilter {
    SwsVector *lumH;
    SwsVector *lumV;
    SwsVector *chrH;
    SwsVector *chrV;
} SwsFilter;

struct SwsContext;





int sws_isSupportedInput(enum AVPixelFormat pix_fmt);





int sws_isSupportedOutput(enum AVPixelFormat pix_fmt);






int sws_isSupportedEndiannessConversion(enum AVPixelFormat pix_fmt);






struct SwsContext *sws_alloc_context(void);







av_warn_unused_result
int sws_init_context(struct SwsContext *sws_context, SwsFilter *srcFilter, SwsFilter *dstFilter);





void sws_freeContext(struct SwsContext *swsContext);



struct SwsContext *sws_getContext(int srcW, int srcH, enum AVPixelFormat srcFormat,
                                  int dstW, int dstH, enum AVPixelFormat dstFormat,
                                  int flags, SwsFilter *srcFilter,
                                  SwsFilter *dstFilter, const double *param);



int sws_scale(struct SwsContext *c, const uint8_t *const srcSlice[],
              const int srcStride[], int srcSliceY, int srcSliceH,
              uint8_t *const dst[], const int dstStride[]);



int sws_setColorspaceDetails(struct SwsContext *c, const int inv_table[4],
                             int srcRange, const int table[4], int dstRange,
                             int brightness, int contrast, int saturation);




int sws_getColorspaceDetails(struct SwsContext *c, int **inv_table,
                             int *srcRange, int **table, int *dstRange,
                             int *brightness, int *contrast, int *saturation);




SwsVector *sws_allocVec(int length);





SwsVector *sws_getGaussianVec(double variance, double quality);




void sws_scaleVec(SwsVector *a, double scalar);




void sws_normalizeVec(SwsVector *a, double height);



void sws_freeVec(SwsVector *a);

SwsFilter *sws_getDefaultFilter(float lumaGBlur, float chromaGBlur,
                                float lumaSharpen, float chromaSharpen,
                                float chromaHShift, float chromaVShift,
                                int verbose);
void sws_freeFilter(SwsFilter *filter);



struct SwsContext *sws_getCachedContext(struct SwsContext *context,
                                        int srcW, int srcH, enum AVPixelFormat srcFormat,
                                        int dstW, int dstH, enum AVPixelFormat dstFormat,
                                        int flags, SwsFilter *srcFilter,
                                        SwsFilter *dstFilter, const double *param);



void sws_convertPalette8ToPacked32(const uint8_t *src, uint8_t *dst, int num_pixels, const uint8_t *palette);



void sws_convertPalette8ToPacked24(const uint8_t *src, uint8_t *dst, int num_pixels, const uint8_t *palette);







const AVClass *sws_get_class(void);






