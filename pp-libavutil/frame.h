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
#include "buffer.h"
#include "dict.h"
#include "samplefmt.h"
#include "pixfmt.h"











//#include <stdint.h> // #27

//#include "avutil.h" // #29
//#include "buffer.h" // #30
//#include "dict.h" // #31
//#include "rational.h" // #32
//#include "samplefmt.h" // #33
//#include "pixfmt.h" // #34
//#include "version.h" // #35










enum AVFrameSideDataType {
    


    AV_FRAME_DATA_PANSCAN,
    




    AV_FRAME_DATA_A53_CC,
    



    AV_FRAME_DATA_STEREO3D,
    


    AV_FRAME_DATA_MATRIXENCODING,
    



    AV_FRAME_DATA_DOWNMIX_INFO,
    


    AV_FRAME_DATA_REPLAYGAIN,
    






    AV_FRAME_DATA_DISPLAYMATRIX,
    



    AV_FRAME_DATA_AFD,
    





    AV_FRAME_DATA_MOTION_VECTORS,
    

    AV_FRAME_DATA_SKIP_SAMPLES,
    



    AV_FRAME_DATA_AUDIO_SERVICE_TYPE,
    




    AV_FRAME_DATA_MASTERING_DISPLAY_METADATA,
    



    AV_FRAME_DATA_GOP_TIMECODE,

    



    AV_FRAME_DATA_SPHERICAL,
};

enum AVActiveFormatDescription {
    AV_AFD_SAME         = 8,
    AV_AFD_4_3          = 9,
    AV_AFD_16_9         = 10,
    AV_AFD_14_9         = 11,
    AV_AFD_4_3_SP_14_9  = 13,
    AV_AFD_16_9_SP_14_9 = 14,
    AV_AFD_SP_4_3       = 15,
};








typedef struct AVFrameSideData {
    enum AVFrameSideDataType type;
    uint8_t *data;
    int      size;
    AVDictionary *metadata;
    AVBufferRef *buf;
} AVFrameSideData;



typedef struct AVFrame {

    

    uint8_t *data[8];

    

    int linesize[8];

    

    uint8_t **extended_data;

    


    int width, height;

    


    int nb_samples;

    




    int format;

    


    int key_frame;

    


    enum AVPictureType pict_type;

    


    AVRational sample_aspect_ratio;

    


    int64_t pts;










    




    int64_t pkt_dts;

    


    int coded_picture_number;
    


    int display_picture_number;

    


    int quality;

    


    void *opaque;









    



    int repeat_pict;

    


    int interlaced_frame;

    


    int top_field_first;

    


    int palette_has_changed;

    








    int64_t reordered_opaque;

    


    int sample_rate;

    


    uint64_t channel_layout;

    

    AVBufferRef *buf[8];

    

    AVBufferRef **extended_buf;
    


    int        nb_extended_buf;

    AVFrameSideData **side_data;
    int            nb_side_data;





















    


    int flags;

    




    enum AVColorRange color_range;

    enum AVColorPrimaries color_primaries;

    enum AVColorTransferCharacteristic color_trc;

    




    enum AVColorSpace colorspace;

    enum AVChromaLocation chroma_location;

    




    int64_t best_effort_timestamp;

    




    int64_t pkt_pos;

    





    int64_t pkt_duration;

    




    AVDictionary *metadata;

    






    int decode_error_flags;



    




    int channels;

    






    int pkt_size;


    



    AVBufferRef *hw_frames_ctx;

    








    AVBufferRef *opaque_ref;
} AVFrame;





int64_t av_frame_get_best_effort_timestamp(const AVFrame *frame);
void    av_frame_set_best_effort_timestamp(AVFrame *frame, int64_t val);
int64_t av_frame_get_pkt_duration         (const AVFrame *frame);
void    av_frame_set_pkt_duration         (AVFrame *frame, int64_t val);
int64_t av_frame_get_pkt_pos              (const AVFrame *frame);
void    av_frame_set_pkt_pos              (AVFrame *frame, int64_t val);
int64_t av_frame_get_channel_layout       (const AVFrame *frame);
void    av_frame_set_channel_layout       (AVFrame *frame, int64_t val);
int     av_frame_get_channels             (const AVFrame *frame);
void    av_frame_set_channels             (AVFrame *frame, int     val);
int     av_frame_get_sample_rate          (const AVFrame *frame);
void    av_frame_set_sample_rate          (AVFrame *frame, int     val);
AVDictionary *av_frame_get_metadata       (const AVFrame *frame);
void          av_frame_set_metadata       (AVFrame *frame, AVDictionary *val);
int     av_frame_get_decode_error_flags   (const AVFrame *frame);
void    av_frame_set_decode_error_flags   (AVFrame *frame, int     val);
int     av_frame_get_pkt_size(const AVFrame *frame);
void    av_frame_set_pkt_size(AVFrame *frame, int val);
AVDictionary **avpriv_frame_get_metadatap(AVFrame *frame);




enum AVColorSpace av_frame_get_colorspace(const AVFrame *frame);
void    av_frame_set_colorspace(AVFrame *frame, enum AVColorSpace val);
enum AVColorRange av_frame_get_color_range(const AVFrame *frame);
void    av_frame_set_color_range(AVFrame *frame, enum AVColorRange val);





const char *av_get_colorspace_name(enum AVColorSpace val);



AVFrame *av_frame_alloc(void);








void av_frame_free(AVFrame **frame);



int av_frame_ref(AVFrame *dst, const AVFrame *src);








AVFrame *av_frame_clone(const AVFrame *src);




void av_frame_unref(AVFrame *frame);








void av_frame_move_ref(AVFrame *dst, AVFrame *src);



int av_frame_get_buffer(AVFrame *frame, int align);



int av_frame_is_writable(AVFrame *frame);



int av_frame_make_writable(AVFrame *frame);



int av_frame_copy(AVFrame *dst, const AVFrame *src);









int av_frame_copy_props(AVFrame *dst, const AVFrame *src);









AVBufferRef *av_frame_get_plane_buffer(AVFrame *frame, int plane);










AVFrameSideData *av_frame_new_side_data(AVFrame *frame,
                                        enum AVFrameSideDataType type,
                                        int size);





AVFrameSideData *av_frame_get_side_data(const AVFrame *frame,
                                        enum AVFrameSideDataType type);





void av_frame_remove_side_data(AVFrame *frame, enum AVFrameSideDataType type);




const char *av_frame_side_data_name(enum AVFrameSideDataType type);






