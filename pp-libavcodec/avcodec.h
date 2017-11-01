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
#include "../libavutil/samplefmt.h"
#include "../libavutil/attributes.h"
#include "../libavutil/avutil.h"
#include "../libavutil/buffer.h"
#include "../libavutil/cpu.h"
#include "../libavutil/channel_layout.h"
#include "../libavutil/dict.h"
#include "../libavutil/frame.h"
#include "../libavutil/pixfmt.h"











//#include <errno.h> // #29
//#include "libavutil/samplefmt.h" // #30
//#include "libavutil/attributes.h" // #31
//#include "libavutil/avutil.h" // #32
//#include "libavutil/buffer.h" // #33
//#include "libavutil/cpu.h" // #34
//#include "libavutil/channel_layout.h" // #35
//#include "libavutil/dict.h" // #36
//#include "libavutil/frame.h" // #37
//#include "libavutil/log.h" // #38
//#include "libavutil/pixfmt.h" // #39
//#include "libavutil/rational.h" // #40

//#include "version.h" // #42



















enum AVCodecID {
    AV_CODEC_ID_NONE,

    
    AV_CODEC_ID_MPEG1VIDEO,
    AV_CODEC_ID_MPEG2VIDEO, ///< preferred ID for MPEG-1/2 video decoding



    AV_CODEC_ID_H261,
    AV_CODEC_ID_H263,
    AV_CODEC_ID_RV10,
    AV_CODEC_ID_RV20,
    AV_CODEC_ID_MJPEG,
    AV_CODEC_ID_MJPEGB,
    AV_CODEC_ID_LJPEG,
    AV_CODEC_ID_SP5X,
    AV_CODEC_ID_JPEGLS,
    AV_CODEC_ID_MPEG4,
    AV_CODEC_ID_RAWVIDEO,
    AV_CODEC_ID_MSMPEG4V1,
    AV_CODEC_ID_MSMPEG4V2,
    AV_CODEC_ID_MSMPEG4V3,
    AV_CODEC_ID_WMV1,
    AV_CODEC_ID_WMV2,
    AV_CODEC_ID_H263P,
    AV_CODEC_ID_H263I,
    AV_CODEC_ID_FLV1,
    AV_CODEC_ID_SVQ1,
    AV_CODEC_ID_SVQ3,
    AV_CODEC_ID_DVVIDEO,
    AV_CODEC_ID_HUFFYUV,
    AV_CODEC_ID_CYUV,
    AV_CODEC_ID_H264,
    AV_CODEC_ID_INDEO3,
    AV_CODEC_ID_VP3,
    AV_CODEC_ID_THEORA,
    AV_CODEC_ID_ASV1,
    AV_CODEC_ID_ASV2,
    AV_CODEC_ID_FFV1,
    AV_CODEC_ID_4XM,
    AV_CODEC_ID_VCR1,
    AV_CODEC_ID_CLJR,
    AV_CODEC_ID_MDEC,
    AV_CODEC_ID_ROQ,
    AV_CODEC_ID_INTERPLAY_VIDEO,
    AV_CODEC_ID_XAN_WC3,
    AV_CODEC_ID_XAN_WC4,
    AV_CODEC_ID_RPZA,
    AV_CODEC_ID_CINEPAK,
    AV_CODEC_ID_WS_VQA,
    AV_CODEC_ID_MSRLE,
    AV_CODEC_ID_MSVIDEO1,
    AV_CODEC_ID_IDCIN,
    AV_CODEC_ID_8BPS,
    AV_CODEC_ID_SMC,
    AV_CODEC_ID_FLIC,
    AV_CODEC_ID_TRUEMOTION1,
    AV_CODEC_ID_VMDVIDEO,
    AV_CODEC_ID_MSZH,
    AV_CODEC_ID_ZLIB,
    AV_CODEC_ID_QTRLE,
    AV_CODEC_ID_TSCC,
    AV_CODEC_ID_ULTI,
    AV_CODEC_ID_QDRAW,
    AV_CODEC_ID_VIXL,
    AV_CODEC_ID_QPEG,
    AV_CODEC_ID_PNG,
    AV_CODEC_ID_PPM,
    AV_CODEC_ID_PBM,
    AV_CODEC_ID_PGM,
    AV_CODEC_ID_PGMYUV,
    AV_CODEC_ID_PAM,
    AV_CODEC_ID_FFVHUFF,
    AV_CODEC_ID_RV30,
    AV_CODEC_ID_RV40,
    AV_CODEC_ID_VC1,
    AV_CODEC_ID_WMV3,
    AV_CODEC_ID_LOCO,
    AV_CODEC_ID_WNV1,
    AV_CODEC_ID_AASC,
    AV_CODEC_ID_INDEO2,
    AV_CODEC_ID_FRAPS,
    AV_CODEC_ID_TRUEMOTION2,
    AV_CODEC_ID_BMP,
    AV_CODEC_ID_CSCD,
    AV_CODEC_ID_MMVIDEO,
    AV_CODEC_ID_ZMBV,
    AV_CODEC_ID_AVS,
    AV_CODEC_ID_SMACKVIDEO,
    AV_CODEC_ID_NUV,
    AV_CODEC_ID_KMVC,
    AV_CODEC_ID_FLASHSV,
    AV_CODEC_ID_CAVS,
    AV_CODEC_ID_JPEG2000,
    AV_CODEC_ID_VMNC,
    AV_CODEC_ID_VP5,
    AV_CODEC_ID_VP6,
    AV_CODEC_ID_VP6F,
    AV_CODEC_ID_TARGA,
    AV_CODEC_ID_DSICINVIDEO,
    AV_CODEC_ID_TIERTEXSEQVIDEO,
    AV_CODEC_ID_TIFF,
    AV_CODEC_ID_GIF,
    AV_CODEC_ID_DXA,
    AV_CODEC_ID_DNXHD,
    AV_CODEC_ID_THP,
    AV_CODEC_ID_SGI,
    AV_CODEC_ID_C93,
    AV_CODEC_ID_BETHSOFTVID,
    AV_CODEC_ID_PTX,
    AV_CODEC_ID_TXD,
    AV_CODEC_ID_VP6A,
    AV_CODEC_ID_AMV,
    AV_CODEC_ID_VB,
    AV_CODEC_ID_PCX,
    AV_CODEC_ID_SUNRAST,
    AV_CODEC_ID_INDEO4,
    AV_CODEC_ID_INDEO5,
    AV_CODEC_ID_MIMIC,
    AV_CODEC_ID_RL2,
    AV_CODEC_ID_ESCAPE124,
    AV_CODEC_ID_DIRAC,
    AV_CODEC_ID_BFI,
    AV_CODEC_ID_CMV,
    AV_CODEC_ID_MOTIONPIXELS,
    AV_CODEC_ID_TGV,
    AV_CODEC_ID_TGQ,
    AV_CODEC_ID_TQI,
    AV_CODEC_ID_AURA,
    AV_CODEC_ID_AURA2,
    AV_CODEC_ID_V210X,
    AV_CODEC_ID_TMV,
    AV_CODEC_ID_V210,
    AV_CODEC_ID_DPX,
    AV_CODEC_ID_MAD,
    AV_CODEC_ID_FRWU,
    AV_CODEC_ID_FLASHSV2,
    AV_CODEC_ID_CDGRAPHICS,
    AV_CODEC_ID_R210,
    AV_CODEC_ID_ANM,
    AV_CODEC_ID_BINKVIDEO,
    AV_CODEC_ID_IFF_ILBM,

