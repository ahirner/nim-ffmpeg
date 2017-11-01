    #ifdef C2NIM
    #  dynlib avformatdll
    #  cdecl
    #  if defined(windows)
    #    define avformatdll "avformat.dll"
    #  elif defined(macosx)
    #    define avformatdll "libavformat.dylib"
    #  else
    #    define avformatdll "libavformat.so"
    #  endif
    #endif
    #include "../nim_ffmpeg_common.h"
#include "../libavcodec/avcodec.h"
#include "../libavutil/dict.h"
#include "avio.h"














//#include <time.h> // #316
//#include <stdio.h>   // #317
//#include "libavcodec/avcodec.h" // #318
//#include "libavutil/dict.h" // #319
//#include "libavutil/log.h" // #320

//#include "avio.h" // #322
//#include "libavformat/version.h" // #323

struct AVFormatContext;

struct AVDeviceInfoList;
struct AVDeviceCapabilitiesQuery;
















int av_get_packet(AVIOContext *s, AVPacket *pkt, int size);




int av_append_packet(AVIOContext *s, AVPacket *pkt, int size);






struct AVCodecTag;




typedef struct AVProbeData {
    const char *filename;
    unsigned char *buf; 
    int buf_size;       
    const char *mime_type; 
} AVProbeData;










/// Demuxer will use avio_open, no opened file should be provided by the caller.








typedef struct AVOutputFormat {
    const char *name;
    




    const char *long_name;
    const char *mime_type;
    const char *extensions; 
    
    enum AVCodecID audio_codec;    
    enum AVCodecID video_codec;    
    enum AVCodecID subtitle_codec; 
    





    int flags;

    



    const struct AVCodecTag * const *codec_tag;


    const AVClass *priv_class; ///< AVClass for the private context

    






    struct AVOutputFormat *next;
    


    int priv_data_size;

    int (*write_header)(struct AVFormatContext *);
    






    int (*write_packet)(struct AVFormatContext *, AVPacket *pkt);
    int (*write_trailer)(struct AVFormatContext *);
    


    int (*interleave_packet)(struct AVFormatContext *, AVPacket *out,
                             AVPacket *in, int flush);
    






    int (*query_codec)(enum AVCodecID id, int std_compliance);

    void (*get_output_timestamp)(struct AVFormatContext *s, int stream,
                                 int64_t *dts, int64_t *wall);
    


    int (*control_message)(struct AVFormatContext *s, int type,
                           void *data, size_t data_size);

    







    int (*write_uncoded_frame)(struct AVFormatContext *, int stream_index,
                               AVFrame **frame, unsigned flags);
    



    int (*get_device_list)(struct AVFormatContext *s, struct AVDeviceInfoList *device_list);
    



    int (*create_device_capabilities)(struct AVFormatContext *s, struct AVDeviceCapabilitiesQuery *caps);
    



    int (*free_device_capabilities)(struct AVFormatContext *s, struct AVDeviceCapabilitiesQuery *caps);
    enum AVCodecID data_codec; 
    








    int (*init)(struct AVFormatContext *);
    







    void (*deinit)(struct AVFormatContext *);
    




    int (*check_bitstream)(struct AVFormatContext *, const AVPacket *pkt);
} AVOutputFormat;








typedef struct AVInputFormat {
    



    const char *name;

    




    const char *long_name;

    




    int flags;

    




    const char *extensions;

    const struct AVCodecTag * const *codec_tag;

    const AVClass *priv_class; ///< AVClass for the private context

    




    const char *mime_type;

    






    struct AVInputFormat *next;

    


    int raw_codec_id;

    


    int priv_data_size;

    




    int (*read_probe)(AVProbeData *);

    




    int (*read_header)(struct AVFormatContext *);

    








    int (*read_packet)(struct AVFormatContext *, AVPacket *pkt);

    



    int (*read_close)(struct AVFormatContext *);

    







    int (*read_seek)(struct AVFormatContext *,
                     int stream_index, int64_t timestamp, int flags);

    



    int64_t (*read_timestamp)(struct AVFormatContext *s, int stream_index,
                              int64_t *pos, int64_t pos_limit);

    



    int (*read_play)(struct AVFormatContext *);

    



    int (*read_pause)(struct AVFormatContext *);

    





    int (*read_seek2)(struct AVFormatContext *s, int stream_index, int64_t min_ts, int64_t ts, int64_t max_ts, int flags);

    



    int (*get_device_list)(struct AVFormatContext *s, struct AVDeviceInfoList *device_list);

    



    int (*create_device_capabilities)(struct AVFormatContext *s, struct AVDeviceCapabilitiesQuery *caps);

    



    int (*free_device_capabilities)(struct AVFormatContext *s, struct AVDeviceCapabilitiesQuery *caps);
} AVInputFormat;




