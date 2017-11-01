 {.deadCodeElim: on.}
when defined(windows):
  const
    avformatdll* = "avformat.dll"
elif defined(macosx):
  const
    avformatdll* = "libavformat.dylib"
else:
  const
    avformatdll* = "libavformat.so"
import
  ../nim_ffmpeg_common, ../libavcodec/avcodec, ../libavutil/dict, avio, ../libavutil/frame, ../libavutil/avutil


type


  AVStreamParseType* {.size: sizeof(cint).} = enum
    AVSTREAM_PARSE_NONE, AVSTREAM_PARSE_FULL, AVSTREAM_PARSE_HEADERS,
    AVSTREAM_PARSE_TIMESTAMPS, AVSTREAM_PARSE_FULL_ONCE,
    #AVSTREAM_PARSE_FULL_RAW = MKTAG(0, 'R', 'A', 'W')


type
  INNER_C_STRUCT_2008934761* {.bycopy.} = object
    last_dts*: int64_t
    duration_gcd*: int64_t
    duration_count*: cint
    rfps_duration_sum*: int64_t
    duration_error*: array[2, array[(30 * 12 + 30 + 3 + 6), cdouble]]
    codec_info_duration*: int64_t
    codec_info_duration_fields*: int64_t
    found_decoder*: cint
    last_duration*: int64_t
    fps_first_dts*: int64_t
    fps_first_dts_idx*: cint
    fps_last_dts*: int64_t
    fps_last_dts_idx*: cint

  AVIndexEntry* {.bycopy.} = object
    pos*: int64_t
    timestamp*: int64_t
    flags* {.bitsize: 2.}: cint
    size* {.bitsize: 30.}: cint
    min_distance*: cint
  
  AVPacketList* {.bycopy.} = object
    pkt*: AVPacket
    next*: ptr AVPacketList

type
  AVCodecTag* {.bycopy.} = object
  
  AVProbeData* {.bycopy.} = object
    filename*: cstring
    buf*: ptr cuchar
    buf_size*: cint
    mime_type*: cstring

  AVStream* {.bycopy.} = object
    index*: cint
    id*: cint
    priv_data*: pointer
    time_base*: AVRational
    start_time*: int64_t
    duration*: int64_t
    nb_frames*: int64_t
    disposition*: cint
    `discard`*: AVDiscard
    sample_aspect_ratio*: AVRational
    metadata*: ptr AVDictionary
    avg_frame_rate*: AVRational
    attached_pic*: AVPacket
    side_data*: ptr AVPacketSideData
    nb_side_data*: cint
    event_flags*: cint
    info*: ptr INNER_C_STRUCT_2008934761
    pts_wrap_bits*: cint
    first_dts*: int64_t
    cur_dts*: int64_t
    last_IP_pts*: int64_t
    last_IP_duration*: cint
    probe_packets*: cint
    codec_info_nb_frames*: cint
    need_parsing*: AVStreamParseType
    parser*: ptr AVCodecParserContext
    last_in_packet_buffer*: ptr AVPacketList
    probe_data*: AVProbeData
    pts_buffer*: array[16 + 1, int64_t]
    index_entries*: ptr AVIndexEntry
    nb_index_entries*: cint
    index_entries_allocated_size*: cuint
    r_frame_rate*: AVRational
    stream_identifier*: cint
    interleaver_chunk_size*: int64_t
    interleaver_chunk_duration*: int64_t
    request_probe*: cint
    skip_to_keyframe*: cint
    skip_samples*: cint
    start_skip_samples*: int64_t
    first_discard_sample*: int64_t
    last_discard_sample*: int64_t
    nb_decoded_frames*: cint
    mux_ts_offset*: int64_t
    pts_wrap_reference*: int64_t
    pts_wrap_behavior*: cint
    update_initial_durations_done*: cint
    pts_reorder_error*: array[16 + 1, int64_t]
    pts_reorder_error_count*: array[16 + 1, uint8_t]
    last_dts_for_order_check*: int64_t
    dts_ordered*: uint8_t
    dts_misordered*: uint8_t
    inject_global_side_data*: cint
    recommended_encoder_configuration*: cstring
    display_aspect_ratio*: AVRational
    priv_pts*: ptr FFFrac
    internal*: ptr AVStreamInternal
    codecpar*: ptr AVCodecParameters