    AV_CODEC_ID_KGV1,
    AV_CODEC_ID_YOP,
    AV_CODEC_ID_VP8,
    AV_CODEC_ID_PICTOR,
    AV_CODEC_ID_ANSI,
    AV_CODEC_ID_A64_MULTI,
    AV_CODEC_ID_A64_MULTI5,
    AV_CODEC_ID_R10K,
    AV_CODEC_ID_MXPEG,
    AV_CODEC_ID_LAGARITH,
    AV_CODEC_ID_PRORES,
    AV_CODEC_ID_JV,
    AV_CODEC_ID_DFA,
    AV_CODEC_ID_WMV3IMAGE,
    AV_CODEC_ID_VC1IMAGE,
    AV_CODEC_ID_UTVIDEO,
    AV_CODEC_ID_BMV_VIDEO,
    AV_CODEC_ID_VBLE,
    AV_CODEC_ID_DXTORY,
    AV_CODEC_ID_V410,
    AV_CODEC_ID_XWD,
    AV_CODEC_ID_CDXL,
    AV_CODEC_ID_XBM,
    AV_CODEC_ID_ZEROCODEC,
    AV_CODEC_ID_MSS1,
    AV_CODEC_ID_MSA1,
    AV_CODEC_ID_TSCC2,
    AV_CODEC_ID_MTS2,
    AV_CODEC_ID_CLLC,
    AV_CODEC_ID_MSS2,
    AV_CODEC_ID_VP9,
    AV_CODEC_ID_AIC,
    AV_CODEC_ID_ESCAPE130,
    AV_CODEC_ID_G2M,
    AV_CODEC_ID_WEBP,
    AV_CODEC_ID_HNM4_VIDEO,
    AV_CODEC_ID_HEVC,

    AV_CODEC_ID_FIC,
    AV_CODEC_ID_ALIAS_PIX,
    AV_CODEC_ID_BRENDER_PIX,
    AV_CODEC_ID_PAF_VIDEO,
    AV_CODEC_ID_EXR,
    AV_CODEC_ID_VP7,
    AV_CODEC_ID_SANM,
    AV_CODEC_ID_SGIRLE,
    AV_CODEC_ID_MVC1,
    AV_CODEC_ID_MVC2,
    AV_CODEC_ID_HQX,
    AV_CODEC_ID_TDSC,
    AV_CODEC_ID_HQ_HQA,
    AV_CODEC_ID_HAP,
    AV_CODEC_ID_DDS,
    AV_CODEC_ID_DXV,
    AV_CODEC_ID_SCREENPRESSO,
    AV_CODEC_ID_RSCC,

    AV_CODEC_ID_Y41P = 0x8000,
    AV_CODEC_ID_AVRP,
    AV_CODEC_ID_012V,
    AV_CODEC_ID_AVUI,
    AV_CODEC_ID_AYUV,
    AV_CODEC_ID_TARGA_Y216,
    AV_CODEC_ID_V308,
    AV_CODEC_ID_V408,
    AV_CODEC_ID_YUV4,
    AV_CODEC_ID_AVRN,
    AV_CODEC_ID_CPIA,
    AV_CODEC_ID_XFACE,
    AV_CODEC_ID_SNOW,
    AV_CODEC_ID_SMVJPEG,
    AV_CODEC_ID_APNG,
    AV_CODEC_ID_DAALA,
    AV_CODEC_ID_CFHD,
    AV_CODEC_ID_TRUEMOTION2RT,
    AV_CODEC_ID_M101,
    AV_CODEC_ID_MAGICYUV,
    AV_CODEC_ID_SHEERVIDEO,
    AV_CODEC_ID_YLC,
    AV_CODEC_ID_PSD,
    AV_CODEC_ID_PIXLET,
    AV_CODEC_ID_SPEEDHQ,
    AV_CODEC_ID_FMVC,
    AV_CODEC_ID_SCPR,
    AV_CODEC_ID_CLEARVIDEO,
    AV_CODEC_ID_XPM,
    AV_CODEC_ID_AV1,

    
    AV_CODEC_ID_FIRST_AUDIO = 0x10000,     ///< A dummy id pointing at the start of audio codecs
    AV_CODEC_ID_PCM_S16LE = 0x10000,
    AV_CODEC_ID_PCM_S16BE,
    AV_CODEC_ID_PCM_U16LE,
    AV_CODEC_ID_PCM_U16BE,
    AV_CODEC_ID_PCM_S8,
    AV_CODEC_ID_PCM_U8,
    AV_CODEC_ID_PCM_MULAW,
    AV_CODEC_ID_PCM_ALAW,
    AV_CODEC_ID_PCM_S32LE,
    AV_CODEC_ID_PCM_S32BE,
    AV_CODEC_ID_PCM_U32LE,
    AV_CODEC_ID_PCM_U32BE,
    AV_CODEC_ID_PCM_S24LE,
    AV_CODEC_ID_PCM_S24BE,
    AV_CODEC_ID_PCM_U24LE,
    AV_CODEC_ID_PCM_U24BE,
    AV_CODEC_ID_PCM_S24DAUD,
    AV_CODEC_ID_PCM_ZORK,
    AV_CODEC_ID_PCM_S16LE_PLANAR,
    AV_CODEC_ID_PCM_DVD,
    AV_CODEC_ID_PCM_F32BE,
    AV_CODEC_ID_PCM_F32LE,
    AV_CODEC_ID_PCM_F64BE,
    AV_CODEC_ID_PCM_F64LE,
    AV_CODEC_ID_PCM_BLURAY,
    AV_CODEC_ID_PCM_LXF,
    AV_CODEC_ID_S302M,
    AV_CODEC_ID_PCM_S8_PLANAR,
    AV_CODEC_ID_PCM_S24LE_PLANAR,
    AV_CODEC_ID_PCM_S32LE_PLANAR,
    AV_CODEC_ID_PCM_S16BE_PLANAR,