enum AVStreamParseType {
    AVSTREAM_PARSE_NONE,
    AVSTREAM_PARSE_FULL,       
    AVSTREAM_PARSE_HEADERS,    
    AVSTREAM_PARSE_TIMESTAMPS, 
    AVSTREAM_PARSE_FULL_ONCE,  
    AVSTREAM_PARSE_FULL_RAW=MKTAG(0,'R','A','W'),       


};

typedef struct AVIndexEntry {
    int64_t pos;
    int64_t timestamp;        









    int flags:2;
    int size:30; //Yeah, trying to keep the size of this small to reduce memory requirements (it is 24 vs. 32 bytes due to possible 8-byte alignment).
    int min_distance;         
} AVIndexEntry;































typedef struct AVStreamInternal AVStreamInternal;






















typedef struct AVStream {
    int index;    
    




    int id;







    void *priv_data;









    

    AVRational time_base;

    







    int64_t start_time;

    







    int64_t duration;

    int64_t nb_frames;                 ///< number of frames in this stream if known or 0

    int disposition; 

    enum AVDiscard discard; ///< Selects which packets can be discarded at will and do not need to be demuxed.

    




    AVRational sample_aspect_ratio;

    AVDictionary *metadata;

    






    AVRational avg_frame_rate;

    






    AVPacket attached_pic;

    

    AVPacketSideData *side_data;
    


    int            nb_side_data;

    




    int event_flags;


    









    



    struct {
        int64_t last_dts;
        int64_t duration_gcd;
        int duration_count;
        int64_t rfps_duration_sum;
        double (*duration_error)[2][(30*12+30+3+6)];
        int64_t codec_info_duration;
        int64_t codec_info_duration_fields;

        




        int found_decoder;

        int64_t last_duration;

        


        int64_t fps_first_dts;
        int     fps_first_dts_idx;
        int64_t fps_last_dts;
        int     fps_last_dts_idx;

    } *info;

    int pts_wrap_bits; 

    // Timestamp generation support:
    






    int64_t first_dts;
    int64_t cur_dts;
    int64_t last_IP_pts;
    int last_IP_duration;

    


    int probe_packets;

    


    int codec_info_nb_frames;

    
    enum AVStreamParseType need_parsing;
    struct AVCodecParserContext *parser;

    


    struct AVPacketList *last_in_packet_buffer;
    AVProbeData probe_data;

    int64_t pts_buffer[16 +1];

    AVIndexEntry *index_entries; 

    int nb_index_entries;
    unsigned int index_entries_allocated_size;

    

    AVRational r_frame_rate;

    




    int stream_identifier;

    int64_t interleaver_chunk_size;
    int64_t interleaver_chunk_duration;

    






    int request_probe;
    



    int skip_to_keyframe;

    


    int skip_samples;

    






    int64_t start_skip_samples;

    





    int64_t first_discard_sample;

    




    int64_t last_discard_sample;

    



    int nb_decoded_frames;

    



    int64_t mux_ts_offset;

    


    int64_t pts_wrap_reference;

    

    int pts_wrap_behavior;

    


    int update_initial_durations_done;

    


    int64_t pts_reorder_error[16 +1];
    uint8_t pts_reorder_error_count[16 +1];

    


    int64_t last_dts_for_order_check;
    uint8_t dts_ordered;
    uint8_t dts_misordered;

    


    int inject_global_side_data;

    





    




    char *recommended_encoder_configuration;

    




    AVRational display_aspect_ratio;

    struct FFFrac *priv_pts;

    



    AVStreamInternal *internal;

    








    AVCodecParameters *codecpar;
} AVStream;

AVRational av_stream_get_r_frame_rate(const AVStream *s);
void       av_stream_set_r_frame_rate(AVStream *s, AVRational r);
struct AVCodecParserContext *av_stream_get_parser(const AVStream *s);
char* av_stream_get_recommended_encoder_configuration(const AVStream *s);
void  av_stream_set_recommended_encoder_configuration(AVStream *s, char *configuration);