type
  AVProgram* {.bycopy.} = object
    id*: cint
    flags*: cint
    `discard`*: AVDiscard
    stream_index*: ptr cuint
    nb_stream_indexes*: cuint
    metadata*: ptr AVDictionary
    program_num*: cint
    pmt_pid*: cint
    pcr_pid*: cint
    start_time*: int64_t
    end_time*: int64_t
    pts_wrap_reference*: int64_t
    pts_wrap_behavior*: cint

  AVChapter* {.bycopy.} = object
    id*: cint
    time_base*: AVRational
    start*: int64_t
    `end`*: int64_t
    metadata*: ptr AVDictionary

  AVDurationEstimationMethod* {.size: sizeof(cint).} = enum
    AVFMT_DURATION_FROM_PTS, AVFMT_DURATION_FROM_STREAM,
    AVFMT_DURATION_FROM_BITRATE
    
  AVDeviceInfoList* {.bycopy.} = object

  AVOutputFormat* {.bycopy.} = object
    name*: cstring
    long_name*: cstring
    mime_type*: cstring
    extensions*: cstring
    audio_codec*: AVCodecID
    video_codec*: AVCodecID
    subtitle_codec*: AVCodecID
    flags*: cint
    codec_tag*: ptr ptr AVCodecTag
    priv_class*: ptr AVClass
    next*: ptr AVOutputFormat
    priv_data_size*: cint
    write_header*: proc (a2: ptr AVFormatContext): cint {.cdecl.}
    write_packet*: proc (a2: ptr AVFormatContext; pkt: ptr AVPacket): cint {.cdecl.}
    write_trailer*: proc (a2: ptr AVFormatContext): cint {.cdecl.}
    interleave_packet*: proc (a2: ptr AVFormatContext; `out`: ptr AVPacket;
                            `in`: ptr AVPacket; flush: cint): cint {.cdecl.}
    query_codec*: proc (id: AVCodecID; std_compliance: cint): cint {.cdecl.}
    get_output_timestamp*: proc (s: ptr AVFormatContext; stream: cint;
                               dts: ptr int64_t; wall: ptr int64_t) {.cdecl.}
    control_message*: proc (s: ptr AVFormatContext; `type`: cint; data: pointer;
                          data_size: csize): cint {.cdecl.}
    write_uncoded_frame*: proc (a2: ptr AVFormatContext; stream_index: cint;
                              frame: ptr ptr AVFrame; flags: cuint): cint {.cdecl.}
    get_device_list*: proc (s: ptr AVFormatContext; device_list: ptr AVDeviceInfoList): cint {.
        cdecl.}
    create_device_capabilities*: proc (s: ptr AVFormatContext;
                                     caps: ptr AVDeviceCapabilitiesQuery): cint {.
        cdecl.}
    free_device_capabilities*: proc (s: ptr AVFormatContext;
                                   caps: ptr AVDeviceCapabilitiesQuery): cint {.
        cdecl.}
    data_codec*: AVCodecID
    init*: proc (a2: ptr AVFormatContext): cint {.cdecl.}
    deinit*: proc (a2: ptr AVFormatContext) {.cdecl.}
    check_bitstream*: proc (a2: ptr AVFormatContext; pkt: ptr AVPacket): cint {.cdecl.}

  AVInputFormat* {.bycopy.} = object
    name*: cstring
    long_name*: cstring
    flags*: cint
    extensions*: cstring
    codec_tag*: ptr ptr AVCodecTag
    priv_class*: ptr AVClass
    mime_type*: cstring
    next*: ptr AVInputFormat
    raw_codec_id*: cint
    priv_data_size*: cint
    read_probe*: proc (a2: ptr AVProbeData): cint {.cdecl.}
    read_header*: proc (a2: ptr AVFormatContext): cint {.cdecl.}
    read_packet*: proc (a2: ptr AVFormatContext; pkt: ptr AVPacket): cint {.cdecl.}
    read_close*: proc (a2: ptr AVFormatContext): cint {.cdecl.}
    read_seek*: proc (a2: ptr AVFormatContext; stream_index: cint; timestamp: int64_t;
                    flags: cint): cint {.cdecl.}
    read_timestamp*: proc (s: ptr AVFormatContext; stream_index: cint;
                         pos: ptr int64_t; pos_limit: int64_t): int64_t {.cdecl.}
    read_play*: proc (a2: ptr AVFormatContext): cint {.cdecl.}
    read_pause*: proc (a2: ptr AVFormatContext): cint {.cdecl.}
    read_seek2*: proc (s: ptr AVFormatContext; stream_index: cint; min_ts: int64_t;
                     ts: int64_t; max_ts: int64_t; flags: cint): cint {.cdecl.}
    get_device_list*: proc (s: ptr AVFormatContext; device_list: ptr AVDeviceInfoList): cint {.
        cdecl.}
    create_device_capabilities*: proc (s: ptr AVFormatContext;
                                     caps: ptr AVDeviceCapabilitiesQuery): cint {.
        cdecl.}
    free_device_capabilities*: proc (s: ptr AVFormatContext;
                                   caps: ptr AVDeviceCapabilitiesQuery): cint {.
        cdecl.}


  AVFormatContext* {.bycopy.} = object
    av_class*: ptr AVClass
    iformat*: ptr AVInputFormat
    oformat*: ptr AVOutputFormat
    priv_data*: pointer
    pb*: ptr AVIOContext
    ctx_flags*: cint
    nb_streams*: cuint
    streams*: ptr ptr AVStream
    filename*: array[1024, char]
    start_time*: int64_t
    duration*: int64_t
    bit_rate*: int64_t
    packet_size*: cuint
    max_delay*: cint
    flags*: cint
    probesize*: int64_t
    max_analyze_duration*: int64_t
    key*: ptr uint8_t
    keylen*: cint
    nb_programs*: cuint
    programs*: ptr ptr AVProgram
    video_codec_id*: AVCodecID
    audio_codec_id*: AVCodecID
    subtitle_codec_id*: AVCodecID
    max_index_size*: cuint
    max_picture_buffer*: cuint
    nb_chapters*: cuint
    chapters*: ptr ptr AVChapter
    metadata*: ptr AVDictionary
    start_time_realtime*: int64_t
    fps_probe_size*: cint
    error_recognition*: cint
    interrupt_callback*: AVIOInterruptCB
    debug*: cint
    max_interleave_delta*: int64_t
    strict_std_compliance*: cint
    event_flags*: cint
    max_ts_probe*: cint
    avoid_negative_ts*: cint
    ts_id*: cint
    audio_preload*: cint
    max_chunk_duration*: cint
    max_chunk_size*: cint
    use_wallclock_as_timestamps*: cint
    avio_flags*: cint
    duration_estimation_method*: AVDurationEstimationMethod
    skip_initial_bytes*: int64_t
    correct_ts_overflow*: cuint
    seek2any*: cint
    flush_packets*: cint
    probe_score*: cint
    format_probesize*: cint
    codec_whitelist*: cstring
    format_whitelist*: cstring
    internal*: ptr AVFormatInternal
    io_repositioned*: cint
    video_codec*: ptr AVCodec
    audio_codec*: ptr AVCodec
    subtitle_codec*: ptr AVCodec
    data_codec*: ptr AVCodec
    metadata_header_padding*: cint
    opaque*: pointer
    control_message_cb*: av_format_control_message
    output_ts_offset*: int64_t
    dump_separator*: ptr uint8_t
    data_codec_id*: AVCodecID
    protocol_whitelist*: cstring
    io_open*: proc (s: ptr AVFormatContext; pb: ptr ptr AVIOContext; url: cstring;
                  flags: cint; options: ptr ptr AVDictionary): cint {.cdecl.}
    io_close*: proc (s: ptr AVFormatContext; pb: ptr AVIOContext) {.cdecl.}
    protocol_blacklist*: cstring
    max_streams*: cint

  av_format_control_message* = proc (s: ptr AVFormatContext; `type`: cint;
                                  data: pointer; data_size: csize): cint {.cdecl.}


  

  
  AVDeviceCapabilitiesQuery* {.bycopy.} = object
  AVOpenCallback* = proc (s: ptr AVFormatContext; pb: ptr ptr AVIOContext; url: cstring;
                       flags: cint; int_cb: ptr AVIOInterruptCB;
                       options: ptr ptr AVDictionary): cint {.cdecl.}
  