    AV_CODEC_ID_PCM_S64LE = 0x10800,
    AV_CODEC_ID_PCM_S64BE,
    AV_CODEC_ID_PCM_F16LE,
    AV_CODEC_ID_PCM_F24LE,

    
    AV_CODEC_ID_ADPCM_IMA_QT = 0x11000,
    AV_CODEC_ID_ADPCM_IMA_WAV,
    AV_CODEC_ID_ADPCM_IMA_DK3,
    AV_CODEC_ID_ADPCM_IMA_DK4,
    AV_CODEC_ID_ADPCM_IMA_WS,
    AV_CODEC_ID_ADPCM_IMA_SMJPEG,
    AV_CODEC_ID_ADPCM_MS,
    AV_CODEC_ID_ADPCM_4XM,
    AV_CODEC_ID_ADPCM_XA,
    AV_CODEC_ID_ADPCM_ADX,
    AV_CODEC_ID_ADPCM_EA,
    AV_CODEC_ID_ADPCM_G726,
    AV_CODEC_ID_ADPCM_CT,
    AV_CODEC_ID_ADPCM_SWF,
    AV_CODEC_ID_ADPCM_YAMAHA,
    AV_CODEC_ID_ADPCM_SBPRO_4,
    AV_CODEC_ID_ADPCM_SBPRO_3,
    AV_CODEC_ID_ADPCM_SBPRO_2,
    AV_CODEC_ID_ADPCM_THP,
    AV_CODEC_ID_ADPCM_IMA_AMV,
    AV_CODEC_ID_ADPCM_EA_R1,
    AV_CODEC_ID_ADPCM_EA_R3,
    AV_CODEC_ID_ADPCM_EA_R2,
    AV_CODEC_ID_ADPCM_IMA_EA_SEAD,
    AV_CODEC_ID_ADPCM_IMA_EA_EACS,
    AV_CODEC_ID_ADPCM_EA_XAS,
    AV_CODEC_ID_ADPCM_EA_MAXIS_XA,
    AV_CODEC_ID_ADPCM_IMA_ISS,
    AV_CODEC_ID_ADPCM_G722,
    AV_CODEC_ID_ADPCM_IMA_APC,
    AV_CODEC_ID_ADPCM_VIMA,




    AV_CODEC_ID_ADPCM_AFC = 0x11800,
    AV_CODEC_ID_ADPCM_IMA_OKI,
    AV_CODEC_ID_ADPCM_DTK,
    AV_CODEC_ID_ADPCM_IMA_RAD,
    AV_CODEC_ID_ADPCM_G726LE,
    AV_CODEC_ID_ADPCM_THP_LE,
    AV_CODEC_ID_ADPCM_PSX,
    AV_CODEC_ID_ADPCM_AICA,
    AV_CODEC_ID_ADPCM_IMA_DAT4,
    AV_CODEC_ID_ADPCM_MTAF,

    
    AV_CODEC_ID_AMR_NB = 0x12000,
    AV_CODEC_ID_AMR_WB,

    
    AV_CODEC_ID_RA_144 = 0x13000,
    AV_CODEC_ID_RA_288,

    
    AV_CODEC_ID_ROQ_DPCM = 0x14000,
    AV_CODEC_ID_INTERPLAY_DPCM,
    AV_CODEC_ID_XAN_DPCM,
    AV_CODEC_ID_SOL_DPCM,

    AV_CODEC_ID_SDX2_DPCM = 0x14800,

    
    AV_CODEC_ID_MP2 = 0x15000,
    AV_CODEC_ID_MP3, ///< preferred ID for decoding MPEG audio layer 1, 2 or 3
    AV_CODEC_ID_AAC,
    AV_CODEC_ID_AC3,
    AV_CODEC_ID_DTS,
    AV_CODEC_ID_VORBIS,
    AV_CODEC_ID_DVAUDIO,
    AV_CODEC_ID_WMAV1,
    AV_CODEC_ID_WMAV2,
    AV_CODEC_ID_MACE3,
    AV_CODEC_ID_MACE6,
    AV_CODEC_ID_VMDAUDIO,
    AV_CODEC_ID_FLAC,
    AV_CODEC_ID_MP3ADU,
    AV_CODEC_ID_MP3ON4,
    AV_CODEC_ID_SHORTEN,
    AV_CODEC_ID_ALAC,
    AV_CODEC_ID_WESTWOOD_SND1,
    AV_CODEC_ID_GSM, ///< as in Berlin toast format
    AV_CODEC_ID_QDM2,
    AV_CODEC_ID_COOK,
    AV_CODEC_ID_TRUESPEECH,
    AV_CODEC_ID_TTA,
    AV_CODEC_ID_SMACKAUDIO,
    AV_CODEC_ID_QCELP,
    AV_CODEC_ID_WAVPACK,
    AV_CODEC_ID_DSICINAUDIO,
    AV_CODEC_ID_IMC,
    AV_CODEC_ID_MUSEPACK7,
    AV_CODEC_ID_MLP,
    AV_CODEC_ID_GSM_MS, 
    AV_CODEC_ID_ATRAC3,



    AV_CODEC_ID_APE,
    AV_CODEC_ID_NELLYMOSER,
    AV_CODEC_ID_MUSEPACK8,
    AV_CODEC_ID_SPEEX,
    AV_CODEC_ID_WMAVOICE,
    AV_CODEC_ID_WMAPRO,
    AV_CODEC_ID_WMALOSSLESS,
    AV_CODEC_ID_ATRAC3P,
    AV_CODEC_ID_EAC3,
    AV_CODEC_ID_SIPR,
    AV_CODEC_ID_MP1,
    AV_CODEC_ID_TWINVQ,
    AV_CODEC_ID_TRUEHD,
    AV_CODEC_ID_MP4ALS,
    AV_CODEC_ID_ATRAC1,
    AV_CODEC_ID_BINKAUDIO_RDFT,
    AV_CODEC_ID_BINKAUDIO_DCT,
    AV_CODEC_ID_AAC_LATM,
    AV_CODEC_ID_QDMC,
    AV_CODEC_ID_CELT,
    AV_CODEC_ID_G723_1,
    AV_CODEC_ID_G729,
    AV_CODEC_ID_8SVX_EXP,
    AV_CODEC_ID_8SVX_FIB,
    AV_CODEC_ID_BMV_AUDIO,
    AV_CODEC_ID_RALF,
    AV_CODEC_ID_IAC,
    AV_CODEC_ID_ILBC,
    AV_CODEC_ID_OPUS,
    AV_CODEC_ID_COMFORT_NOISE,
    AV_CODEC_ID_TAK,
    AV_CODEC_ID_METASOUND,
    AV_CODEC_ID_PAF_AUDIO,
    AV_CODEC_ID_ON2AVC,
    AV_CODEC_ID_DSS_SP,

