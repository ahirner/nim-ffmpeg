    #ifdef C2NIM
    #  dynlib avcodecdll
    #  cdecl
    #  if defined(windows)
    #    define avcodecdll "avcodec.dll"
    #  elif defined(macosx)
    #    define avcodecdll "libavcodec.dylib"
    #  else
    #    define avcodecdll "libavcodec.so"
    #  endif
    #endif
    #include "../nim_ffmpeg_common.h"
#include "avcodec.h"













//#include "avcodec.h" // #33






















enum DiracParseCodes {
    DIRAC_PCODE_SEQ_HEADER      = 0x00,
    DIRAC_PCODE_END_SEQ         = 0x10,
    DIRAC_PCODE_AUX             = 0x20,
    DIRAC_PCODE_PAD             = 0x30,
    DIRAC_PCODE_PICTURE_CODED   = 0x08,
    DIRAC_PCODE_PICTURE_RAW     = 0x48,
    DIRAC_PCODE_PICTURE_LOW_DEL = 0xC8,
    DIRAC_PCODE_PICTURE_HQ      = 0xE8,
    DIRAC_PCODE_INTER_NOREF_CO1 = 0x0A,
    DIRAC_PCODE_INTER_NOREF_CO2 = 0x09,
    DIRAC_PCODE_INTER_REF_CO1   = 0x0D,
    DIRAC_PCODE_INTER_REF_CO2   = 0x0E,
    DIRAC_PCODE_INTRA_REF_CO    = 0x0C,
    DIRAC_PCODE_INTRA_REF_RAW   = 0x4C,
    DIRAC_PCODE_INTRA_REF_PICT  = 0xCC,
    DIRAC_PCODE_MAGIC           = 0x42424344,
};

typedef struct DiracVersionInfo {
    int major;
    int minor;
} DiracVersionInfo;

typedef struct AVDiracSeqHeader {
    unsigned width;
    unsigned height;
    uint8_t chroma_format;          ///< 0: 444  1: 422  2: 420

    uint8_t interlaced;
    uint8_t top_field_first;

    uint8_t frame_rate_index;       ///< index into dirac_frame_rate[]
    uint8_t aspect_ratio_index;     ///< index into dirac_aspect_ratio[]

    uint16_t clean_width;
    uint16_t clean_height;
    uint16_t clean_left_offset;
    uint16_t clean_right_offset;

    uint8_t pixel_range_index;      ///< index into dirac_pixel_range_presets[]
    uint8_t color_spec_index;       ///< index into dirac_color_spec_presets[]

    int profile;
    int level;

    AVRational framerate;
    AVRational sample_aspect_ratio;

    enum AVPixelFormat pix_fmt;
    enum AVColorRange color_range;
    enum AVColorPrimaries color_primaries;
    enum AVColorTransferCharacteristic color_trc;
    enum AVColorSpace colorspace;

    DiracVersionInfo version;
    int bit_depth;
} AVDiracSeqHeader;



int av_dirac_parse_sequence_header(AVDiracSeqHeader **dsh,
                                   const uint8_t *buf, size_t buf_size,
                                   void *log_ctx);