proc av_get_packet*(s: ptr AVIOContext; pkt: ptr AVPacket; size: cint): cint {.cdecl,
    importc: "av_get_packet", dynlib: avformatdll.}
proc av_append_packet*(s: ptr AVIOContext; pkt: ptr AVPacket; size: cint): cint {.cdecl,
    importc: "av_append_packet", dynlib: avformatdll.}





proc av_stream_get_r_frame_rate*(s: ptr AVStream): AVRational {.cdecl,
    importc: "av_stream_get_r_frame_rate", dynlib: avformatdll.}
proc av_stream_set_r_frame_rate*(s: ptr AVStream; r: AVRational) {.cdecl,
    importc: "av_stream_set_r_frame_rate", dynlib: avformatdll.}
proc av_stream_get_parser*(s: ptr AVStream): ptr AVCodecParserContext {.cdecl,
    importc: "av_stream_get_parser", dynlib: avformatdll.}
proc av_stream_get_recommended_encoder_configuration*(s: ptr AVStream): cstring {.
    cdecl, importc: "av_stream_get_recommended_encoder_configuration",
    dynlib: avformatdll.}
proc av_stream_set_recommended_encoder_configuration*(s: ptr AVStream;
    configuration: cstring) {.cdecl, importc: "av_stream_set_recommended_encoder_configuration",
                            dynlib: avformatdll.}