    AV_CODEC_ID_FFWAVESYNTH = 0x15800,
    AV_CODEC_ID_SONIC,
    AV_CODEC_ID_SONIC_LS,
    AV_CODEC_ID_EVRC,
    AV_CODEC_ID_SMV,
    AV_CODEC_ID_DSD_LSBF,
    AV_CODEC_ID_DSD_MSBF,
    AV_CODEC_ID_DSD_LSBF_PLANAR,
    AV_CODEC_ID_DSD_MSBF_PLANAR,
    AV_CODEC_ID_4GV,
    AV_CODEC_ID_INTERPLAY_ACM,
    AV_CODEC_ID_XMA1,
    AV_CODEC_ID_XMA2,
    AV_CODEC_ID_DST,
    AV_CODEC_ID_ATRAC3AL,
    AV_CODEC_ID_ATRAC3PAL,

    
    AV_CODEC_ID_FIRST_SUBTITLE = 0x17000,          ///< A dummy ID pointing at the start of subtitle codecs.
    AV_CODEC_ID_DVD_SUBTITLE = 0x17000,
    AV_CODEC_ID_DVB_SUBTITLE,
    AV_CODEC_ID_TEXT,  ///< raw UTF-8 text
    AV_CODEC_ID_XSUB,
    AV_CODEC_ID_SSA,
    AV_CODEC_ID_MOV_TEXT,
    AV_CODEC_ID_HDMV_PGS_SUBTITLE,
    AV_CODEC_ID_DVB_TELETEXT,
    AV_CODEC_ID_SRT,

    AV_CODEC_ID_MICRODVD   = 0x17800,
    AV_CODEC_ID_EIA_608,
    AV_CODEC_ID_JACOSUB,
    AV_CODEC_ID_SAMI,
    AV_CODEC_ID_REALTEXT,
    AV_CODEC_ID_STL,
    AV_CODEC_ID_SUBVIEWER1,
    AV_CODEC_ID_SUBVIEWER,
    AV_CODEC_ID_SUBRIP,
    AV_CODEC_ID_WEBVTT,
    AV_CODEC_ID_MPL2,
    AV_CODEC_ID_VPLAYER,
    AV_CODEC_ID_PJS,
    AV_CODEC_ID_ASS,
    AV_CODEC_ID_HDMV_TEXT_SUBTITLE,

    
    AV_CODEC_ID_FIRST_UNKNOWN = 0x18000,           ///< A dummy ID pointing at the start of various fake codecs.
    AV_CODEC_ID_TTF = 0x18000,

    AV_CODEC_ID_SCTE_35, ///< Contain timestamp estimated through PCR of program stream.
    AV_CODEC_ID_BINTEXT    = 0x18800,
    AV_CODEC_ID_XBIN,
    AV_CODEC_ID_IDF,
    AV_CODEC_ID_OTF,
    AV_CODEC_ID_SMPTE_KLV,
    AV_CODEC_ID_DVD_NAV,
    AV_CODEC_ID_TIMED_ID3,
    AV_CODEC_ID_BIN_DATA,


    AV_CODEC_ID_PROBE = 0x19000, ///< codec_id is not known (like AV_CODEC_ID_NONE) but lavf should attempt to identify it

    AV_CODEC_ID_MPEG2TS = 0x20000, 

    AV_CODEC_ID_MPEG4SYSTEMS = 0x20001, 

    AV_CODEC_ID_FFMETADATA = 0x21000,   ///< Dummy codec for streams containing only metadata information.
    AV_CODEC_ID_WRAPPED_AVFRAME = 0x21001, ///< Passthrough codec, AVFrames wrapped in AVPacket
};






typedef struct AVCodecDescriptor {
    enum AVCodecID     id;
    enum AVMediaType type;
    




    const char      *name;
    


    const char *long_name;
    


    int             props;
    




    const char *const *mime_types;
    



    const struct AVProfile *profiles;
} AVCodecDescriptor;


































































enum AVDiscard{
    

    AVDISCARD_NONE    =-16, ///< discard nothing
    AVDISCARD_DEFAULT =  0, ///< discard useless packets like 0 size packets in avi
    AVDISCARD_NONREF  =  8, ///< discard all non reference
    AVDISCARD_BIDIR   = 16, ///< discard all bidirectional frames
    AVDISCARD_NONINTRA= 24, ///< discard all non intra frames
    AVDISCARD_NONKEY  = 32, ///< discard all frames except keyframes
    AVDISCARD_ALL     = 48, ///< discard all
};

enum AVAudioServiceType {
    AV_AUDIO_SERVICE_TYPE_MAIN              = 0,
    AV_AUDIO_SERVICE_TYPE_EFFECTS           = 1,
    AV_AUDIO_SERVICE_TYPE_VISUALLY_IMPAIRED = 2,
    AV_AUDIO_SERVICE_TYPE_HEARING_IMPAIRED  = 3,
    AV_AUDIO_SERVICE_TYPE_DIALOGUE          = 4,
    AV_AUDIO_SERVICE_TYPE_COMMENTARY        = 5,
    AV_AUDIO_SERVICE_TYPE_EMERGENCY         = 6,
    AV_AUDIO_SERVICE_TYPE_VOICE_OVER        = 7,
    AV_AUDIO_SERVICE_TYPE_KARAOKE           = 8,
    AV_AUDIO_SERVICE_TYPE_NB                   , ///< Not part of ABI
};




typedef struct RcOverride{
    int start_frame;
    int end_frame;
    int qscale; // If this is 0 then quality_factor will be used instead.
    float quality_factor;
} RcOverride;


































































































































































































































typedef struct AVPanScan{
    




    int id;

    




    int width;
    int height;

    




    int16_t position[3][2];
}AVPanScan;






typedef struct AVCPBProperties {
    



    int max_bitrate;
    



    int min_bitrate;
    



    int avg_bitrate;

    



    int buffer_size;

    






    uint64_t vbv_delay;
} AVCPBProperties;



















enum AVPacketSideDataType {
    




    AV_PKT_DATA_PALETTE,

    






    AV_PKT_DATA_NEW_EXTRADATA,

    

    AV_PKT_DATA_PARAM_CHANGE,

    

    AV_PKT_DATA_H263_MB_INFO,

    



    AV_PKT_DATA_REPLAYGAIN,

    






    AV_PKT_DATA_DISPLAYMATRIX,

    



    AV_PKT_DATA_STEREO3D,

    



    AV_PKT_DATA_AUDIO_SERVICE_TYPE,

    

    AV_PKT_DATA_QUALITY_STATS,

    





    AV_PKT_DATA_FALLBACK_TRACK,

    


    AV_PKT_DATA_CPB_PROPERTIES,

    








    AV_PKT_DATA_SKIP_SAMPLES=70,

    







    AV_PKT_DATA_JP_DUALMONO,

    



    AV_PKT_DATA_STRINGS_METADATA,

    








    AV_PKT_DATA_SUBTITLE_POSITION,

    





    AV_PKT_DATA_MATROSKA_BLOCKADDITIONAL,

    


    AV_PKT_DATA_WEBVTT_IDENTIFIER,

    



    AV_PKT_DATA_WEBVTT_SETTINGS,

    




    AV_PKT_DATA_METADATA_UPDATE,

    



    AV_PKT_DATA_MPEGTS_STREAM_ID,

    




    AV_PKT_DATA_MASTERING_DISPLAY_METADATA,

    



    AV_PKT_DATA_SPHERICAL,

    







    AV_PKT_DATA_NB
};



typedef struct AVPacketSideData {
    uint8_t *data;
    int      size;
    enum AVPacketSideDataType type;
} AVPacketSideData;



