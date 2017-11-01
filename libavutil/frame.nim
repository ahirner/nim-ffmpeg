 {.deadCodeElim: on.}
when defined(windows):
  const
    avutildll* = "avutil.dll"
elif defined(macosx):
  const
    avutildll* = "libavutil.dylib"
else:
  const
    avutildll* = "libavutil.so"
import
  ../nim_ffmpeg_common, avutil, buffer, dict, samplefmt, pixfmt


type
  AVFrameSideDataType* {.size: sizeof(cint).} = enum
    AV_FRAME_DATA_PANSCAN, AV_FRAME_DATA_A53_CC, AV_FRAME_DATA_STEREO3D,
    AV_FRAME_DATA_MATRIXENCODING, AV_FRAME_DATA_DOWNMIX_INFO,
    AV_FRAME_DATA_REPLAYGAIN, AV_FRAME_DATA_DISPLAYMATRIX, AV_FRAME_DATA_AFD,
    AV_FRAME_DATA_MOTION_VECTORS, AV_FRAME_DATA_SKIP_SAMPLES,
    AV_FRAME_DATA_AUDIO_SERVICE_TYPE, AV_FRAME_DATA_MASTERING_DISPLAY_METADATA,
    AV_FRAME_DATA_GOP_TIMECODE, AV_FRAME_DATA_SPHERICAL


type
  AVActiveFormatDescription* {.size: sizeof(cint).} = enum
    AV_AFD_SAME = 8, AV_AFD_4_3 = 9, AV_AFD_16_9 = 10, AV_AFD_14_9 = 11,
    AV_AFD_4_3_SP_14_9 = 13, AV_AFD_16_9_SP_14_9 = 14, AV_AFD_SP_4_3 = 15


type
  AVFrameSideData* {.bycopy.} = object
    `type`*: AVFrameSideDataType
    data*: ptr uint8_t
    size*: cint
    metadata*: ptr AVDictionary
    buf*: ptr AVBufferRef

  AVFrame* {.bycopy.} = object
    data*: array[8, ptr uint8_t]
    linesize*: array[8, cint]
    extended_data*: ptr ptr uint8_t
    width*: cint
    height*: cint
    nb_samples*: cint
    format*: cint
    key_frame*: cint
    pict_type*: AVPictureType
    sample_aspect_ratio*: AVRational
    pts*: int64_t
    pkt_dts*: int64_t
    coded_picture_number*: cint
    display_picture_number*: cint
    quality*: cint
    opaque*: pointer
    repeat_pict*: cint
    interlaced_frame*: cint
    top_field_first*: cint
    palette_has_changed*: cint
    reordered_opaque*: int64_t
    sample_rate*: cint
    channel_layout*: uint64_t
    buf*: array[8, ptr AVBufferRef]
    extended_buf*: ptr ptr AVBufferRef
    nb_extended_buf*: cint
    side_data*: ptr ptr AVFrameSideData
    nb_side_data*: cint
    flags*: cint
    color_range*: AVColorRange
    color_primaries*: AVColorPrimaries
    color_trc*: AVColorTransferCharacteristic
    colorspace*: AVColorSpace
    chroma_location*: AVChromaLocation
    best_effort_timestamp*: int64_t
    pkt_pos*: int64_t
    pkt_duration*: int64_t
    metadata*: ptr AVDictionary
    decode_error_flags*: cint
    channels*: cint
    pkt_size*: cint
    hw_frames_ctx*: ptr AVBufferRef
    opaque_ref*: ptr AVBufferRef


proc av_frame_get_best_effort_timestamp*(frame: ptr AVFrame): int64_t {.cdecl,
    importc: "av_frame_get_best_effort_timestamp", dynlib: avutildll.}
proc av_frame_set_best_effort_timestamp*(frame: ptr AVFrame; val: int64_t) {.cdecl,
    importc: "av_frame_set_best_effort_timestamp", dynlib: avutildll.}
proc av_frame_get_pkt_duration*(frame: ptr AVFrame): int64_t {.cdecl,
    importc: "av_frame_get_pkt_duration", dynlib: avutildll.}
proc av_frame_set_pkt_duration*(frame: ptr AVFrame; val: int64_t) {.cdecl,
    importc: "av_frame_set_pkt_duration", dynlib: avutildll.}
proc av_frame_get_pkt_pos*(frame: ptr AVFrame): int64_t {.cdecl,
    importc: "av_frame_get_pkt_pos", dynlib: avutildll.}
proc av_frame_set_pkt_pos*(frame: ptr AVFrame; val: int64_t) {.cdecl,
    importc: "av_frame_set_pkt_pos", dynlib: avutildll.}
proc av_frame_get_channel_layout*(frame: ptr AVFrame): int64_t {.cdecl,
    importc: "av_frame_get_channel_layout", dynlib: avutildll.}
proc av_frame_set_channel_layout*(frame: ptr AVFrame; val: int64_t) {.cdecl,
    importc: "av_frame_set_channel_layout", dynlib: avutildll.}
proc av_frame_get_channels*(frame: ptr AVFrame): cint {.cdecl,
    importc: "av_frame_get_channels", dynlib: avutildll.}
proc av_frame_set_channels*(frame: ptr AVFrame; val: cint) {.cdecl,
    importc: "av_frame_set_channels", dynlib: avutildll.}