proc av_stream_get_end_pts*(st: ptr AVStream): int64_t {.cdecl,
    importc: "av_stream_get_end_pts", dynlib: avformatdll.}






proc av_format_get_probe_score*(s: ptr AVFormatContext): cint {.cdecl,
    importc: "av_format_get_probe_score", dynlib: avformatdll.}
proc av_format_get_video_codec*(s: ptr AVFormatContext): ptr AVCodec {.cdecl,
    importc: "av_format_get_video_codec", dynlib: avformatdll.}
proc av_format_set_video_codec*(s: ptr AVFormatContext; c: ptr AVCodec) {.cdecl,
    importc: "av_format_set_video_codec", dynlib: avformatdll.}
proc av_format_get_audio_codec*(s: ptr AVFormatContext): ptr AVCodec {.cdecl,
    importc: "av_format_get_audio_codec", dynlib: avformatdll.}
proc av_format_set_audio_codec*(s: ptr AVFormatContext; c: ptr AVCodec) {.cdecl,
    importc: "av_format_set_audio_codec", dynlib: avformatdll.}
proc av_format_get_subtitle_codec*(s: ptr AVFormatContext): ptr AVCodec {.cdecl,
    importc: "av_format_get_subtitle_codec", dynlib: avformatdll.}
proc av_format_set_subtitle_codec*(s: ptr AVFormatContext; c: ptr AVCodec) {.cdecl,
    importc: "av_format_set_subtitle_codec", dynlib: avformatdll.}
proc av_format_get_data_codec*(s: ptr AVFormatContext): ptr AVCodec {.cdecl,
    importc: "av_format_get_data_codec", dynlib: avformatdll.}
proc av_format_set_data_codec*(s: ptr AVFormatContext; c: ptr AVCodec) {.cdecl,
    importc: "av_format_set_data_codec", dynlib: avformatdll.}
proc av_format_get_metadata_header_padding*(s: ptr AVFormatContext): cint {.cdecl,
    importc: "av_format_get_metadata_header_padding", dynlib: avformatdll.}
proc av_format_set_metadata_header_padding*(s: ptr AVFormatContext; c: cint) {.cdecl,
    importc: "av_format_set_metadata_header_padding", dynlib: avformatdll.}
proc av_format_get_opaque*(s: ptr AVFormatContext): pointer {.cdecl,
    importc: "av_format_get_opaque", dynlib: avformatdll.}