typedef struct AVPacket {
    




    AVBufferRef *buf;
    








    int64_t pts;
    




    int64_t dts;
    uint8_t *data;
    int   size;
    int   stream_index;
    


    int   flags;
    



    AVPacketSideData *side_data;
    int side_data_elems;

    



    int64_t duration;

    int64_t pos;                            ///< byte position in stream, -1 if unknown


} AVPacket;









enum AVSideDataParamChangeFlags {
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_COUNT  = 0x0001,
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_LAYOUT = 0x0002,
    AV_SIDE_DATA_PARAM_CHANGE_SAMPLE_RATE    = 0x0004,
    AV_SIDE_DATA_PARAM_CHANGE_DIMENSIONS     = 0x0008,
};




struct AVCodecInternal;

enum AVFieldOrder {
    AV_FIELD_UNKNOWN,
    AV_FIELD_PROGRESSIVE,
    AV_FIELD_TT,          //< Top coded_first, top displayed first
    AV_FIELD_BB,          //< Bottom coded first, bottom displayed first
    AV_FIELD_TB,          //< Top coded first, bottom displayed first
    AV_FIELD_BT,          //< Bottom coded first, top displayed first
};



typedef struct AVCodecContext {
    



    const AVClass *av_class;
    int log_level_offset;

    enum AVMediaType codec_type; 
    const struct AVCodec  *codec;







    enum AVCodecID     codec_id; 

    

    unsigned int codec_tag;









    void *priv_data;

    





    struct AVCodecInternal *internal;

    




    void *opaque;

    





    int64_t bit_rate;

    





    int bit_rate_tolerance;

    





    int global_quality;

    



    int compression_level;


    




    int flags;

    




    int flags2;

    

    uint8_t *extradata;
    int extradata_size;

    

    AVRational time_base;

    






    int ticks_per_frame;

    

    int delay;


    
    

    int width, height;

    

    int coded_width, coded_height;





    




    int gop_size;

    

    enum AVPixelFormat pix_fmt;









    

    void (*draw_horiz_band)(struct AVCodecContext *s,
                            const AVFrame *src, int offset[AV_NUM_DATA_POINTERS],
                            int y, int type, int height);

    

    enum AVPixelFormat (*get_format)(struct AVCodecContext *s, const enum AVPixelFormat * fmt);

    





    int max_b_frames;

    






    float b_quant_factor;













    




    float b_quant_offset;

    





    int has_b_frames;







    






    float i_quant_factor;

    




    float i_quant_offset;

    




    float lumi_masking;

    




    float temporal_cplx_masking;

    




    float spatial_cplx_masking;

    




    float p_masking;

    




    float dark_masking;

    




    int slice_count;










    




    int *slice_offset;

    






    AVRational sample_aspect_ratio;

    




    int me_cmp;
    




    int me_sub_cmp;
    




    int mb_cmp;
    




    int ildct_cmp;


    




    int dia_size;

    




    int last_predictor_count;







    




    int me_pre_cmp;

    




    int pre_dia_size;

    




    int me_subpel_quality;



    






    int me_range;



    




    int slice_flags;






    




    int mb_decision;




    




    uint16_t *intra_matrix;

    




    uint16_t *inter_matrix;





    




    int intra_dc_precision;

    




    int skip_top;

    




    int skip_bottom;









    




    int mb_lmin;

    




    int mb_lmax;









    



    int bidir_refine;







    




    int keyint_min;

    




    int refs;
















    




    int mv0_threshold;







    




    enum AVColorPrimaries color_primaries;

    




    enum AVColorTransferCharacteristic color_trc;

    




    enum AVColorSpace colorspace;

    




    enum AVColorRange color_range;

    




    enum AVChromaLocation chroma_sample_location;

    






    int slices;

    



    enum AVFieldOrder field_order;

    
    int sample_rate; ///< samples per second
    int channels;    ///< number of audio channels

    




    enum AVSampleFormat sample_fmt;  ///< sample format

    
    








    int frame_size;

    








    int frame_number;

    



    int block_align;

    




    int cutoff;

    




    uint64_t channel_layout;

    




    uint64_t request_channel_layout;

    




    enum AVAudioServiceType audio_service_type;

    





    enum AVSampleFormat request_sample_fmt;

    

    int (*get_buffer2)(struct AVCodecContext *s, AVFrame *frame, int flags);

    

    int refcounted_frames;

    
    float qcompress;  ///< amount of qscale change between easy & hard scenes (0.0-1.0)
    float qblur;      ///< amount of qscale smoothing over time (0.0-1.0)

    




    int qmin;

    




    int qmax;

    




    int max_qdiff;



    




    int rc_buffer_size;

    




    int rc_override_count;
    RcOverride *rc_override;









    




    int64_t rc_max_rate;

    




    int64_t rc_min_rate;



    




    float rc_max_available_vbv_use;

    




    float rc_min_vbv_overflow_use;

    




    int rc_initial_buffer_occupancy;













    




    int trellis;









    




    char *stats_out;

    





    char *stats_in;

    




    int workaround_bugs;


    

    int strict_std_compliance;






    




    int error_concealment;




    




    int debug;




    




    int err_recognition;


















    





    int64_t reordered_opaque;

    




    struct AVHWAccel *hwaccel;

    

    void *hwaccel_context;

    




    uint64_t error[AV_NUM_DATA_POINTERS];

    




    int dct_algo;







    




    int idct_algo;


    




     int bits_per_coded_sample;

    




    int bits_per_raw_sample;












    





    int thread_count;

    







    int thread_type;



    




    int active_thread_type;

    







    int thread_safe_callbacks;

    








    int (*execute)(struct AVCodecContext *c, int (*func)(struct AVCodecContext *c2, void *arg), void *arg2, int *ret, int count, int size);

    

    int (*execute2)(struct AVCodecContext *c, int (*func)(struct AVCodecContext *c2, void *arg, int jobnr, int threadnr), void *arg2, int *ret, int count);

    




     int nsse_weight;

    




     int profile;






















































    




     int level;


    




    enum AVDiscard skip_loop_filter;

    




    enum AVDiscard skip_idct;

    




    enum AVDiscard skip_frame;

    







    uint8_t *subtitle_header;
    int subtitle_header_size;














    

    int initial_padding;

    






    AVRational framerate;

    




    enum AVPixelFormat sw_pix_fmt;

    




    AVRational pkt_timebase;

    




    const AVCodecDescriptor *codec_descriptor;


    




     int lowres;


    




    int64_t pts_correction_num_faulty_pts; /// Number of incorrect PTS values so far
    int64_t pts_correction_num_faulty_dts; /// Number of incorrect DTS values so far
    int64_t pts_correction_last_pts;       /// PTS of the last frame
    int64_t pts_correction_last_dts;       /// DTS of the last frame

    




    char *sub_charenc;

    





    int sub_charenc_mode;




    

    int skip_alpha;

    




    int seek_preroll;


    




    int debug_mv;





    




    uint16_t *chroma_intra_matrix;

    





    uint8_t *dump_separator;

    





    char *codec_whitelist;

    




    unsigned properties;



    





    AVPacketSideData *coded_side_data;
    int            nb_coded_side_data;

    

    AVBufferRef *hw_frames_ctx;

    




    int sub_text_format;





    








    int trailing_padding;

    





    int64_t max_pixels;

    

    AVBufferRef *hw_device_ctx;

    






    int hwaccel_flags;
} AVCodecContext;