int64_t    av_stream_get_end_pts(const AVStream *st);









typedef struct AVProgram {
    int            id;
    int            flags;
    enum AVDiscard discard;        ///< selects which program to discard and which to feed to the caller
    unsigned int   *stream_index;
    unsigned int   nb_stream_indexes;
    AVDictionary *metadata;

    int program_num;
    int pmt_pid;
    int pcr_pid;

    






    int64_t start_time;
    int64_t end_time;

    int64_t pts_wrap_reference;    ///< reference dts for wrap detection
    int pts_wrap_behavior;         ///< behavior on wrap detection
} AVProgram;




typedef struct AVChapter {
    int id;                 ///< unique ID to identify the chapter
    AVRational time_base;   ///< time base in which the start/end timestamps are specified
    int64_t start, end;     ///< chapter start/end time in time_base units
    AVDictionary *metadata;
} AVChapter;





typedef int (*av_format_control_message)(struct AVFormatContext *s, int type,
                                         void *data, size_t data_size);

typedef int (*AVOpenCallback)(struct AVFormatContext *s, AVIOContext **pb, const char *url, int flags,
                              const AVIOInterruptCB *int_cb, AVDictionary **options);





enum AVDurationEstimationMethod {
    AVFMT_DURATION_FROM_PTS,    ///< Duration accurately estimated from PTSes
    AVFMT_DURATION_FROM_STREAM, ///< Duration estimated from a stream with a known duration
    AVFMT_DURATION_FROM_BITRATE ///< Duration estimated from bitrate (less accurate)
};

typedef struct AVFormatInternal AVFormatInternal;



typedef struct AVFormatContext {
    



    const AVClass *av_class;

    




    struct AVInputFormat *iformat;

    




    struct AVOutputFormat *oformat;

    






    void *priv_data;

    

    AVIOContext *pb;

    
    



    int ctx_flags;

    




    unsigned int nb_streams;
    

    AVStream **streams;

    





    char filename[1024];

    






    int64_t start_time;

    







    int64_t duration;

    




    int64_t bit_rate;

    unsigned int packet_size;
    int max_delay;

    



    int flags;









    




    int64_t probesize;

    





    int64_t max_analyze_duration;

    const uint8_t *key;
    int keylen;

    unsigned int nb_programs;
    AVProgram **programs;

    



    enum AVCodecID video_codec_id;

    



    enum AVCodecID audio_codec_id;

    



    enum AVCodecID subtitle_codec_id;

    

    unsigned int max_index_size;

    



    unsigned int max_picture_buffer;

    

    unsigned int nb_chapters;
    AVChapter **chapters;

    







    AVDictionary *metadata;

    

    int64_t start_time_realtime;

    




    int fps_probe_size;

    




    int error_recognition;

    








    AVIOInterruptCB interrupt_callback;

    


    int debug;


    

    int64_t max_interleave_delta;

    



    int strict_std_compliance;

    




    int event_flags;


    



    int max_ts_probe;

    






    int avoid_negative_ts;




    



    int ts_id;

    





    int audio_preload;

    





    int max_chunk_duration;

    





    int max_chunk_size;

    





    int use_wallclock_as_timestamps;

    




    int avio_flags;

    





    enum AVDurationEstimationMethod duration_estimation_method;

    




    int64_t skip_initial_bytes;

    




    unsigned int correct_ts_overflow;

    




    int seek2any;

    




    int flush_packets;

    






    int probe_score;

    




    int format_probesize;

    





    char *codec_whitelist;

    





    char *format_whitelist;

    



    AVFormatInternal *internal;

    





    int io_repositioned;

    





    AVCodec *video_codec;

    





    AVCodec *audio_codec;

    





    AVCodec *subtitle_codec;

    





    AVCodec *data_codec;

    




    int metadata_header_padding;

    



    void *opaque;

    


    av_format_control_message control_message_cb;

    



    int64_t output_ts_offset;

    





    uint8_t *dump_separator;

    



    enum AVCodecID data_codec_id;



    




    char *protocol_whitelist;

    

    int (*io_open)(struct AVFormatContext *s, AVIOContext **pb, const char *url,
                   int flags, AVDictionary **options);

    


    void (*io_close)(struct AVFormatContext *s, AVIOContext *pb);

    




    char *protocol_blacklist;

    




    int max_streams;
} AVFormatContext;