proc av_format_set_opaque*(s: ptr AVFormatContext; opaque: pointer) {.cdecl,
    importc: "av_format_set_opaque", dynlib: avformatdll.}
proc av_format_get_control_message_cb*(s: ptr AVFormatContext): av_format_control_message {.
    cdecl, importc: "av_format_get_control_message_cb", dynlib: avformatdll.}
proc av_format_set_control_message_cb*(s: ptr AVFormatContext;
                                      callback: av_format_control_message) {.
    cdecl, importc: "av_format_set_control_message_cb", dynlib: avformatdll.}
proc av_format_inject_global_side_data*(s: ptr AVFormatContext) {.cdecl,
    importc: "av_format_inject_global_side_data", dynlib: avformatdll.}
proc av_fmt_ctx_get_duration_estimation_method*(ctx: ptr AVFormatContext): AVDurationEstimationMethod {.
    cdecl, importc: "av_fmt_ctx_get_duration_estimation_method",
    dynlib: avformatdll.}

proc avformat_version*(): cuint {.cdecl, importc: "avformat_version",
                               dynlib: avformatdll.}
proc avformat_configuration*(): cstring {.cdecl, importc: "avformat_configuration",
                                       dynlib: avformatdll.}
proc avformat_license*(): cstring {.cdecl, importc: "avformat_license",
                                 dynlib: avformatdll.}
proc av_register_all*() {.cdecl, importc: "av_register_all", dynlib: avformatdll.}
proc av_register_input_format*(format: ptr AVInputFormat) {.cdecl,
    importc: "av_register_input_format", dynlib: avformatdll.}
proc av_register_output_format*(format: ptr AVOutputFormat) {.cdecl,
    importc: "av_register_output_format", dynlib: avformatdll.}
proc avformat_network_init*(): cint {.cdecl, importc: "avformat_network_init",
                                   dynlib: avformatdll.}
proc avformat_network_deinit*(): cint {.cdecl, importc: "avformat_network_deinit",
                                     dynlib: avformatdll.}
proc av_iformat_next*(f: ptr AVInputFormat): ptr AVInputFormat {.cdecl,
    importc: "av_iformat_next", dynlib: avformatdll.}
proc av_oformat_next*(f: ptr AVOutputFormat): ptr AVOutputFormat {.cdecl,
    importc: "av_oformat_next", dynlib: avformatdll.}
proc avformat_alloc_context*(): ptr AVFormatContext {.cdecl,
    importc: "avformat_alloc_context", dynlib: avformatdll.}
proc avformat_free_context*(s: ptr AVFormatContext) {.cdecl,
    importc: "avformat_free_context", dynlib: avformatdll.}
proc avformat_get_class*(): ptr AVClass {.cdecl, importc: "avformat_get_class",
                                      dynlib: avformatdll.}
proc avformat_new_stream*(s: ptr AVFormatContext; c: ptr AVCodec): ptr AVStream {.cdecl,
    importc: "avformat_new_stream", dynlib: avformatdll.}
proc av_stream_add_side_data*(st: ptr AVStream; `type`: AVPacketSideDataType;
                             data: ptr uint8_t; size: csize): cint {.cdecl,
    importc: "av_stream_add_side_data", dynlib: avformatdll.}
proc av_stream_new_side_data*(stream: ptr AVStream; `type`: AVPacketSideDataType;
                             size: cint): ptr uint8_t {.cdecl,
    importc: "av_stream_new_side_data", dynlib: avformatdll.}
proc av_stream_get_side_data*(stream: ptr AVStream; `type`: AVPacketSideDataType;
                             size: ptr cint): ptr uint8_t {.cdecl,
    importc: "av_stream_get_side_data", dynlib: avformatdll.}
proc av_new_program*(s: ptr AVFormatContext; id: cint): ptr AVProgram {.cdecl,
    importc: "av_new_program", dynlib: avformatdll.}
proc avformat_alloc_output_context2*(ctx: ptr ptr AVFormatContext;
                                    oformat: ptr AVOutputFormat;
                                    format_name: cstring; filename: cstring): cint {.
    cdecl, importc: "avformat_alloc_output_context2", dynlib: avformatdll.}