AVRational av_codec_get_pkt_timebase         (const AVCodecContext *avctx);
void       av_codec_set_pkt_timebase         (AVCodecContext *avctx, AVRational val);

const AVCodecDescriptor *av_codec_get_codec_descriptor(const AVCodecContext *avctx);
void                     av_codec_set_codec_descriptor(AVCodecContext *avctx, const AVCodecDescriptor *desc);

unsigned av_codec_get_codec_properties(const AVCodecContext *avctx);

int  av_codec_get_lowres(const AVCodecContext *avctx);
void av_codec_set_lowres(AVCodecContext *avctx, int val);

int  av_codec_get_seek_preroll(const AVCodecContext *avctx);
void av_codec_set_seek_preroll(AVCodecContext *avctx, int val);

uint16_t *av_codec_get_chroma_intra_matrix(const AVCodecContext *avctx);
void av_codec_set_chroma_intra_matrix(AVCodecContext *avctx, uint16_t *val);




typedef struct AVProfile {
    int profile;
    const char *name; ///< short name for the profile
} AVProfile;

typedef struct AVCodecDefault AVCodecDefault;

struct AVSubtitle;




typedef struct AVCodec {
    





    const char *name;
    



    const char *long_name;
    enum AVMediaType type;
    enum AVCodecID id;
    



    int capabilities;
    const AVRational *supported_framerates; ///< array of supported framerates, or NULL if any, array is terminated by {0,0}
    const enum AVPixelFormat *pix_fmts;     ///< array of supported pixel formats, or NULL if unknown, array is terminated by -1
    const int *supported_samplerates;       ///< array of supported audio samplerates, or NULL if unknown, array is terminated by 0
    const enum AVSampleFormat *sample_fmts; ///< array of supported sample formats, or NULL if unknown, array is terminated by -1
    const uint64_t *channel_layouts;         ///< array of support channel layouts, or NULL if unknown. array is terminated by 0
    uint8_t max_lowres;                     ///< maximum value for lowres supported by the decoder
    const AVClass *priv_class;              ///< AVClass for the private context
    const AVProfile *profiles;              ///< array of recognized profiles, or NULL if unknown, array is terminated by {-99}

    






    int priv_data_size;
    struct AVCodec *next;
    



    




    int (*init_thread_copy)(AVCodecContext *);
    






    int (*update_thread_context)(AVCodecContext *dst, const AVCodecContext *src);
    

    


    const AVCodecDefault *defaults;

    


    void (*init_static_data)(struct AVCodec *codec);

    int (*init)(AVCodecContext *);
    int (*encode_sub)(AVCodecContext *, uint8_t *buf, int buf_size,
                      const struct AVSubtitle *sub);
    

    int (*encode2)(AVCodecContext *avctx, AVPacket *avpkt, const AVFrame *frame,
                   int *got_packet_ptr);
    int (*decode)(AVCodecContext *, void *outdata, int *outdata_size, AVPacket *avpkt);
    int (*close)(AVCodecContext *);
    

    int (*send_frame)(AVCodecContext *avctx, const AVFrame *frame);
    int (*send_packet)(AVCodecContext *avctx, const AVPacket *avpkt);
    int (*receive_frame)(AVCodecContext *avctx, AVFrame *frame);
    int (*receive_packet)(AVCodecContext *avctx, AVPacket *avpkt);
    



    void (*flush)(AVCodecContext *);
    



    int caps_internal;
} AVCodec;

int av_codec_get_max_lowres(const AVCodec *codec);

struct MpegEncContext;





typedef struct AVHWAccel {
    




    const char *name;

    




    enum AVMediaType type;

    




    enum AVCodecID id;

    




    enum AVPixelFormat pix_fmt;

    



    int capabilities;

    






    struct AVHWAccel *next;

    


    int (*alloc_frame)(AVCodecContext *avctx, AVFrame *frame);

    

    int (*start_frame)(AVCodecContext *avctx, const uint8_t *buf, uint32_t buf_size);

    

    int (*decode_slice)(AVCodecContext *avctx, const uint8_t *buf, uint32_t buf_size);

    








    int (*end_frame)(AVCodecContext *avctx);

    






    int frame_priv_data_size;

    








    void (*decode_mb)(struct MpegEncContext *s);

    






    int (*init)(AVCodecContext *avctx);

    





    int (*uninit)(AVCodecContext *avctx);

    



    int priv_data_size;

    


    int caps_internal;
} AVHWAccel;























enum AVSubtitleType {
    SUBTITLE_NONE,

    SUBTITLE_BITMAP,                ///< A bitmap, pict will be set

    



    SUBTITLE_TEXT,

    



    SUBTITLE_ASS,
};



typedef struct AVSubtitleRect {
    int x;         ///< top left corner  of pict, undefined when pict is not set
    int y;         ///< top left corner  of pict, undefined when pict is not set
    int w;         ///< width            of pict, undefined when pict is not set
    int h;         ///< height           of pict, undefined when pict is not set
    int nb_colors; ///< number of colors in pict, undefined when pict is not set








    



    uint8_t *data[4];
    int linesize[4];

    enum AVSubtitleType type;

    char *text;                     ///< 0 terminated plain UTF-8 text

    




    char *ass;

    int flags;
} AVSubtitleRect;

typedef struct AVSubtitle {
    uint16_t format; 
    uint32_t start_display_time; 
    uint32_t end_display_time; 
    unsigned num_rects;
    AVSubtitleRect **rects;
    int64_t pts;    ///< Same as packet pts, in AV_TIME_BASE
} AVSubtitle;








typedef struct AVCodecParameters {
    


    enum AVMediaType codec_type;
    


    enum AVCodecID   codec_id;
    


    uint32_t         codec_tag;

    







    uint8_t *extradata;
    


    int      extradata_size;

    



    int format;

    


    int64_t bit_rate;

    

    int bits_per_coded_sample;

    

    int bits_per_raw_sample;

    


    int profile;
    int level;

    


    int width;
    int height;

    






    AVRational sample_aspect_ratio;

    


    enum AVFieldOrder                  field_order;

    


    enum AVColorRange                  color_range;
    enum AVColorPrimaries              color_primaries;
    enum AVColorTransferCharacteristic color_trc;
    enum AVColorSpace                  color_space;
    enum AVChromaLocation              chroma_location;

    


    int video_delay;

    




    uint64_t channel_layout;
    


    int      channels;
    


    int      sample_rate;
    





    int      block_align;
    


    int      frame_size;

    





    int initial_padding;
    





    int trailing_padding;
    


    int seek_preroll;
} AVCodecParameters;