proc av_frame_get_sample_rate*(frame: ptr AVFrame): cint {.cdecl,
    importc: "av_frame_get_sample_rate", dynlib: avutildll.}
proc av_frame_set_sample_rate*(frame: ptr AVFrame; val: cint) {.cdecl,
    importc: "av_frame_set_sample_rate", dynlib: avutildll.}
proc av_frame_get_metadata*(frame: ptr AVFrame): ptr AVDictionary {.cdecl,
    importc: "av_frame_get_metadata", dynlib: avutildll.}
proc av_frame_set_metadata*(frame: ptr AVFrame; val: ptr AVDictionary) {.cdecl,
    importc: "av_frame_set_metadata", dynlib: avutildll.}
proc av_frame_get_decode_error_flags*(frame: ptr AVFrame): cint {.cdecl,
    importc: "av_frame_get_decode_error_flags", dynlib: avutildll.}
proc av_frame_set_decode_error_flags*(frame: ptr AVFrame; val: cint) {.cdecl,
    importc: "av_frame_set_decode_error_flags", dynlib: avutildll.}
proc av_frame_get_pkt_size*(frame: ptr AVFrame): cint {.cdecl,
    importc: "av_frame_get_pkt_size", dynlib: avutildll.}
proc av_frame_set_pkt_size*(frame: ptr AVFrame; val: cint) {.cdecl,
    importc: "av_frame_set_pkt_size", dynlib: avutildll.}
proc avpriv_frame_get_metadatap*(frame: ptr AVFrame): ptr ptr AVDictionary {.cdecl,
    importc: "avpriv_frame_get_metadatap", dynlib: avutildll.}
proc av_frame_get_colorspace*(frame: ptr AVFrame): AVColorSpace {.cdecl,
    importc: "av_frame_get_colorspace", dynlib: avutildll.}
proc av_frame_set_colorspace*(frame: ptr AVFrame; val: AVColorSpace) {.cdecl,
    importc: "av_frame_set_colorspace", dynlib: avutildll.}
proc av_frame_get_color_range*(frame: ptr AVFrame): AVColorRange {.cdecl,
    importc: "av_frame_get_color_range", dynlib: avutildll.}
proc av_frame_set_color_range*(frame: ptr AVFrame; val: AVColorRange) {.cdecl,
    importc: "av_frame_set_color_range", dynlib: avutildll.}
proc av_get_colorspace_name*(val: AVColorSpace): cstring {.cdecl,
    importc: "av_get_colorspace_name", dynlib: avutildll.}
proc av_frame_alloc*(): ptr AVFrame {.cdecl, importc: "av_frame_alloc",
                                  dynlib: avutildll.}
proc av_frame_free*(frame: ptr ptr AVFrame) {.cdecl, importc: "av_frame_free",
    dynlib: avutildll.}
proc av_frame_ref*(dst: ptr AVFrame; src: ptr AVFrame): cint {.cdecl,
    importc: "av_frame_ref", dynlib: avutildll.}
proc av_frame_clone*(src: ptr AVFrame): ptr AVFrame {.cdecl, importc: "av_frame_clone",
    dynlib: avutildll.}
proc av_frame_unref*(frame: ptr AVFrame) {.cdecl, importc: "av_frame_unref",
                                       dynlib: avutildll.}
proc av_frame_move_ref*(dst: ptr AVFrame; src: ptr AVFrame) {.cdecl,
    importc: "av_frame_move_ref", dynlib: avutildll.}
proc av_frame_get_buffer*(frame: ptr AVFrame; align: cint): cint {.cdecl,
    importc: "av_frame_get_buffer", dynlib: avutildll.}
proc av_frame_is_writable*(frame: ptr AVFrame): cint {.cdecl,
    importc: "av_frame_is_writable", dynlib: avutildll.}
proc av_frame_make_writable*(frame: ptr AVFrame): cint {.cdecl,
    importc: "av_frame_make_writable", dynlib: avutildll.}
proc av_frame_copy*(dst: ptr AVFrame; src: ptr AVFrame): cint {.cdecl,
    importc: "av_frame_copy", dynlib: avutildll.}
proc av_frame_copy_props*(dst: ptr AVFrame; src: ptr AVFrame): cint {.cdecl,
    importc: "av_frame_copy_props", dynlib: avutildll.}
proc av_frame_get_plane_buffer*(frame: ptr AVFrame; plane: cint): ptr AVBufferRef {.
    cdecl, importc: "av_frame_get_plane_buffer", dynlib: avutildll.}
proc av_frame_new_side_data*(frame: ptr AVFrame; `type`: AVFrameSideDataType;
                            size: cint): ptr AVFrameSideData {.cdecl,
    importc: "av_frame_new_side_data", dynlib: avutildll.}
proc av_frame_get_side_data*(frame: ptr AVFrame; `type`: AVFrameSideDataType): ptr AVFrameSideData {.
    cdecl, importc: "av_frame_get_side_data", dynlib: avutildll.}
proc av_frame_remove_side_data*(frame: ptr AVFrame; `type`: AVFrameSideDataType) {.
    cdecl, importc: "av_frame_remove_side_data", dynlib: avutildll.}
proc av_frame_side_data_name*(`type`: AVFrameSideDataType): cstring {.cdecl,
    importc: "av_frame_side_data_name", dynlib: avutildll.}