proc av_find_input_format*(short_name: cstring): ptr AVInputFormat {.cdecl,
    importc: "av_find_input_format", dynlib: avformatdll.}
proc av_probe_input_format*(pd: ptr AVProbeData; is_opened: cint): ptr AVInputFormat {.
    cdecl, importc: "av_probe_input_format", dynlib: avformatdll.}
proc av_probe_input_format2*(pd: ptr AVProbeData; is_opened: cint; score_max: ptr cint): ptr AVInputFormat {.
    cdecl, importc: "av_probe_input_format2", dynlib: avformatdll.}
proc av_probe_input_format3*(pd: ptr AVProbeData; is_opened: cint; score_ret: ptr cint): ptr AVInputFormat {.
    cdecl, importc: "av_probe_input_format3", dynlib: avformatdll.}
proc av_probe_input_buffer2*(pb: ptr AVIOContext; fmt: ptr ptr AVInputFormat;
                            url: cstring; logctx: pointer; offset: cuint;
                            max_probe_size: cuint): cint {.cdecl,
    importc: "av_probe_input_buffer2", dynlib: avformatdll.}
proc av_probe_input_buffer*(pb: ptr AVIOContext; fmt: ptr ptr AVInputFormat;
                           url: cstring; logctx: pointer; offset: cuint;
                           max_probe_size: cuint): cint {.cdecl,
    importc: "av_probe_input_buffer", dynlib: avformatdll.}
proc avformat_open_input*(ps: ptr ptr AVFormatContext; url: cstring;
                         fmt: ptr AVInputFormat; options: ptr ptr AVDictionary): cint {.
    cdecl, importc: "avformat_open_input", dynlib: avformatdll.}
proc av_demuxer_open*(ic: ptr AVFormatContext): cint {.cdecl,
    importc: "av_demuxer_open", dynlib: avformatdll.}
proc avformat_find_stream_info*(ic: ptr AVFormatContext;
                               options: ptr ptr AVDictionary): cint {.cdecl,
    importc: "avformat_find_stream_info", dynlib: avformatdll.}
proc av_find_program_from_stream*(ic: ptr AVFormatContext; last: ptr AVProgram; s: cint): ptr AVProgram {.
    cdecl, importc: "av_find_program_from_stream", dynlib: avformatdll.}
proc av_program_add_stream_index*(ac: ptr AVFormatContext; progid: cint; idx: cuint) {.
    cdecl, importc: "av_program_add_stream_index", dynlib: avformatdll.}
proc av_find_best_stream*(ic: ptr AVFormatContext; `type`: AVMediaType;
                         wanted_stream_nb: cint; related_stream: cint;
                         decoder_ret: ptr ptr AVCodec; flags: cint): cint {.cdecl,
    importc: "av_find_best_stream", dynlib: avformatdll.}
proc av_read_frame*(s: ptr AVFormatContext; pkt: ptr AVPacket): cint {.cdecl,
    importc: "av_read_frame", dynlib: avformatdll.}
proc av_seek_frame*(s: ptr AVFormatContext; stream_index: cint; timestamp: int64_t;
                   flags: cint): cint {.cdecl, importc: "av_seek_frame",
                                     dynlib: avformatdll.}
proc avformat_seek_file*(s: ptr AVFormatContext; stream_index: cint; min_ts: int64_t;
                        ts: int64_t; max_ts: int64_t; flags: cint): cint {.cdecl,
    importc: "avformat_seek_file", dynlib: avformatdll.}
proc avformat_flush*(s: ptr AVFormatContext): cint {.cdecl, importc: "avformat_flush",
    dynlib: avformatdll.}
proc av_read_play*(s: ptr AVFormatContext): cint {.cdecl, importc: "av_read_play",
    dynlib: avformatdll.}
proc av_read_pause*(s: ptr AVFormatContext): cint {.cdecl, importc: "av_read_pause",
    dynlib: avformatdll.}
proc avformat_close_input*(s: ptr ptr AVFormatContext) {.cdecl,
    importc: "avformat_close_input", dynlib: avformatdll.}
