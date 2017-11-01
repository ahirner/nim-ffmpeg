 {.deadCodeElim: on.}
when defined(windows):
  const
    avcodecdll* = "avcodec.dll"
elif defined(macosx):
  const
    avcodecdll* = "libavcodec.dylib"
else:
  const
    avcodecdll* = "libavcodec.so"
import
  ../nim_ffmpeg_common, avcodec


type
  DiracParseCodes* {.size: sizeof(cint).} = enum
    DIRAC_PCODE_SEQ_HEADER = 0x00000000, DIRAC_PCODE_PICTURE_CODED = 0x00000008,
    DIRAC_PCODE_INTER_NOREF_CO2 = 0x00000009,
    DIRAC_PCODE_INTER_NOREF_CO1 = 0x0000000A,
    DIRAC_PCODE_INTRA_REF_CO = 0x0000000C, DIRAC_PCODE_INTER_REF_CO1 = 0x0000000D,
    DIRAC_PCODE_INTER_REF_CO2 = 0x0000000E, DIRAC_PCODE_END_SEQ = 0x00000010,
    DIRAC_PCODE_AUX = 0x00000020, DIRAC_PCODE_PAD = 0x00000030,
    DIRAC_PCODE_PICTURE_RAW = 0x00000048, DIRAC_PCODE_INTRA_REF_RAW = 0x0000004C,
    DIRAC_PCODE_PICTURE_LOW_DEL = 0x000000C8,
    DIRAC_PCODE_INTRA_REF_PICT = 0x000000CC, DIRAC_PCODE_PICTURE_HQ = 0x000000E8,
    DIRAC_PCODE_MAGIC = 0x42424344


type
  DiracVersionInfo* {.bycopy.} = object
    major*: cint
    minor*: cint

  AVDiracSeqHeader* {.bycopy.} = object
    width*: cuint
    height*: cuint
    chroma_format*: uint8_t
    interlaced*: uint8_t
    top_field_first*: uint8_t
    frame_rate_index*: uint8_t
    aspect_ratio_index*: uint8_t
    clean_width*: uint16_t
    clean_height*: uint16_t
    clean_left_offset*: uint16_t
    clean_right_offset*: uint16_t
    pixel_range_index*: uint8_t
    color_spec_index*: uint8_t
    profile*: cint
    level*: cint
    framerate*: AVRational
    sample_aspect_ratio*: AVRational
    pix_fmt*: AVPixelFormat
    color_range*: AVColorRange
    color_primaries*: AVColorPrimaries
    color_trc*: AVColorTransferCharacteristic
    colorspace*: AVColorSpace
    version*: DiracVersionInfo
    bit_depth*: cint


proc av_dirac_parse_sequence_header*(dsh: ptr ptr AVDiracSeqHeader; buf: ptr uint8_t;
                                    buf_size: csize; log_ctx: pointer): cint {.cdecl,
    importc: "av_dirac_parse_sequence_header", dynlib: avcodecdll.}