int av_format_get_probe_score(const AVFormatContext *s);
AVCodec * av_format_get_video_codec(const AVFormatContext *s);
void      av_format_set_video_codec(AVFormatContext *s, AVCodec *c);
AVCodec * av_format_get_audio_codec(const AVFormatContext *s);
void      av_format_set_audio_codec(AVFormatContext *s, AVCodec *c);
AVCodec * av_format_get_subtitle_codec(const AVFormatContext *s);
void      av_format_set_subtitle_codec(AVFormatContext *s, AVCodec *c);
AVCodec * av_format_get_data_codec(const AVFormatContext *s);
void      av_format_set_data_codec(AVFormatContext *s, AVCodec *c);
int       av_format_get_metadata_header_padding(const AVFormatContext *s);
void      av_format_set_metadata_header_padding(AVFormatContext *s, int c);
void *    av_format_get_opaque(const AVFormatContext *s);
void      av_format_set_opaque(AVFormatContext *s, void *opaque);
av_format_control_message av_format_get_control_message_cb(const AVFormatContext *s);
void      av_format_set_control_message_cb(AVFormatContext *s, av_format_control_message callback);









void av_format_inject_global_side_data(AVFormatContext *s);






enum AVDurationEstimationMethod av_fmt_ctx_get_duration_estimation_method(const AVFormatContext* ctx);

typedef struct AVPacketList {
    AVPacket pkt;
    struct AVPacketList *next;
} AVPacketList;














unsigned avformat_version(void);




const char *avformat_configuration(void);




const char *avformat_license(void);









void av_register_all(void);

void av_register_input_format(AVInputFormat *format);
void av_register_output_format(AVOutputFormat *format);









int avformat_network_init(void);




int avformat_network_deinit(void);






AVInputFormat  *av_iformat_next(const AVInputFormat  *f);






AVOutputFormat *av_oformat_next(const AVOutputFormat *f);






AVFormatContext *avformat_alloc_context(void);





void avformat_free_context(AVFormatContext *s);







const AVClass *avformat_get_class(void);



AVStream *avformat_new_stream(AVFormatContext *s, const AVCodec *c);



int av_stream_add_side_data(AVStream *st, enum AVPacketSideDataType type,
                            uint8_t *data, size_t size);









uint8_t *av_stream_new_side_data(AVStream *stream,
                                 enum AVPacketSideDataType type, int size);












uint8_t *av_stream_get_side_data(const AVStream *stream,
                                 enum AVPacketSideDataType type, int *size);


AVProgram *av_new_program(AVFormatContext *s, int id);








int avformat_alloc_output_context2(AVFormatContext **ctx, AVOutputFormat *oformat,
                                   const char *format_name, const char *filename);









AVInputFormat *av_find_input_format(const char *short_name);








AVInputFormat *av_probe_input_format(AVProbeData *pd, int is_opened);



AVInputFormat *av_probe_input_format2(AVProbeData *pd, int is_opened, int *score_max);








AVInputFormat *av_probe_input_format3(AVProbeData *pd, int is_opened, int *score_ret);



int av_probe_input_buffer2(AVIOContext *pb, AVInputFormat **fmt,
                           const char *url, void *logctx,
                           unsigned int offset, unsigned int max_probe_size);




int av_probe_input_buffer(AVIOContext *pb, AVInputFormat **fmt,
                          const char *url, void *logctx,
                          unsigned int offset, unsigned int max_probe_size);



int avformat_open_input(AVFormatContext **ps, const char *url, AVInputFormat *fmt, AVDictionary **options);

attribute_deprecated
int av_demuxer_open(AVFormatContext *ic);



int avformat_find_stream_info(AVFormatContext *ic, AVDictionary **options);



AVProgram *av_find_program_from_stream(AVFormatContext *ic, AVProgram *last, int s);

void av_program_add_stream_index(AVFormatContext *ac, int progid, unsigned int idx);



int av_find_best_stream(AVFormatContext *ic,
                        enum AVMediaType type,
                        int wanted_stream_nb,
                        int related_stream,
                        AVCodec **decoder_ret,
                        int flags);



int av_read_frame(AVFormatContext *s, AVPacket *pkt);



int av_seek_frame(AVFormatContext *s, int stream_index, int64_t timestamp,
                  int flags);