proc avformat_write_header*(s: ptr AVFormatContext; options: ptr ptr AVDictionary): cint {.
    cdecl, importc: "avformat_write_header", dynlib: avformatdll.}
proc avformat_init_output*(s: ptr AVFormatContext; options: ptr ptr AVDictionary): cint {.
    cdecl, importc: "avformat_init_output", dynlib: avformatdll.}
proc av_write_frame*(s: ptr AVFormatContext; pkt: ptr AVPacket): cint {.cdecl,
    importc: "av_write_frame", dynlib: avformatdll.}
proc av_interleaved_write_frame*(s: ptr AVFormatContext; pkt: ptr AVPacket): cint {.
    cdecl, importc: "av_interleaved_write_frame", dynlib: avformatdll.}
proc av_write_uncoded_frame*(s: ptr AVFormatContext; stream_index: cint;
                            frame: ptr AVFrame): cint {.cdecl,
    importc: "av_write_uncoded_frame", dynlib: avformatdll.}
proc av_interleaved_write_uncoded_frame*(s: ptr AVFormatContext; stream_index: cint;
                                        frame: ptr AVFrame): cint {.cdecl,
    importc: "av_interleaved_write_uncoded_frame", dynlib: avformatdll.}
proc av_write_uncoded_frame_query*(s: ptr AVFormatContext; stream_index: cint): cint {.
    cdecl, importc: "av_write_uncoded_frame_query", dynlib: avformatdll.}
proc av_write_trailer*(s: ptr AVFormatContext): cint {.cdecl,
    importc: "av_write_trailer", dynlib: avformatdll.}
proc av_guess_format*(short_name: cstring; filename: cstring; mime_type: cstring): ptr AVOutputFormat {.
    cdecl, importc: "av_guess_format", dynlib: avformatdll.}
proc av_guess_codec*(fmt: ptr AVOutputFormat; short_name: cstring; filename: cstring;
                    mime_type: cstring; `type`: AVMediaType): AVCodecID {.cdecl,
    importc: "av_guess_codec", dynlib: avformatdll.}
proc av_get_output_timestamp*(s: ptr AVFormatContext; stream: cint; dts: ptr int64_t;
                             wall: ptr int64_t): cint {.cdecl,
    importc: "av_get_output_timestamp", dynlib: avformatdll.}
proc av_hex_dump*(f: ptr FILE; buf: ptr uint8_t; size: cint) {.cdecl,
    importc: "av_hex_dump", dynlib: avformatdll.}
proc av_hex_dump_log*(avcl: pointer; level: cint; buf: ptr uint8_t; size: cint) {.cdecl,
    importc: "av_hex_dump_log", dynlib: avformatdll.}
proc av_pkt_dump2*(f: ptr FILE; pkt: ptr AVPacket; dump_payload: cint; st: ptr AVStream) {.
    cdecl, importc: "av_pkt_dump2", dynlib: avformatdll.}
proc av_pkt_dump_log2*(avcl: pointer; level: cint; pkt: ptr AVPacket;
                      dump_payload: cint; st: ptr AVStream) {.cdecl,
    importc: "av_pkt_dump_log2", dynlib: avformatdll.}
proc av_codec_get_id*(tags: ptr ptr AVCodecTag; tag: cuint): AVCodecID {.cdecl,
    importc: "av_codec_get_id", dynlib: avformatdll.}
proc av_codec_get_tag*(tags: ptr ptr AVCodecTag; id: AVCodecID): cuint {.cdecl,
    importc: "av_codec_get_tag", dynlib: avformatdll.}
proc av_codec_get_tag2*(tags: ptr ptr AVCodecTag; id: AVCodecID; tag: ptr cuint): cint {.
    cdecl, importc: "av_codec_get_tag2", dynlib: avformatdll.}
proc av_find_default_stream_index*(s: ptr AVFormatContext): cint {.cdecl,
    importc: "av_find_default_stream_index", dynlib: avformatdll.}
proc av_index_search_timestamp*(st: ptr AVStream; timestamp: int64_t; flags: cint): cint {.
    cdecl, importc: "av_index_search_timestamp", dynlib: avformatdll.}