AVCodec *av_codec_next(const AVCodec *c);




unsigned avcodec_version(void);




const char *avcodec_configuration(void);




const char *avcodec_license(void);









void avcodec_register(AVCodec *codec);



void avcodec_register_all(void);



AVCodecContext *avcodec_alloc_context3(const AVCodec *codec);





void avcodec_free_context(AVCodecContext **avctx);
















const AVClass *avcodec_get_class(void);








AVCodecParameters *avcodec_parameters_alloc(void);





void avcodec_parameters_free(AVCodecParameters **par);







int avcodec_parameters_copy(AVCodecParameters *dst, const AVCodecParameters *src);








int avcodec_parameters_from_context(AVCodecParameters *par,
                                    const AVCodecContext *codec);









int avcodec_parameters_to_context(AVCodecContext *codec,
                                  const AVCodecParameters *par);



int avcodec_open2(AVCodecContext *avctx, const AVCodec *codec, AVDictionary **options);



int avcodec_close(AVCodecContext *avctx);






void avsubtitle_free(AVSubtitle *sub);












AVPacket *av_packet_alloc(void);



AVPacket *av_packet_clone(const AVPacket *src);








void av_packet_free(AVPacket **pkt);









void av_init_packet(AVPacket *pkt);









int av_new_packet(AVPacket *pkt, int size);







void av_shrink_packet(AVPacket *pkt, int size);







int av_grow_packet(AVPacket *pkt, int grow_by);



int av_packet_from_data(AVPacket *pkt, uint8_t *data, int size);










uint8_t* av_packet_new_side_data(AVPacket *pkt, enum AVPacketSideDataType type,
                                 int size);



int av_packet_add_side_data(AVPacket *pkt, enum AVPacketSideDataType type,
                            uint8_t *data, size_t size);









int av_packet_shrink_side_data(AVPacket *pkt, enum AVPacketSideDataType type,
                               int size);









uint8_t* av_packet_get_side_data(const AVPacket *pkt, enum AVPacketSideDataType type,
                                 int *size);









const char *av_packet_side_data_name(enum AVPacketSideDataType type);








uint8_t *av_packet_pack_dictionary(AVDictionary *dict, int *size);








int av_packet_unpack_dictionary(const uint8_t *data, int size, AVDictionary **dict);








void av_packet_free_side_data(AVPacket *pkt);



int av_packet_ref(AVPacket *dst, const AVPacket *src);









void av_packet_unref(AVPacket *pkt);









void av_packet_move_ref(AVPacket *dst, AVPacket *src);



int av_packet_copy_props(AVPacket *dst, const AVPacket *src);



void av_packet_rescale_ts(AVPacket *pkt, AVRational tb_src, AVRational tb_dst);
















AVCodec *avcodec_find_decoder(enum AVCodecID id);







AVCodec *avcodec_find_decoder_by_name(const char *name);






int avcodec_default_get_buffer2(AVCodecContext *s, AVFrame *frame, int flags);










void avcodec_align_dimensions(AVCodecContext *s, int *width, int *height);








void avcodec_align_dimensions2(AVCodecContext *s, int *width, int *height,
                               int linesize_align[AV_NUM_DATA_POINTERS]);










int avcodec_enum_to_chroma_pos(int *xpos, int *ypos, enum AVChromaLocation pos);










enum AVChromaLocation avcodec_chroma_pos_to_enum(int xpos, int ypos);



attribute_deprecated
int avcodec_decode_audio4(AVCodecContext *avctx, AVFrame *frame,
                          int *got_frame_ptr, const AVPacket *avpkt);



attribute_deprecated
int avcodec_decode_video2(AVCodecContext *avctx, AVFrame *picture,
                         int *got_picture_ptr,
                         const AVPacket *avpkt);



int avcodec_decode_subtitle2(AVCodecContext *avctx, AVSubtitle *sub,
                            int *got_sub_ptr,
                            AVPacket *avpkt);



int avcodec_send_packet(AVCodecContext *avctx, const AVPacket *avpkt);



int avcodec_receive_frame(AVCodecContext *avctx, AVFrame *frame);



int avcodec_send_frame(AVCodecContext *avctx, const AVFrame *frame);



int avcodec_receive_packet(AVCodecContext *avctx, AVPacket *avpkt);







enum AVPictureStructure {
    AV_PICTURE_STRUCTURE_UNKNOWN,      //< unknown
    AV_PICTURE_STRUCTURE_TOP_FIELD,    //< coded as top field
    AV_PICTURE_STRUCTURE_BOTTOM_FIELD, //< coded as bottom field
    AV_PICTURE_STRUCTURE_FRAME,        //< coded as frame
};

typedef struct AVCodecParserContext {
    void *priv_data;
    struct AVCodecParser *parser;
    int64_t frame_offset; 
    int64_t cur_offset; 

    int64_t next_frame_offset; 
    
    int pict_type; 
    








    int repeat_pict; 
    int64_t pts;     
    int64_t dts;     

    
    int64_t last_pts;
    int64_t last_dts;
    int fetch_timestamp;


    int cur_frame_start_index;
    int64_t cur_frame_offset[4];
    int64_t cur_frame_pts[4];
    int64_t cur_frame_dts[4];

    int flags;


/// Set if the parser has a valid file offset



    int64_t offset;      ///< byte offset from starting packet start
    int64_t cur_frame_end[4];

    





    int key_frame;









    // Timestamp generation support:
    








    int dts_sync_point;

    

    int dts_ref_dts_delta;

    

    int pts_dts_delta;

    




    int64_t cur_frame_pos[4];

    


    int64_t pos;

    


    int64_t last_pos;

    




    int duration;

    enum AVFieldOrder field_order;

    







    enum AVPictureStructure picture_structure;

    





    int output_picture_number;

    


    int width;
    int height;

    


    int coded_width;
    int coded_height;

    







    int format;
} AVCodecParserContext;

typedef struct AVCodecParser {
    int codec_ids[5]; 
    int priv_data_size;
    int (*parser_init)(AVCodecParserContext *s);
    

    int (*parser_parse)(AVCodecParserContext *s,
                        AVCodecContext *avctx,
                        const uint8_t **poutbuf, int *poutbuf_size,
                        const uint8_t *buf, int buf_size);
    void (*parser_close)(AVCodecParserContext *s);
    int (*split)(AVCodecContext *avctx, const uint8_t *buf, int buf_size);
    struct AVCodecParser *next;
} AVCodecParser;

AVCodecParser *av_parser_next(const AVCodecParser *c);

void av_register_codec_parser(AVCodecParser *parser);
AVCodecParserContext *av_parser_init(int codec_id);



int av_parser_parse2(AVCodecParserContext *s,
                     AVCodecContext *avctx,
                     uint8_t **poutbuf, int *poutbuf_size,
                     const uint8_t *buf, int buf_size,
                     int64_t pts, int64_t dts,
                     int64_t pos);