int avformat_seek_file(AVFormatContext *s, int stream_index, int64_t min_ts, int64_t ts, int64_t max_ts, int flags);



int avformat_flush(AVFormatContext *s);





int av_read_play(AVFormatContext *s);






int av_read_pause(AVFormatContext *s);





void avformat_close_input(AVFormatContext **s);



















av_warn_unused_result
int avformat_write_header(AVFormatContext *s, AVDictionary **options);



av_warn_unused_result
int avformat_init_output(AVFormatContext *s, AVDictionary **options);



int av_write_frame(AVFormatContext *s, AVPacket *pkt);



int av_interleaved_write_frame(AVFormatContext *s, AVPacket *pkt);









int av_write_uncoded_frame(AVFormatContext *s, int stream_index,
                           AVFrame *frame);



int av_interleaved_write_uncoded_frame(AVFormatContext *s, int stream_index,
                                       AVFrame *frame);







int av_write_uncoded_frame_query(AVFormatContext *s, int stream_index);










int av_write_trailer(AVFormatContext *s);



AVOutputFormat *av_guess_format(const char *short_name,
                                const char *filename,
                                const char *mime_type);




enum AVCodecID av_guess_codec(AVOutputFormat *fmt, const char *short_name,
                            const char *filename, const char *mime_type,
                            enum AVMediaType type);



int av_get_output_timestamp(struct AVFormatContext *s, int stream,
                            int64_t *dts, int64_t *wall);

























void av_hex_dump(FILE *f, const uint8_t *buf, int size);



void av_hex_dump_log(void *avcl, int level, const uint8_t *buf, int size);









void av_pkt_dump2(FILE *f, const AVPacket *pkt, int dump_payload, const AVStream *st);




void av_pkt_dump_log2(void *avcl, int level, const AVPacket *pkt, int dump_payload,
                      const AVStream *st);









enum AVCodecID av_codec_get_id(const struct AVCodecTag * const *tags, unsigned int tag);









unsigned int av_codec_get_tag(const struct AVCodecTag * const *tags, enum AVCodecID id);










int av_codec_get_tag2(const struct AVCodecTag * const *tags, enum AVCodecID id,
                      unsigned int *tag);

int av_find_default_stream_index(AVFormatContext *s);



int av_index_search_timestamp(AVStream *st, int64_t timestamp, int flags);







int av_add_index_entry(AVStream *st, int64_t pos, int64_t timestamp,
                       int size, int distance, int flags);




void av_url_split(char *proto,         int proto_size,
                  char *authorization, int authorization_size,
                  char *hostname,      int hostname_size,
                  int *port_ptr,
                  char *path,          int path_size,
                  const char *url);




void av_dump_format(AVFormatContext *ic,
                    int index,
                    const char *url,
                    int is_output);






int av_get_frame_filename2(char *buf, int buf_size,
                          const char *path, int number, int flags);

int av_get_frame_filename(char *buf, int buf_size,
                          const char *path, int number);







int av_filename_number_test(const char *filename);



int av_sdp_create(AVFormatContext *ac[], int n_files, char *buf, int size);








int av_match_ext(const char *filename, const char *extensions);



int avformat_query_codec(const AVOutputFormat *ofmt, enum AVCodecID codec_id,
                         int std_compliance);






const struct AVCodecTag *avformat_get_riff_video_tags(void);



const struct AVCodecTag *avformat_get_riff_audio_tags(void);



const struct AVCodecTag *avformat_get_mov_video_tags(void);



const struct AVCodecTag *avformat_get_mov_audio_tags(void);







AVRational av_guess_sample_aspect_ratio(AVFormatContext *format, AVStream *stream, AVFrame *frame);









AVRational av_guess_frame_rate(AVFormatContext *ctx, AVStream *stream, AVFrame *frame);



int avformat_match_stream_specifier(AVFormatContext *s, AVStream *st,
                                    const char *spec);

int avformat_queue_attached_pictures(AVFormatContext *s);









enum AVTimebaseSource {
    AVFMT_TBCF_AUTO = -1,
    AVFMT_TBCF_DECODER,
    AVFMT_TBCF_DEMUXER,



};



int avformat_transfer_internal_stream_timing_info(const AVOutputFormat *ofmt,
                                                  AVStream *ost, const AVStream *ist,
                                                  enum AVTimebaseSource copy_tb);






AVRational av_stream_get_codec_timebase(const AVStream *st);