proc av_add_index_entry*(st: ptr AVStream; pos: int64_t; timestamp: int64_t; size: cint;
                        distance: cint; flags: cint): cint {.cdecl,
    importc: "av_add_index_entry", dynlib: avformatdll.}
proc av_url_split*(proto: cstring; proto_size: cint; authorization: cstring;
                  authorization_size: cint; hostname: cstring; hostname_size: cint;
                  port_ptr: ptr cint; path: cstring; path_size: cint; url: cstring) {.
    cdecl, importc: "av_url_split", dynlib: avformatdll.}
proc av_dump_format*(ic: ptr AVFormatContext; index: cint; url: cstring; is_output: cint) {.
    cdecl, importc: "av_dump_format", dynlib: avformatdll.}
proc av_get_frame_filename2*(buf: cstring; buf_size: cint; path: cstring; number: cint;
                            flags: cint): cint {.cdecl,
    importc: "av_get_frame_filename2", dynlib: avformatdll.}
proc av_get_frame_filename*(buf: cstring; buf_size: cint; path: cstring; number: cint): cint {.
    cdecl, importc: "av_get_frame_filename", dynlib: avformatdll.}
proc av_filename_number_test*(filename: cstring): cint {.cdecl,
    importc: "av_filename_number_test", dynlib: avformatdll.}
proc av_sdp_create*(ac: ptr ptr AVFormatContext; n_files: cint; buf: cstring; size: cint): cint {.
    cdecl, importc: "av_sdp_create", dynlib: avformatdll.}
proc av_match_ext*(filename: cstring; extensions: cstring): cint {.cdecl,
    importc: "av_match_ext", dynlib: avformatdll.}
proc avformat_query_codec*(ofmt: ptr AVOutputFormat; codec_id: AVCodecID;
                          std_compliance: cint): cint {.cdecl,
    importc: "avformat_query_codec", dynlib: avformatdll.}
proc avformat_get_riff_video_tags*(): ptr AVCodecTag {.cdecl,
    importc: "avformat_get_riff_video_tags", dynlib: avformatdll.}
proc avformat_get_riff_audio_tags*(): ptr AVCodecTag {.cdecl,
    importc: "avformat_get_riff_audio_tags", dynlib: avformatdll.}
proc avformat_get_mov_video_tags*(): ptr AVCodecTag {.cdecl,
    importc: "avformat_get_mov_video_tags", dynlib: avformatdll.}
proc avformat_get_mov_audio_tags*(): ptr AVCodecTag {.cdecl,
    importc: "avformat_get_mov_audio_tags", dynlib: avformatdll.}
proc av_guess_sample_aspect_ratio*(format: ptr AVFormatContext;
                                  stream: ptr AVStream; frame: ptr AVFrame): AVRational {.
    cdecl, importc: "av_guess_sample_aspect_ratio", dynlib: avformatdll.}
proc av_guess_frame_rate*(ctx: ptr AVFormatContext; stream: ptr AVStream;
                         frame: ptr AVFrame): AVRational {.cdecl,
    importc: "av_guess_frame_rate", dynlib: avformatdll.}
proc avformat_match_stream_specifier*(s: ptr AVFormatContext; st: ptr AVStream;
                                     spec: cstring): cint {.cdecl,
    importc: "avformat_match_stream_specifier", dynlib: avformatdll.}
proc avformat_queue_attached_pictures*(s: ptr AVFormatContext): cint {.cdecl,
    importc: "avformat_queue_attached_pictures", dynlib: avformatdll.}
type
  AVTimebaseSource* {.size: sizeof(cint).} = enum
    AVFMT_TBCF_AUTO = - 1, AVFMT_TBCF_DECODER, AVFMT_TBCF_DEMUXER


proc avformat_transfer_internal_stream_timing_info*(ofmt: ptr AVOutputFormat;
    ost: ptr AVStream; ist: ptr AVStream; copy_tb: AVTimebaseSource): cint {.cdecl,
    importc: "avformat_transfer_internal_stream_timing_info", dynlib: avformatdll.}
proc av_stream_get_codec_timebase*(st: ptr AVStream): AVRational {.cdecl,
    importc: "av_stream_get_codec_timebase", dynlib: avformatdll.}