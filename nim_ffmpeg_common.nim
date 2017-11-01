const AV_NUM_DATA_POINTERS* = 8
const SEEK_CUR* = 0

type
  int16_t* = int16
  uint64_t* = uint64
  int64_t* = int64
  uint8_t* = uint8
  uint16_t* = uint16
  int32_t* = int32
  uint32_t* = uint32


  AVRational* {.bycopy.} = object
    num*: cint
    den*: cint

  AVRounding* = enum
    AV_ROUND_ZERO = 0, AV_ROUND_INF = 1, AV_ROUND_DOWN = 2, AV_ROUND_UP = 3,
    AV_ROUND_NEAR_INF = 5, AV_ROUND_PASS_MINMAX = 8192    

type
  #c2nim doesn't convert pure struct typedefs nor reorders forward declarations
  AVBuffer* = object
  AVBufferPool* = object
  AVDictionary* = object
  AVBSFInternal* = object
  AVBSFList* = object

type
  AVOption* = object
  AVCodecContext* = object
  AVCodecDefault* = object
  #AVPacket* = object
  URLContext* = object
  FFFrac* = object
  AVStreamInternal* = object
  AVFormatInternal* = object
  AVDeviceCapabilitiesQuery* = object

type
  AVClassCategory* = enum
    AV_CLASS_CATEGORY_NA = 0, AV_CLASS_CATEGORY_INPUT, AV_CLASS_CATEGORY_OUTPUT,
    AV_CLASS_CATEGORY_MUXER, AV_CLASS_CATEGORY_DEMUXER, AV_CLASS_CATEGORY_ENCODER,
    AV_CLASS_CATEGORY_DECODER, AV_CLASS_CATEGORY_FILTER,
    AV_CLASS_CATEGORY_BITSTREAM_FILTER, AV_CLASS_CATEGORY_SWSCALER,
    AV_CLASS_CATEGORY_SWRESAMPLER, AV_CLASS_CATEGORY_DEVICE_VIDEO_OUTPUT = 40,
    AV_CLASS_CATEGORY_DEVICE_VIDEO_INPUT, AV_CLASS_CATEGORY_DEVICE_AUDIO_OUTPUT,
    AV_CLASS_CATEGORY_DEVICE_AUDIO_INPUT, AV_CLASS_CATEGORY_DEVICE_OUTPUT,
    AV_CLASS_CATEGORY_DEVICE_INPUT, AV_CLASS_CATEGORY_NB


type
  AVOptionRanges* {.bycopy.} = object
  
  AVClass* {.bycopy.} = object
    class_name*: cstring
    item_name*: proc (ctx: pointer): cstring {.cdecl.}
    option*: ptr AVOption
    version*: cint
    log_level_offset_offset*: cint
    parent_log_context_offset*: cint
    child_next*: proc (obj: pointer; prev: pointer): pointer {.cdecl.}
    child_class_next*: proc (prev: ptr AVClass): ptr AVClass {.cdecl.}
    category*: AVClassCategory
    get_category*: proc (ctx: pointer): AVClassCategory {.cdecl.}
    query_ranges*: proc (a2: ptr ptr AVOptionRanges; obj: pointer; key: cstring;
                       flags: cint): cint {.cdecl.}