int av_parser_change(AVCodecParserContext *s,
                     AVCodecContext *avctx,
                     uint8_t **poutbuf, int *poutbuf_size,
                     const uint8_t *buf, int buf_size, int keyframe);
void av_parser_close(AVCodecParserContext *s);

















AVCodec *avcodec_find_encoder(enum AVCodecID id);







AVCodec *avcodec_find_encoder_by_name(const char *name);



attribute_deprecated
int avcodec_encode_audio2(AVCodecContext *avctx, AVPacket *avpkt,
                          const AVFrame *frame, int *got_packet_ptr);



attribute_deprecated
int avcodec_encode_video2(AVCodecContext *avctx, AVPacket *avpkt,
                          const AVFrame *frame, int *got_packet_ptr);

int avcodec_encode_subtitle(AVCodecContext *avctx, uint8_t *buf, int buf_size,
                            const AVSubtitle *sub);





























void avcodec_get_chroma_sub_sample(enum AVPixelFormat pix_fmt, int *h_shift, int *v_shift);






unsigned int avcodec_pix_fmt_to_codec_tag(enum AVPixelFormat pix_fmt);




int avcodec_get_pix_fmt_loss(enum AVPixelFormat dst_pix_fmt, enum AVPixelFormat src_pix_fmt,
                             int has_alpha);



enum AVPixelFormat avcodec_find_best_pix_fmt_of_list(const enum AVPixelFormat *pix_fmt_list,
                                            enum AVPixelFormat src_pix_fmt,
                                            int has_alpha, int *loss_ptr);




enum AVPixelFormat avcodec_find_best_pix_fmt_of_2(enum AVPixelFormat dst_pix_fmt1, enum AVPixelFormat dst_pix_fmt2,
                                            enum AVPixelFormat src_pix_fmt, int has_alpha, int *loss_ptr);

attribute_deprecated
enum AVPixelFormat avcodec_find_best_pix_fmt2(enum AVPixelFormat dst_pix_fmt1, enum AVPixelFormat dst_pix_fmt2,
                                            enum AVPixelFormat src_pix_fmt, int has_alpha, int *loss_ptr);

enum AVPixelFormat avcodec_default_get_format(struct AVCodecContext *s, const enum AVPixelFormat * fmt);















void avcodec_string(char *buf, int buf_size, AVCodecContext *enc, int encode);








const char *av_get_profile_name(const AVCodec *codec, int profile);



const char *avcodec_profile_name(enum AVCodecID codec_id, int profile);

int avcodec_default_execute(AVCodecContext *c, int (*func)(AVCodecContext *c2, void *arg2),void *arg, int *ret, int count, int size);
int avcodec_default_execute2(AVCodecContext *c, int (*func)(AVCodecContext *c2, void *arg2, int, int),void *arg, int *ret, int count);
//FIXME func typedef



int avcodec_fill_audio_frame(AVFrame *frame, int nb_channels,
                             enum AVSampleFormat sample_fmt, const uint8_t *buf,
                             int buf_size, int align);










void avcodec_flush_buffers(AVCodecContext *avctx);







int av_get_bits_per_sample(enum AVCodecID codec_id);







enum AVCodecID av_get_pcm_codec(enum AVSampleFormat fmt, int be);









int av_get_exact_bits_per_sample(enum AVCodecID codec_id);









int av_get_audio_frame_duration(AVCodecContext *avctx, int frame_bytes);





int av_get_audio_frame_duration2(AVCodecParameters *par, int frame_bytes);



typedef struct AVBSFInternal AVBSFInternal;



typedef struct AVBSFContext {
    


    const AVClass *av_class;

    


    const struct AVBitStreamFilter *filter;

    



    AVBSFInternal *internal;

    



    void *priv_data;

    




    AVCodecParameters *par_in;

    



    AVCodecParameters *par_out;

    



    AVRational time_base_in;

    



    AVRational time_base_out;
} AVBSFContext;

typedef struct AVBitStreamFilter {
    const char *name;

    




    const enum AVCodecID *codec_ids;

    








    const AVClass *priv_class;

    







    int priv_data_size;
    int (*init)(AVBSFContext *ctx);
    int (*filter)(AVBSFContext *ctx, AVPacket *pkt);
    void (*close)(AVBSFContext *ctx);
} AVBitStreamFilter;







const AVBitStreamFilter *av_bsf_get_by_name(const char *name);










const AVBitStreamFilter *av_bsf_next(void **opaque);



int av_bsf_alloc(const AVBitStreamFilter *filter, AVBSFContext **ctx);





int av_bsf_init(AVBSFContext *ctx);



int av_bsf_send_packet(AVBSFContext *ctx, AVPacket *pkt);



int av_bsf_receive_packet(AVBSFContext *ctx, AVPacket *pkt);





void av_bsf_free(AVBSFContext **ctx);







const AVClass *av_bsf_get_class(void);





typedef struct AVBSFList AVBSFList;








AVBSFList *av_bsf_list_alloc(void);






void av_bsf_list_free(AVBSFList **lst);









int av_bsf_list_append(AVBSFList *lst, AVBSFContext *bsf);



int av_bsf_list_append2(AVBSFList *lst, const char * bsf_name, AVDictionary **options);


int av_bsf_list_finalize(AVBSFList **lst, AVBSFContext **bsf);



int av_bsf_list_parse_str(const char *str, AVBSFContext **bsf);








int av_bsf_get_null_filter(AVBSFContext **bsf);










void av_fast_padded_malloc(void *ptr, unsigned int *size, size_t min_size);





void av_fast_padded_mallocz(void *ptr, unsigned int *size, size_t min_size);








unsigned int av_xiphlacing(unsigned char *s, unsigned int v);






void av_register_hwaccel(AVHWAccel *hwaccel);






AVHWAccel *av_hwaccel_next(const AVHWAccel *hwaccel);





enum AVLockOp {
  AV_LOCK_CREATE,  ///< Create a mutex
  AV_LOCK_OBTAIN,  ///< Lock the mutex
  AV_LOCK_RELEASE, ///< Unlock the mutex
  AV_LOCK_DESTROY, ///< Free mutex resources
};



int av_lockmgr_register(int (*cb)(void **mutex, enum AVLockOp op));




enum AVMediaType avcodec_get_type(enum AVCodecID codec_id);





const char *avcodec_get_name(enum AVCodecID id);





int avcodec_is_open(AVCodecContext *s);




int av_codec_is_encoder(const AVCodec *codec);




int av_codec_is_decoder(const AVCodec *codec);




const AVCodecDescriptor *avcodec_descriptor_get(enum AVCodecID id);








const AVCodecDescriptor *avcodec_descriptor_next(const AVCodecDescriptor *prev);





const AVCodecDescriptor *avcodec_descriptor_get_by_name(const char *name);










AVCPBProperties *av_cpb_properties_alloc(size_t *size);






