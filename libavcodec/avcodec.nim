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
  ../nim_ffmpeg_common, ../libavutil/samplefmt, ../libavutil/attributes,
  ../libavutil/avutil, ../libavutil/buffer, ../libavutil/cpu,
  ../libavutil/channel_layout, ../libavutil/dict, ../libavutil/frame,
  ../libavutil/pixfmt


type
  AVCodecID* {.size: sizeof(cint).} = enum
    AV_CODEC_ID_NONE, AV_CODEC_ID_MPEG1VIDEO, AV_CODEC_ID_MPEG2VIDEO,
    AV_CODEC_ID_H261, AV_CODEC_ID_H263, AV_CODEC_ID_RV10, AV_CODEC_ID_RV20,
    AV_CODEC_ID_MJPEG, AV_CODEC_ID_MJPEGB, AV_CODEC_ID_LJPEG, AV_CODEC_ID_SP5X,
    AV_CODEC_ID_JPEGLS, AV_CODEC_ID_MPEG4, AV_CODEC_ID_RAWVIDEO,
    AV_CODEC_ID_MSMPEG4V1, AV_CODEC_ID_MSMPEG4V2, AV_CODEC_ID_MSMPEG4V3,
    AV_CODEC_ID_WMV1, AV_CODEC_ID_WMV2, AV_CODEC_ID_H263P, AV_CODEC_ID_H263I,
    AV_CODEC_ID_FLV1, AV_CODEC_ID_SVQ1, AV_CODEC_ID_SVQ3, AV_CODEC_ID_DVVIDEO,
    AV_CODEC_ID_HUFFYUV, AV_CODEC_ID_CYUV, AV_CODEC_ID_H264, AV_CODEC_ID_INDEO3,
    AV_CODEC_ID_VP3, AV_CODEC_ID_THEORA, AV_CODEC_ID_ASV1, AV_CODEC_ID_ASV2,
    AV_CODEC_ID_FFV1, AV_CODEC_ID_4XM, AV_CODEC_ID_VCR1, AV_CODEC_ID_CLJR,
    AV_CODEC_ID_MDEC, AV_CODEC_ID_ROQ, AV_CODEC_ID_INTERPLAY_VIDEO,
    AV_CODEC_ID_XAN_WC3, AV_CODEC_ID_XAN_WC4, AV_CODEC_ID_RPZA,
    AV_CODEC_ID_CINEPAK, AV_CODEC_ID_WS_VQA, AV_CODEC_ID_MSRLE,
    AV_CODEC_ID_MSVIDEO1, AV_CODEC_ID_IDCIN, AV_CODEC_ID_8BPS, AV_CODEC_ID_SMC,
    AV_CODEC_ID_FLIC, AV_CODEC_ID_TRUEMOTION1, AV_CODEC_ID_VMDVIDEO,
    AV_CODEC_ID_MSZH, AV_CODEC_ID_ZLIB, AV_CODEC_ID_QTRLE, AV_CODEC_ID_TSCC,
    AV_CODEC_ID_ULTI, AV_CODEC_ID_QDRAW, AV_CODEC_ID_VIXL, AV_CODEC_ID_QPEG,
    AV_CODEC_ID_PNG, AV_CODEC_ID_PPM, AV_CODEC_ID_PBM, AV_CODEC_ID_PGM,
    AV_CODEC_ID_PGMYUV, AV_CODEC_ID_PAM, AV_CODEC_ID_FFVHUFF, AV_CODEC_ID_RV30,
    AV_CODEC_ID_RV40, AV_CODEC_ID_VC1, AV_CODEC_ID_WMV3, AV_CODEC_ID_LOCO,
    AV_CODEC_ID_WNV1, AV_CODEC_ID_AASC, AV_CODEC_ID_INDEO2, AV_CODEC_ID_FRAPS,
    AV_CODEC_ID_TRUEMOTION2, AV_CODEC_ID_BMP, AV_CODEC_ID_CSCD,
    AV_CODEC_ID_MMVIDEO, AV_CODEC_ID_ZMBV, AV_CODEC_ID_AVS, AV_CODEC_ID_SMACKVIDEO,
    AV_CODEC_ID_NUV, AV_CODEC_ID_KMVC, AV_CODEC_ID_FLASHSV, AV_CODEC_ID_CAVS,
    AV_CODEC_ID_JPEG2000, AV_CODEC_ID_VMNC, AV_CODEC_ID_VP5, AV_CODEC_ID_VP6,
    AV_CODEC_ID_VP6F, AV_CODEC_ID_TARGA, AV_CODEC_ID_DSICINVIDEO,
    AV_CODEC_ID_TIERTEXSEQVIDEO, AV_CODEC_ID_TIFF, AV_CODEC_ID_GIF,
    AV_CODEC_ID_DXA, AV_CODEC_ID_DNXHD, AV_CODEC_ID_THP, AV_CODEC_ID_SGI,
    AV_CODEC_ID_C93, AV_CODEC_ID_BETHSOFTVID, AV_CODEC_ID_PTX, AV_CODEC_ID_TXD,
    AV_CODEC_ID_VP6A, AV_CODEC_ID_AMV, AV_CODEC_ID_VB, AV_CODEC_ID_PCX,
    AV_CODEC_ID_SUNRAST, AV_CODEC_ID_INDEO4, AV_CODEC_ID_INDEO5, AV_CODEC_ID_MIMIC,
    AV_CODEC_ID_RL2, AV_CODEC_ID_ESCAPE124, AV_CODEC_ID_DIRAC, AV_CODEC_ID_BFI,
    AV_CODEC_ID_CMV, AV_CODEC_ID_MOTIONPIXELS, AV_CODEC_ID_TGV, AV_CODEC_ID_TGQ,
    AV_CODEC_ID_TQI, AV_CODEC_ID_AURA, AV_CODEC_ID_AURA2, AV_CODEC_ID_V210X,
    AV_CODEC_ID_TMV, AV_CODEC_ID_V210, AV_CODEC_ID_DPX, AV_CODEC_ID_MAD,
    AV_CODEC_ID_FRWU, AV_CODEC_ID_FLASHSV2, AV_CODEC_ID_CDGRAPHICS,
    AV_CODEC_ID_R210, AV_CODEC_ID_ANM, AV_CODEC_ID_BINKVIDEO, AV_CODEC_ID_IFF_ILBM,
    AV_CODEC_ID_KGV1, AV_CODEC_ID_YOP, AV_CODEC_ID_VP8, AV_CODEC_ID_PICTOR,
    AV_CODEC_ID_ANSI, AV_CODEC_ID_A64_MULTI, AV_CODEC_ID_A64_MULTI5,
    AV_CODEC_ID_R10K, AV_CODEC_ID_MXPEG, AV_CODEC_ID_LAGARITH, AV_CODEC_ID_PRORES,
    AV_CODEC_ID_JV, AV_CODEC_ID_DFA, AV_CODEC_ID_WMV3IMAGE, AV_CODEC_ID_VC1IMAGE,
    AV_CODEC_ID_UTVIDEO, AV_CODEC_ID_BMV_VIDEO, AV_CODEC_ID_VBLE,
    AV_CODEC_ID_DXTORY, AV_CODEC_ID_V410, AV_CODEC_ID_XWD, AV_CODEC_ID_CDXL,
    AV_CODEC_ID_XBM, AV_CODEC_ID_ZEROCODEC, AV_CODEC_ID_MSS1, AV_CODEC_ID_MSA1,
    AV_CODEC_ID_TSCC2, AV_CODEC_ID_MTS2, AV_CODEC_ID_CLLC, AV_CODEC_ID_MSS2,
    AV_CODEC_ID_VP9, AV_CODEC_ID_AIC, AV_CODEC_ID_ESCAPE130, AV_CODEC_ID_G2M,
    AV_CODEC_ID_WEBP, AV_CODEC_ID_HNM4_VIDEO, AV_CODEC_ID_HEVC, AV_CODEC_ID_FIC,
    AV_CODEC_ID_ALIAS_PIX, AV_CODEC_ID_BRENDER_PIX, AV_CODEC_ID_PAF_VIDEO,
    AV_CODEC_ID_EXR, AV_CODEC_ID_VP7, AV_CODEC_ID_SANM, AV_CODEC_ID_SGIRLE,
    AV_CODEC_ID_MVC1, AV_CODEC_ID_MVC2, AV_CODEC_ID_HQX, AV_CODEC_ID_TDSC,
    AV_CODEC_ID_HQ_HQA, AV_CODEC_ID_HAP, AV_CODEC_ID_DDS, AV_CODEC_ID_DXV,
    AV_CODEC_ID_SCREENPRESSO, AV_CODEC_ID_RSCC, AV_CODEC_ID_Y41P = 0x00008000,
    AV_CODEC_ID_AVRP, AV_CODEC_ID_012V, AV_CODEC_ID_AVUI, AV_CODEC_ID_AYUV,
    AV_CODEC_ID_TARGA_Y216, AV_CODEC_ID_V308, AV_CODEC_ID_V408, AV_CODEC_ID_YUV4,
    AV_CODEC_ID_AVRN, AV_CODEC_ID_CPIA, AV_CODEC_ID_XFACE, AV_CODEC_ID_SNOW,
    AV_CODEC_ID_SMVJPEG, AV_CODEC_ID_APNG, AV_CODEC_ID_DAALA, AV_CODEC_ID_CFHD,
    AV_CODEC_ID_TRUEMOTION2RT, AV_CODEC_ID_M101, AV_CODEC_ID_MAGICYUV,
    AV_CODEC_ID_SHEERVIDEO, AV_CODEC_ID_YLC, AV_CODEC_ID_PSD, AV_CODEC_ID_PIXLET,
    AV_CODEC_ID_SPEEDHQ, AV_CODEC_ID_FMVC, AV_CODEC_ID_SCPR,
    AV_CODEC_ID_CLEARVIDEO, AV_CODEC_ID_XPM, AV_CODEC_ID_AV1,
    AV_CODEC_ID_FIRST_AUDIO = 0x00010000, AV_CODEC_ID_PCM_S16BE,
    AV_CODEC_ID_PCM_U16LE, AV_CODEC_ID_PCM_U16BE, AV_CODEC_ID_PCM_S8,
    AV_CODEC_ID_PCM_U8, AV_CODEC_ID_PCM_MULAW, AV_CODEC_ID_PCM_ALAW,
    AV_CODEC_ID_PCM_S32LE, AV_CODEC_ID_PCM_S32BE, AV_CODEC_ID_PCM_U32LE,
    AV_CODEC_ID_PCM_U32BE, AV_CODEC_ID_PCM_S24LE, AV_CODEC_ID_PCM_S24BE,
    AV_CODEC_ID_PCM_U24LE, AV_CODEC_ID_PCM_U24BE, AV_CODEC_ID_PCM_S24DAUD,
    AV_CODEC_ID_PCM_ZORK, AV_CODEC_ID_PCM_S16LE_PLANAR, AV_CODEC_ID_PCM_DVD,
    AV_CODEC_ID_PCM_F32BE, AV_CODEC_ID_PCM_F32LE, AV_CODEC_ID_PCM_F64BE,
    AV_CODEC_ID_PCM_F64LE, AV_CODEC_ID_PCM_BLURAY, AV_CODEC_ID_PCM_LXF,
    AV_CODEC_ID_S302M, AV_CODEC_ID_PCM_S8_PLANAR, AV_CODEC_ID_PCM_S24LE_PLANAR,
    AV_CODEC_ID_PCM_S32LE_PLANAR, AV_CODEC_ID_PCM_S16BE_PLANAR,
    AV_CODEC_ID_PCM_S64LE = 0x00010800, AV_CODEC_ID_PCM_S64BE,
    AV_CODEC_ID_PCM_F16LE, AV_CODEC_ID_PCM_F24LE,
    AV_CODEC_ID_ADPCM_IMA_QT = 0x00011000, AV_CODEC_ID_ADPCM_IMA_WAV,
    AV_CODEC_ID_ADPCM_IMA_DK3, AV_CODEC_ID_ADPCM_IMA_DK4,
    AV_CODEC_ID_ADPCM_IMA_WS, AV_CODEC_ID_ADPCM_IMA_SMJPEG, AV_CODEC_ID_ADPCM_MS,
    AV_CODEC_ID_ADPCM_4XM, AV_CODEC_ID_ADPCM_XA, AV_CODEC_ID_ADPCM_ADX,
    AV_CODEC_ID_ADPCM_EA, AV_CODEC_ID_ADPCM_G726, AV_CODEC_ID_ADPCM_CT,
    AV_CODEC_ID_ADPCM_SWF, AV_CODEC_ID_ADPCM_YAMAHA, AV_CODEC_ID_ADPCM_SBPRO_4,
    AV_CODEC_ID_ADPCM_SBPRO_3, AV_CODEC_ID_ADPCM_SBPRO_2, AV_CODEC_ID_ADPCM_THP,
    AV_CODEC_ID_ADPCM_IMA_AMV, AV_CODEC_ID_ADPCM_EA_R1, AV_CODEC_ID_ADPCM_EA_R3,
    AV_CODEC_ID_ADPCM_EA_R2, AV_CODEC_ID_ADPCM_IMA_EA_SEAD,
    AV_CODEC_ID_ADPCM_IMA_EA_EACS, AV_CODEC_ID_ADPCM_EA_XAS,
    AV_CODEC_ID_ADPCM_EA_MAXIS_XA, AV_CODEC_ID_ADPCM_IMA_ISS,
    AV_CODEC_ID_ADPCM_G722, AV_CODEC_ID_ADPCM_IMA_APC, AV_CODEC_ID_ADPCM_VIMA,
    AV_CODEC_ID_ADPCM_AFC = 0x00011800, AV_CODEC_ID_ADPCM_IMA_OKI,
    AV_CODEC_ID_ADPCM_DTK, AV_CODEC_ID_ADPCM_IMA_RAD, AV_CODEC_ID_ADPCM_G726LE,
    AV_CODEC_ID_ADPCM_THP_LE, AV_CODEC_ID_ADPCM_PSX, AV_CODEC_ID_ADPCM_AICA,
    AV_CODEC_ID_ADPCM_IMA_DAT4, AV_CODEC_ID_ADPCM_MTAF,
    AV_CODEC_ID_AMR_NB = 0x00012000, AV_CODEC_ID_AMR_WB,
    AV_CODEC_ID_RA_144 = 0x00013000, AV_CODEC_ID_RA_288,
    AV_CODEC_ID_ROQ_DPCM = 0x00014000, AV_CODEC_ID_INTERPLAY_DPCM,
    AV_CODEC_ID_XAN_DPCM, AV_CODEC_ID_SOL_DPCM,
    AV_CODEC_ID_SDX2_DPCM = 0x00014800, AV_CODEC_ID_MP2 = 0x00015000, AV_CODEC_ID_MP3,
    AV_CODEC_ID_AAC, AV_CODEC_ID_AC3, AV_CODEC_ID_DTS, AV_CODEC_ID_VORBIS,
    AV_CODEC_ID_DVAUDIO, AV_CODEC_ID_WMAV1, AV_CODEC_ID_WMAV2, AV_CODEC_ID_MACE3,
    AV_CODEC_ID_MACE6, AV_CODEC_ID_VMDAUDIO, AV_CODEC_ID_FLAC, AV_CODEC_ID_MP3ADU,
    AV_CODEC_ID_MP3ON4, AV_CODEC_ID_SHORTEN, AV_CODEC_ID_ALAC,
    AV_CODEC_ID_WESTWOOD_SND1, AV_CODEC_ID_GSM, AV_CODEC_ID_QDM2, AV_CODEC_ID_COOK,
    AV_CODEC_ID_TRUESPEECH, AV_CODEC_ID_TTA, AV_CODEC_ID_SMACKAUDIO,
    AV_CODEC_ID_QCELP, AV_CODEC_ID_WAVPACK, AV_CODEC_ID_DSICINAUDIO,
    AV_CODEC_ID_IMC, AV_CODEC_ID_MUSEPACK7, AV_CODEC_ID_MLP, AV_CODEC_ID_GSM_MS,
    AV_CODEC_ID_ATRAC3, AV_CODEC_ID_APE, AV_CODEC_ID_NELLYMOSER,
    AV_CODEC_ID_MUSEPACK8, AV_CODEC_ID_SPEEX, AV_CODEC_ID_WMAVOICE,
    AV_CODEC_ID_WMAPRO, AV_CODEC_ID_WMALOSSLESS, AV_CODEC_ID_ATRAC3P,
    AV_CODEC_ID_EAC3, AV_CODEC_ID_SIPR, AV_CODEC_ID_MP1, AV_CODEC_ID_TWINVQ,
    AV_CODEC_ID_TRUEHD, AV_CODEC_ID_MP4ALS, AV_CODEC_ID_ATRAC1,
    AV_CODEC_ID_BINKAUDIO_RDFT, AV_CODEC_ID_BINKAUDIO_DCT, AV_CODEC_ID_AAC_LATM,
    AV_CODEC_ID_QDMC, AV_CODEC_ID_CELT, AV_CODEC_ID_G723_1, AV_CODEC_ID_G729,
    AV_CODEC_ID_8SVX_EXP, AV_CODEC_ID_8SVX_FIB, AV_CODEC_ID_BMV_AUDIO,
    AV_CODEC_ID_RALF, AV_CODEC_ID_IAC, AV_CODEC_ID_ILBC, AV_CODEC_ID_OPUS,
    AV_CODEC_ID_COMFORT_NOISE, AV_CODEC_ID_TAK, AV_CODEC_ID_METASOUND,
    AV_CODEC_ID_PAF_AUDIO, AV_CODEC_ID_ON2AVC, AV_CODEC_ID_DSS_SP,
    AV_CODEC_ID_FFWAVESYNTH = 0x00015800, AV_CODEC_ID_SONIC, AV_CODEC_ID_SONIC_LS,
    AV_CODEC_ID_EVRC, AV_CODEC_ID_SMV, AV_CODEC_ID_DSD_LSBF, AV_CODEC_ID_DSD_MSBF,
    AV_CODEC_ID_DSD_LSBF_PLANAR, AV_CODEC_ID_DSD_MSBF_PLANAR, AV_CODEC_ID_4GV,
    AV_CODEC_ID_INTERPLAY_ACM, AV_CODEC_ID_XMA1, AV_CODEC_ID_XMA2, AV_CODEC_ID_DST,
    AV_CODEC_ID_ATRAC3AL, AV_CODEC_ID_ATRAC3PAL,
    AV_CODEC_ID_FIRST_SUBTITLE = 0x00017000, AV_CODEC_ID_DVB_SUBTITLE,
    AV_CODEC_ID_TEXT, AV_CODEC_ID_XSUB, AV_CODEC_ID_SSA, AV_CODEC_ID_MOV_TEXT,
    AV_CODEC_ID_HDMV_PGS_SUBTITLE, AV_CODEC_ID_DVB_TELETEXT, AV_CODEC_ID_SRT,
    AV_CODEC_ID_MICRODVD = 0x00017800, AV_CODEC_ID_EIA_608, AV_CODEC_ID_JACOSUB,
    AV_CODEC_ID_SAMI, AV_CODEC_ID_REALTEXT, AV_CODEC_ID_STL,
    AV_CODEC_ID_SUBVIEWER1, AV_CODEC_ID_SUBVIEWER, AV_CODEC_ID_SUBRIP,
    AV_CODEC_ID_WEBVTT, AV_CODEC_ID_MPL2, AV_CODEC_ID_VPLAYER, AV_CODEC_ID_PJS,
    AV_CODEC_ID_ASS, AV_CODEC_ID_HDMV_TEXT_SUBTITLE,
    AV_CODEC_ID_FIRST_UNKNOWN = 0x00018000, AV_CODEC_ID_SCTE_35,
    AV_CODEC_ID_BINTEXT = 0x00018800, AV_CODEC_ID_XBIN, AV_CODEC_ID_IDF,
    AV_CODEC_ID_OTF, AV_CODEC_ID_SMPTE_KLV, AV_CODEC_ID_DVD_NAV,
    AV_CODEC_ID_TIMED_ID3, AV_CODEC_ID_BIN_DATA, AV_CODEC_ID_PROBE = 0x00019000,
    AV_CODEC_ID_MPEG2TS = 0x00020000, AV_CODEC_ID_MPEG4SYSTEMS = 0x00020001,
    AV_CODEC_ID_FFMETADATA = 0x00021000, AV_CODEC_ID_WRAPPED_AVFRAME = 0x00021001

const
  AV_CODEC_ID_PCM_S16LE = AV_CODEC_ID_FIRST_AUDIO
  AV_CODEC_ID_DVD_SUBTITLE = AV_CODEC_ID_FIRST_SUBTITLE
  AV_CODEC_ID_TTF = AV_CODEC_ID_FIRST_UNKNOWN


type
  AVPacketSideDataType* {.size: sizeof(cint).} = enum
    AV_PKT_DATA_PALETTE, AV_PKT_DATA_NEW_EXTRADATA, AV_PKT_DATA_PARAM_CHANGE,
    AV_PKT_DATA_H263_MB_INFO, AV_PKT_DATA_REPLAYGAIN, AV_PKT_DATA_DISPLAYMATRIX,
    AV_PKT_DATA_STEREO3D, AV_PKT_DATA_AUDIO_SERVICE_TYPE,
    AV_PKT_DATA_QUALITY_STATS, AV_PKT_DATA_FALLBACK_TRACK,
    AV_PKT_DATA_CPB_PROPERTIES, AV_PKT_DATA_SKIP_SAMPLES = 70,
    AV_PKT_DATA_JP_DUALMONO, AV_PKT_DATA_STRINGS_METADATA,
    AV_PKT_DATA_SUBTITLE_POSITION, AV_PKT_DATA_MATROSKA_BLOCKADDITIONAL,
    AV_PKT_DATA_WEBVTT_IDENTIFIER, AV_PKT_DATA_WEBVTT_SETTINGS,
    AV_PKT_DATA_METADATA_UPDATE, AV_PKT_DATA_MPEGTS_STREAM_ID,
    AV_PKT_DATA_MASTERING_DISPLAY_METADATA, AV_PKT_DATA_SPHERICAL, AV_PKT_DATA_NB



  AVFieldOrder* {.size: sizeof(cint).} = enum
    AV_FIELD_UNKNOWN, AV_FIELD_PROGRESSIVE, AV_FIELD_TT, AV_FIELD_BB, AV_FIELD_TB,
    AV_FIELD_BT

  MpegEncContext* {.bycopy.} = object
  
  AVHWAccel* {.bycopy.} = object
    name*: cstring
    `type`*: AVMediaType
    id*: AVCodecID
    pix_fmt*: AVPixelFormat
    capabilities*: cint
    next*: ptr AVHWAccel
    alloc_frame*: proc (avctx: ptr AVCodecContext; frame: ptr AVFrame): cint {.cdecl.}
    start_frame*: proc (avctx: ptr AVCodecContext; buf: ptr uint8_t; buf_size: uint32_t): cint {.
        cdecl.}
    decode_slice*: proc (avctx: ptr AVCodecContext; buf: ptr uint8_t; buf_size: uint32_t): cint {.
        cdecl.}
    end_frame*: proc (avctx: ptr AVCodecContext): cint {.cdecl.}
    frame_priv_data_size*: cint
    decode_mb*: proc (s: ptr MpegEncContext) {.cdecl.}
    init*: proc (avctx: ptr AVCodecContext): cint {.cdecl.}
    uninit*: proc (avctx: ptr AVCodecContext): cint {.cdecl.}
    priv_data_size*: cint
    caps_internal*: cint

  AVSubtitleType* {.size: sizeof(cint).} = enum
    SUBTITLE_NONE, SUBTITLE_BITMAP, SUBTITLE_TEXT, SUBTITLE_ASS


type

  AVProfile* {.bycopy.} = object
    profile*: cint
    name*: cstring
  
type
  AVPacketSideData* {.bycopy.} = object
    data*: ptr uint8_t
    size*: cint
    `type`*: AVPacketSideDataType

  AVPacket* {.bycopy.} = object
    buf*: ptr AVBufferRef
    pts*: int64_t
    dts*: int64_t
    data*: ptr uint8_t
    size*: cint
    stream_index*: cint
    flags*: cint
    side_data*: ptr AVPacketSideData
    side_data_elems*: cint
    duration*: int64_t
    pos*: int64_t

  AVCodec* {.bycopy.} = object
    name*: cstring
    long_name*: cstring
    `type`*: AVMediaType
    id*: AVCodecID
    capabilities*: cint
    supported_framerates*: ptr AVRational
    pix_fmts*: ptr AVPixelFormat
    supported_samplerates*: ptr cint
    sample_fmts*: ptr AVSampleFormat
    channel_layouts*: ptr uint64_t
    max_lowres*: uint8_t
    priv_class*: ptr AVClass
    profiles*: ptr AVProfile
    priv_data_size*: cint
    next*: ptr AVCodec
    init_thread_copy*: proc (a2: ptr AVCodecContext): cint {.cdecl.}
    update_thread_context*: proc (dst: ptr AVCodecContext; src: ptr AVCodecContext): cint {.
        cdecl.}
    defaults*: ptr AVCodecDefault
    init_static_data*: proc (codec: ptr AVCodec) {.cdecl.}
    init*: proc (a2: ptr AVCodecContext): cint {.cdecl.}
    encode_sub*: proc (a2: ptr AVCodecContext; buf: ptr uint8_t; buf_size: cint;
                     sub: ptr AVSubtitle): cint {.cdecl.}
    encode2*: proc (avctx: ptr AVCodecContext; avpkt: ptr AVPacket; frame: ptr AVFrame;
                  got_packet_ptr: ptr cint): cint {.cdecl.}
    decode*: proc (a2: ptr AVCodecContext; outdata: pointer; outdata_size: ptr cint;
                 avpkt: ptr AVPacket): cint {.cdecl.}
    close*: proc (a2: ptr AVCodecContext): cint {.cdecl.}
    send_frame*: proc (avctx: ptr AVCodecContext; frame: ptr AVFrame): cint {.cdecl.}
    send_packet*: proc (avctx: ptr AVCodecContext; avpkt: ptr AVPacket): cint {.cdecl.}
    receive_frame*: proc (avctx: ptr AVCodecContext; frame: ptr AVFrame): cint {.cdecl.}
    receive_packet*: proc (avctx: ptr AVCodecContext; avpkt: ptr AVPacket): cint {.cdecl.}
    flush*: proc (a2: ptr AVCodecContext) {.cdecl.}
    caps_internal*: cint
  AVSubtitleRect* {.bycopy.} = object
    x*: cint
    y*: cint
    w*: cint
    h*: cint
    nb_colors*: cint
    data*: array[4, ptr uint8_t]
    linesize*: array[4, cint]
    `type`*: AVSubtitleType
    text*: cstring
    ass*: cstring
    flags*: cint

  AVSubtitle* {.bycopy.} = object
    format*: uint16_t
    start_display_time*: uint32_t
    end_display_time*: uint32_t
    num_rects*: cuint
    rects*: ptr ptr AVSubtitleRect
    pts*: int64_t

  AVCodecParameters* {.bycopy.} = object
    codec_type*: AVMediaType
    codec_id*: AVCodecID
    codec_tag*: uint32_t
    extradata*: ptr uint8_t
    extradata_size*: cint
    format*: cint
    bit_rate*: int64_t
    bits_per_coded_sample*: cint
    bits_per_raw_sample*: cint
    profile*: cint
    level*: cint
    width*: cint
    height*: cint
    sample_aspect_ratio*: AVRational
    field_order*: AVFieldOrder
    color_range*: AVColorRange
    color_primaries*: AVColorPrimaries
    color_trc*: AVColorTransferCharacteristic
    color_space*: AVColorSpace
    chroma_location*: AVChromaLocation
    video_delay*: cint
    channel_layout*: uint64_t
    channels*: cint
    sample_rate*: cint
    block_align*: cint
    frame_size*: cint
    initial_padding*: cint
    trailing_padding*: cint
    seek_preroll*: cint

type
  AVCodecDescriptor* {.bycopy.} = object
    id*: AVCodecID
    `type`*: AVMediaType
    name*: cstring
    long_name*: cstring
    props*: cint
    mime_types*: cstringArray
    profiles*: ptr AVProfile

  AVDiscard* {.size: sizeof(cint).} = enum
    AVDISCARD_NONE = - 16, AVDISCARD_DEFAULT = 0, AVDISCARD_NONREF = 8,
    AVDISCARD_BIDIR = 16, AVDISCARD_NONINTRA = 24, AVDISCARD_NONKEY = 32,
    AVDISCARD_ALL = 48


type
  AVAudioServiceType* {.size: sizeof(cint).} = enum
    AV_AUDIO_SERVICE_TYPE_MAIN = 0, AV_AUDIO_SERVICE_TYPE_EFFECTS = 1,
    AV_AUDIO_SERVICE_TYPE_VISUALLY_IMPAIRED = 2,
    AV_AUDIO_SERVICE_TYPE_HEARING_IMPAIRED = 3, AV_AUDIO_SERVICE_TYPE_DIALOGUE = 4,
    AV_AUDIO_SERVICE_TYPE_COMMENTARY = 5, AV_AUDIO_SERVICE_TYPE_EMERGENCY = 6,
    AV_AUDIO_SERVICE_TYPE_VOICE_OVER = 7, AV_AUDIO_SERVICE_TYPE_KARAOKE = 8,
    AV_AUDIO_SERVICE_TYPE_NB


type
  RcOverride* {.bycopy.} = object
    start_frame*: cint
    end_frame*: cint
    qscale*: cint
    quality_factor*: cfloat

  AVPanScan* {.bycopy.} = object
    id*: cint
    width*: cint
    height*: cint
    position*: array[3, array[2, int16_t]]

  AVCPBProperties* {.bycopy.} = object
    max_bitrate*: cint
    min_bitrate*: cint
    avg_bitrate*: cint
    buffer_size*: cint
    vbv_delay*: uint64_t



  AVSideDataParamChangeFlags* {.size: sizeof(cint).} = enum
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_COUNT = 0x00000001,
    AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_LAYOUT = 0x00000002,
    AV_SIDE_DATA_PARAM_CHANGE_SAMPLE_RATE = 0x00000004,
    AV_SIDE_DATA_PARAM_CHANGE_DIMENSIONS = 0x00000008


type
  AVCodecInternal* {.bycopy.} = object
  



type
  AVCodecContext* {.bycopy.} = object
    av_class*: ptr AVClass
    log_level_offset*: cint
    codec_type*: AVMediaType
    codec*: ptr AVCodec
    codec_id*: AVCodecID
    codec_tag*: cuint
    priv_data*: pointer
    internal*: ptr AVCodecInternal
    opaque*: pointer
    bit_rate*: int64_t
    bit_rate_tolerance*: cint
    global_quality*: cint
    compression_level*: cint
    flags*: cint
    flags2*: cint
    extradata*: ptr uint8_t
    extradata_size*: cint
    time_base*: AVRational
    ticks_per_frame*: cint
    delay*: cint
    width*: cint
    height*: cint
    coded_width*: cint
    coded_height*: cint
    gop_size*: cint
    pix_fmt*: AVPixelFormat
    draw_horiz_band*: proc (s: ptr AVCodecContext; src: ptr AVFrame;
                          offset: array[AV_NUM_DATA_POINTERS, cint]; y: cint;
                          `type`: cint; height: cint) {.cdecl.}
    get_format*: proc (s: ptr AVCodecContext; fmt: ptr AVPixelFormat): AVPixelFormat {.
        cdecl.}
    max_b_frames*: cint
    b_quant_factor*: cfloat
    b_quant_offset*: cfloat
    has_b_frames*: cint
    i_quant_factor*: cfloat
    i_quant_offset*: cfloat
    lumi_masking*: cfloat
    temporal_cplx_masking*: cfloat
    spatial_cplx_masking*: cfloat
    p_masking*: cfloat
    dark_masking*: cfloat
    slice_count*: cint
    slice_offset*: ptr cint
    sample_aspect_ratio*: AVRational
    me_cmp*: cint
    me_sub_cmp*: cint
    mb_cmp*: cint
    ildct_cmp*: cint
    dia_size*: cint
    last_predictor_count*: cint
    me_pre_cmp*: cint
    pre_dia_size*: cint
    me_subpel_quality*: cint
    me_range*: cint
    slice_flags*: cint
    mb_decision*: cint
    intra_matrix*: ptr uint16_t
    inter_matrix*: ptr uint16_t
    intra_dc_precision*: cint
    skip_top*: cint
    skip_bottom*: cint
    mb_lmin*: cint
    mb_lmax*: cint
    bidir_refine*: cint
    keyint_min*: cint
    refs*: cint
    mv0_threshold*: cint
    color_primaries*: AVColorPrimaries
    color_trc*: AVColorTransferCharacteristic
    colorspace*: AVColorSpace
    color_range*: AVColorRange
    chroma_sample_location*: AVChromaLocation
    slices*: cint
    field_order*: AVFieldOrder
    sample_rate*: cint
    channels*: cint
    sample_fmt*: AVSampleFormat
    frame_size*: cint
    frame_number*: cint
    block_align*: cint
    cutoff*: cint
    channel_layout*: uint64_t
    request_channel_layout*: uint64_t
    audio_service_type*: AVAudioServiceType
    request_sample_fmt*: AVSampleFormat
    get_buffer2*: proc (s: ptr AVCodecContext; frame: ptr AVFrame; flags: cint): cint {.
        cdecl.}
    refcounted_frames*: cint
    qcompress*: cfloat
    qblur*: cfloat
    qmin*: cint
    qmax*: cint
    max_qdiff*: cint
    rc_buffer_size*: cint
    rc_override_count*: cint
    rc_override*: ptr RcOverride
    rc_max_rate*: int64_t
    rc_min_rate*: int64_t
    rc_max_available_vbv_use*: cfloat
    rc_min_vbv_overflow_use*: cfloat
    rc_initial_buffer_occupancy*: cint
    trellis*: cint
    stats_out*: cstring
    stats_in*: cstring
    workaround_bugs*: cint
    strict_std_compliance*: cint
    error_concealment*: cint
    debug*: cint
    err_recognition*: cint
    reordered_opaque*: int64_t
    hwaccel*: ptr AVHWAccel
    hwaccel_context*: pointer
    error*: array[AV_NUM_DATA_POINTERS, uint64_t]
    dct_algo*: cint
    idct_algo*: cint
    bits_per_coded_sample*: cint
    bits_per_raw_sample*: cint
    thread_count*: cint
    thread_type*: cint
    active_thread_type*: cint
    thread_safe_callbacks*: cint
    execute*: proc (c: ptr AVCodecContext; `func`: proc (c2: ptr AVCodecContext;
        arg: pointer): cint {.cdecl.}; arg2: pointer; ret: ptr cint; count: cint;
                  size: cint): cint {.cdecl.}
    execute2*: proc (c: ptr AVCodecContext; `func`: proc (c2: ptr AVCodecContext;
        arg: pointer; jobnr: cint; threadnr: cint): cint {.cdecl.}; arg2: pointer;
                   ret: ptr cint; count: cint): cint {.cdecl.}
    nsse_weight*: cint
    profile*: cint
    level*: cint
    skip_loop_filter*: AVDiscard
    skip_idct*: AVDiscard
    skip_frame*: AVDiscard
    subtitle_header*: ptr uint8_t
    subtitle_header_size*: cint
    initial_padding*: cint
    framerate*: AVRational
    sw_pix_fmt*: AVPixelFormat
    pkt_timebase*: AVRational
    codec_descriptor*: ptr AVCodecDescriptor
    lowres*: cint
    pts_correction_num_faulty_pts*: int64_t
    pts_correction_num_faulty_dts*: int64_t
    pts_correction_last_pts*: int64_t
    pts_correction_last_dts*: int64_t
    sub_charenc*: cstring
    sub_charenc_mode*: cint
    skip_alpha*: cint
    seek_preroll*: cint
    debug_mv*: cint
    chroma_intra_matrix*: ptr uint16_t
    dump_separator*: ptr uint8_t
    codec_whitelist*: cstring
    properties*: cuint
    coded_side_data*: ptr AVPacketSideData
    nb_coded_side_data*: cint
    hw_frames_ctx*: ptr AVBufferRef
    sub_text_format*: cint
    trailing_padding*: cint
    max_pixels*: int64_t
    hw_device_ctx*: ptr AVBufferRef
    hwaccel_flags*: cint


proc av_codec_get_pkt_timebase*(avctx: ptr AVCodecContext): AVRational {.cdecl,
    importc: "av_codec_get_pkt_timebase", dynlib: avcodecdll.}
proc av_codec_set_pkt_timebase*(avctx: ptr AVCodecContext; val: AVRational) {.cdecl,
    importc: "av_codec_set_pkt_timebase", dynlib: avcodecdll.}
proc av_codec_get_codec_descriptor*(avctx: ptr AVCodecContext): ptr AVCodecDescriptor {.
    cdecl, importc: "av_codec_get_codec_descriptor", dynlib: avcodecdll.}
proc av_codec_set_codec_descriptor*(avctx: ptr AVCodecContext;
                                   desc: ptr AVCodecDescriptor) {.cdecl,
    importc: "av_codec_set_codec_descriptor", dynlib: avcodecdll.}
proc av_codec_get_codec_properties*(avctx: ptr AVCodecContext): cuint {.cdecl,
    importc: "av_codec_get_codec_properties", dynlib: avcodecdll.}
proc av_codec_get_lowres*(avctx: ptr AVCodecContext): cint {.cdecl,
    importc: "av_codec_get_lowres", dynlib: avcodecdll.}
proc av_codec_set_lowres*(avctx: ptr AVCodecContext; val: cint) {.cdecl,
    importc: "av_codec_set_lowres", dynlib: avcodecdll.}
proc av_codec_get_seek_preroll*(avctx: ptr AVCodecContext): cint {.cdecl,
    importc: "av_codec_get_seek_preroll", dynlib: avcodecdll.}
proc av_codec_set_seek_preroll*(avctx: ptr AVCodecContext; val: cint) {.cdecl,
    importc: "av_codec_set_seek_preroll", dynlib: avcodecdll.}
proc av_codec_get_chroma_intra_matrix*(avctx: ptr AVCodecContext): ptr uint16_t {.
    cdecl, importc: "av_codec_get_chroma_intra_matrix", dynlib: avcodecdll.}
proc av_codec_set_chroma_intra_matrix*(avctx: ptr AVCodecContext; val: ptr uint16_t) {.
    cdecl, importc: "av_codec_set_chroma_intra_matrix", dynlib: avcodecdll.}


proc av_codec_get_max_lowres*(codec: ptr AVCodec): cint {.cdecl,
    importc: "av_codec_get_max_lowres", dynlib: avcodecdll.}


proc av_codec_next*(c: ptr AVCodec): ptr AVCodec {.cdecl, importc: "av_codec_next",
    dynlib: avcodecdll.}
proc avcodec_version*(): cuint {.cdecl, importc: "avcodec_version", dynlib: avcodecdll.}
proc avcodec_configuration*(): cstring {.cdecl, importc: "avcodec_configuration",
                                      dynlib: avcodecdll.}
proc avcodec_license*(): cstring {.cdecl, importc: "avcodec_license",
                                dynlib: avcodecdll.}
proc avcodec_register*(codec: ptr AVCodec) {.cdecl, importc: "avcodec_register",
    dynlib: avcodecdll.}
proc avcodec_register_all*() {.cdecl, importc: "avcodec_register_all",
                             dynlib: avcodecdll.}
proc avcodec_alloc_context3*(codec: ptr AVCodec): ptr AVCodecContext {.cdecl,
    importc: "avcodec_alloc_context3", dynlib: avcodecdll.}
proc avcodec_free_context*(avctx: ptr ptr AVCodecContext) {.cdecl,
    importc: "avcodec_free_context", dynlib: avcodecdll.}
proc avcodec_get_class*(): ptr AVClass {.cdecl, importc: "avcodec_get_class",
                                     dynlib: avcodecdll.}
proc avcodec_parameters_alloc*(): ptr AVCodecParameters {.cdecl,
    importc: "avcodec_parameters_alloc", dynlib: avcodecdll.}
proc avcodec_parameters_free*(par: ptr ptr AVCodecParameters) {.cdecl,
    importc: "avcodec_parameters_free", dynlib: avcodecdll.}
proc avcodec_parameters_copy*(dst: ptr AVCodecParameters; src: ptr AVCodecParameters): cint {.
    cdecl, importc: "avcodec_parameters_copy", dynlib: avcodecdll.}
proc avcodec_parameters_from_context*(par: ptr AVCodecParameters;
                                     codec: ptr AVCodecContext): cint {.cdecl,
    importc: "avcodec_parameters_from_context", dynlib: avcodecdll.}
proc avcodec_parameters_to_context*(codec: ptr AVCodecContext;
                                   par: ptr AVCodecParameters): cint {.cdecl,
    importc: "avcodec_parameters_to_context", dynlib: avcodecdll.}
proc avcodec_open2*(avctx: ptr AVCodecContext; codec: ptr AVCodec;
                   options: ptr ptr AVDictionary): cint {.cdecl,
    importc: "avcodec_open2", dynlib: avcodecdll.}
proc avcodec_close*(avctx: ptr AVCodecContext): cint {.cdecl,
    importc: "avcodec_close", dynlib: avcodecdll.}
proc avsubtitle_free*(sub: ptr AVSubtitle) {.cdecl, importc: "avsubtitle_free",
    dynlib: avcodecdll.}
proc av_packet_alloc*(): ptr AVPacket {.cdecl, importc: "av_packet_alloc",
                                    dynlib: avcodecdll.}
proc av_packet_clone*(src: ptr AVPacket): ptr AVPacket {.cdecl,
    importc: "av_packet_clone", dynlib: avcodecdll.}
proc av_packet_free*(pkt: ptr ptr AVPacket) {.cdecl, importc: "av_packet_free",
    dynlib: avcodecdll.}
proc av_init_packet*(pkt: ptr AVPacket) {.cdecl, importc: "av_init_packet",
                                      dynlib: avcodecdll.}
proc av_new_packet*(pkt: ptr AVPacket; size: cint): cint {.cdecl,
    importc: "av_new_packet", dynlib: avcodecdll.}
proc av_shrink_packet*(pkt: ptr AVPacket; size: cint) {.cdecl,
    importc: "av_shrink_packet", dynlib: avcodecdll.}
proc av_grow_packet*(pkt: ptr AVPacket; grow_by: cint): cint {.cdecl,
    importc: "av_grow_packet", dynlib: avcodecdll.}
proc av_packet_from_data*(pkt: ptr AVPacket; data: ptr uint8_t; size: cint): cint {.cdecl,
    importc: "av_packet_from_data", dynlib: avcodecdll.}
proc av_packet_new_side_data*(pkt: ptr AVPacket; `type`: AVPacketSideDataType;
                             size: cint): ptr uint8_t {.cdecl,
    importc: "av_packet_new_side_data", dynlib: avcodecdll.}
proc av_packet_add_side_data*(pkt: ptr AVPacket; `type`: AVPacketSideDataType;
                             data: ptr uint8_t; size: csize): cint {.cdecl,
    importc: "av_packet_add_side_data", dynlib: avcodecdll.}
proc av_packet_shrink_side_data*(pkt: ptr AVPacket; `type`: AVPacketSideDataType;
                                size: cint): cint {.cdecl,
    importc: "av_packet_shrink_side_data", dynlib: avcodecdll.}
proc av_packet_get_side_data*(pkt: ptr AVPacket; `type`: AVPacketSideDataType;
                             size: ptr cint): ptr uint8_t {.cdecl,
    importc: "av_packet_get_side_data", dynlib: avcodecdll.}
proc av_packet_side_data_name*(`type`: AVPacketSideDataType): cstring {.cdecl,
    importc: "av_packet_side_data_name", dynlib: avcodecdll.}
proc av_packet_pack_dictionary*(dict: ptr AVDictionary; size: ptr cint): ptr uint8_t {.
    cdecl, importc: "av_packet_pack_dictionary", dynlib: avcodecdll.}
proc av_packet_unpack_dictionary*(data: ptr uint8_t; size: cint;
                                 dict: ptr ptr AVDictionary): cint {.cdecl,
    importc: "av_packet_unpack_dictionary", dynlib: avcodecdll.}
proc av_packet_free_side_data*(pkt: ptr AVPacket) {.cdecl,
    importc: "av_packet_free_side_data", dynlib: avcodecdll.}
proc av_packet_ref*(dst: ptr AVPacket; src: ptr AVPacket): cint {.cdecl,
    importc: "av_packet_ref", dynlib: avcodecdll.}
proc av_packet_unref*(pkt: ptr AVPacket) {.cdecl, importc: "av_packet_unref",
                                       dynlib: avcodecdll.}
proc av_packet_move_ref*(dst: ptr AVPacket; src: ptr AVPacket) {.cdecl,
    importc: "av_packet_move_ref", dynlib: avcodecdll.}
proc av_packet_copy_props*(dst: ptr AVPacket; src: ptr AVPacket): cint {.cdecl,
    importc: "av_packet_copy_props", dynlib: avcodecdll.}
proc av_packet_rescale_ts*(pkt: ptr AVPacket; tb_src: AVRational; tb_dst: AVRational) {.
    cdecl, importc: "av_packet_rescale_ts", dynlib: avcodecdll.}
proc avcodec_find_decoder*(id: AVCodecID): ptr AVCodec {.cdecl,
    importc: "avcodec_find_decoder", dynlib: avcodecdll.}
proc avcodec_find_decoder_by_name*(name: cstring): ptr AVCodec {.cdecl,
    importc: "avcodec_find_decoder_by_name", dynlib: avcodecdll.}
proc avcodec_default_get_buffer2*(s: ptr AVCodecContext; frame: ptr AVFrame;
                                 flags: cint): cint {.cdecl,
    importc: "avcodec_default_get_buffer2", dynlib: avcodecdll.}
proc avcodec_align_dimensions*(s: ptr AVCodecContext; width: ptr cint; height: ptr cint) {.
    cdecl, importc: "avcodec_align_dimensions", dynlib: avcodecdll.}
proc avcodec_align_dimensions2*(s: ptr AVCodecContext; width: ptr cint;
                               height: ptr cint; linesize_align: array[
    AV_NUM_DATA_POINTERS, cint]) {.cdecl, importc: "avcodec_align_dimensions2",
                                 dynlib: avcodecdll.}
proc avcodec_enum_to_chroma_pos*(xpos: ptr cint; ypos: ptr cint; pos: AVChromaLocation): cint {.
    cdecl, importc: "avcodec_enum_to_chroma_pos", dynlib: avcodecdll.}
proc avcodec_chroma_pos_to_enum*(xpos: cint; ypos: cint): AVChromaLocation {.cdecl,
    importc: "avcodec_chroma_pos_to_enum", dynlib: avcodecdll.}
proc avcodec_decode_audio4*(avctx: ptr AVCodecContext; frame: ptr AVFrame;
                           got_frame_ptr: ptr cint; avpkt: ptr AVPacket): cint {.cdecl,
    importc: "avcodec_decode_audio4", dynlib: avcodecdll.}
proc avcodec_decode_video2*(avctx: ptr AVCodecContext; picture: ptr AVFrame;
                           got_picture_ptr: ptr cint; avpkt: ptr AVPacket): cint {.
    cdecl, importc: "avcodec_decode_video2", dynlib: avcodecdll.}
proc avcodec_decode_subtitle2*(avctx: ptr AVCodecContext; sub: ptr AVSubtitle;
                              got_sub_ptr: ptr cint; avpkt: ptr AVPacket): cint {.
    cdecl, importc: "avcodec_decode_subtitle2", dynlib: avcodecdll.}
proc avcodec_send_packet*(avctx: ptr AVCodecContext; avpkt: ptr AVPacket): cint {.cdecl,
    importc: "avcodec_send_packet", dynlib: avcodecdll.}
proc avcodec_receive_frame*(avctx: ptr AVCodecContext; frame: ptr AVFrame): cint {.
    cdecl, importc: "avcodec_receive_frame", dynlib: avcodecdll.}
proc avcodec_send_frame*(avctx: ptr AVCodecContext; frame: ptr AVFrame): cint {.cdecl,
    importc: "avcodec_send_frame", dynlib: avcodecdll.}
proc avcodec_receive_packet*(avctx: ptr AVCodecContext; avpkt: ptr AVPacket): cint {.
    cdecl, importc: "avcodec_receive_packet", dynlib: avcodecdll.}
type
  AVPictureStructure* {.size: sizeof(cint).} = enum
    AV_PICTURE_STRUCTURE_UNKNOWN, AV_PICTURE_STRUCTURE_TOP_FIELD,
    AV_PICTURE_STRUCTURE_BOTTOM_FIELD, AV_PICTURE_STRUCTURE_FRAME


type
  AVCodecParserContext* {.bycopy.} = object
    priv_data*: pointer
    parser*: ptr AVCodecParser
    frame_offset*: int64_t
    cur_offset*: int64_t
    next_frame_offset*: int64_t
    pict_type*: cint
    repeat_pict*: cint
    pts*: int64_t
    dts*: int64_t
    last_pts*: int64_t
    last_dts*: int64_t
    fetch_timestamp*: cint
    cur_frame_start_index*: cint
    cur_frame_offset*: array[4, int64_t]
    cur_frame_pts*: array[4, int64_t]
    cur_frame_dts*: array[4, int64_t]
    flags*: cint
    offset*: int64_t
    cur_frame_end*: array[4, int64_t]
    key_frame*: cint
    dts_sync_point*: cint
    dts_ref_dts_delta*: cint
    pts_dts_delta*: cint
    cur_frame_pos*: array[4, int64_t]
    pos*: int64_t
    last_pos*: int64_t
    duration*: cint
    field_order*: AVFieldOrder
    picture_structure*: AVPictureStructure
    output_picture_number*: cint
    width*: cint
    height*: cint
    coded_width*: cint
    coded_height*: cint
    format*: cint

  AVCodecParser* {.bycopy.} = object
    codec_ids*: array[5, cint]
    priv_data_size*: cint
    parser_init*: proc (s: ptr AVCodecParserContext): cint {.cdecl.}
    parser_parse*: proc (s: ptr AVCodecParserContext; avctx: ptr AVCodecContext;
                       poutbuf: ptr ptr uint8_t; poutbuf_size: ptr cint;
                       buf: ptr uint8_t; buf_size: cint): cint {.cdecl.}
    parser_close*: proc (s: ptr AVCodecParserContext) {.cdecl.}
    split*: proc (avctx: ptr AVCodecContext; buf: ptr uint8_t; buf_size: cint): cint {.
        cdecl.}
    next*: ptr AVCodecParser


proc av_parser_next*(c: ptr AVCodecParser): ptr AVCodecParser {.cdecl,
    importc: "av_parser_next", dynlib: avcodecdll.}
proc av_register_codec_parser*(parser: ptr AVCodecParser) {.cdecl,
    importc: "av_register_codec_parser", dynlib: avcodecdll.}
proc av_parser_init*(codec_id: cint): ptr AVCodecParserContext {.cdecl,
    importc: "av_parser_init", dynlib: avcodecdll.}
proc av_parser_parse2*(s: ptr AVCodecParserContext; avctx: ptr AVCodecContext;
                      poutbuf: ptr ptr uint8_t; poutbuf_size: ptr cint;
                      buf: ptr uint8_t; buf_size: cint; pts: int64_t; dts: int64_t;
                      pos: int64_t): cint {.cdecl, importc: "av_parser_parse2",
    dynlib: avcodecdll.}
proc av_parser_change*(s: ptr AVCodecParserContext; avctx: ptr AVCodecContext;
                      poutbuf: ptr ptr uint8_t; poutbuf_size: ptr cint;
                      buf: ptr uint8_t; buf_size: cint; keyframe: cint): cint {.cdecl,
    importc: "av_parser_change", dynlib: avcodecdll.}
proc av_parser_close*(s: ptr AVCodecParserContext) {.cdecl,
    importc: "av_parser_close", dynlib: avcodecdll.}
proc avcodec_find_encoder*(id: AVCodecID): ptr AVCodec {.cdecl,
    importc: "avcodec_find_encoder", dynlib: avcodecdll.}
proc avcodec_find_encoder_by_name*(name: cstring): ptr AVCodec {.cdecl,
    importc: "avcodec_find_encoder_by_name", dynlib: avcodecdll.}
proc avcodec_encode_audio2*(avctx: ptr AVCodecContext; avpkt: ptr AVPacket;
                           frame: ptr AVFrame; got_packet_ptr: ptr cint): cint {.cdecl,
    importc: "avcodec_encode_audio2", dynlib: avcodecdll.}
proc avcodec_encode_video2*(avctx: ptr AVCodecContext; avpkt: ptr AVPacket;
                           frame: ptr AVFrame; got_packet_ptr: ptr cint): cint {.cdecl,
    importc: "avcodec_encode_video2", dynlib: avcodecdll.}
proc avcodec_encode_subtitle*(avctx: ptr AVCodecContext; buf: ptr uint8_t;
                             buf_size: cint; sub: ptr AVSubtitle): cint {.cdecl,
    importc: "avcodec_encode_subtitle", dynlib: avcodecdll.}
proc avcodec_get_chroma_sub_sample*(pix_fmt: AVPixelFormat; h_shift: ptr cint;
                                   v_shift: ptr cint) {.cdecl,
    importc: "avcodec_get_chroma_sub_sample", dynlib: avcodecdll.}
proc avcodec_pix_fmt_to_codec_tag*(pix_fmt: AVPixelFormat): cuint {.cdecl,
    importc: "avcodec_pix_fmt_to_codec_tag", dynlib: avcodecdll.}
proc avcodec_get_pix_fmt_loss*(dst_pix_fmt: AVPixelFormat;
                              src_pix_fmt: AVPixelFormat; has_alpha: cint): cint {.
    cdecl, importc: "avcodec_get_pix_fmt_loss", dynlib: avcodecdll.}
proc avcodec_find_best_pix_fmt_of_list*(pix_fmt_list: ptr AVPixelFormat;
                                       src_pix_fmt: AVPixelFormat;
                                       has_alpha: cint; loss_ptr: ptr cint): AVPixelFormat {.
    cdecl, importc: "avcodec_find_best_pix_fmt_of_list", dynlib: avcodecdll.}
proc avcodec_find_best_pix_fmt_of_2*(dst_pix_fmt1: AVPixelFormat;
                                    dst_pix_fmt2: AVPixelFormat;
                                    src_pix_fmt: AVPixelFormat; has_alpha: cint;
                                    loss_ptr: ptr cint): AVPixelFormat {.cdecl,
    importc: "avcodec_find_best_pix_fmt_of_2", dynlib: avcodecdll.}
proc avcodec_find_best_pix_fmt2*(dst_pix_fmt1: AVPixelFormat;
                                dst_pix_fmt2: AVPixelFormat;
                                src_pix_fmt: AVPixelFormat; has_alpha: cint;
                                loss_ptr: ptr cint): AVPixelFormat {.cdecl,
    importc: "avcodec_find_best_pix_fmt2", dynlib: avcodecdll.}
proc avcodec_default_get_format*(s: ptr AVCodecContext; fmt: ptr AVPixelFormat): AVPixelFormat {.
    cdecl, importc: "avcodec_default_get_format", dynlib: avcodecdll.}
proc avcodec_string*(buf: cstring; buf_size: cint; enc: ptr AVCodecContext; encode: cint) {.
    cdecl, importc: "avcodec_string", dynlib: avcodecdll.}
proc av_get_profile_name*(codec: ptr AVCodec; profile: cint): cstring {.cdecl,
    importc: "av_get_profile_name", dynlib: avcodecdll.}
proc avcodec_profile_name*(codec_id: AVCodecID; profile: cint): cstring {.cdecl,
    importc: "avcodec_profile_name", dynlib: avcodecdll.}
proc avcodec_default_execute*(c: ptr AVCodecContext; `func`: proc (
    c2: ptr AVCodecContext; arg2: pointer): cint {.cdecl.}; arg: pointer; ret: ptr cint;
                             count: cint; size: cint): cint {.cdecl,
    importc: "avcodec_default_execute", dynlib: avcodecdll.}
proc avcodec_default_execute2*(c: ptr AVCodecContext; `func`: proc (
    c2: ptr AVCodecContext; arg2: pointer; a4: cint; a5: cint): cint {.cdecl.};
                              arg: pointer; ret: ptr cint; count: cint): cint {.cdecl,
    importc: "avcodec_default_execute2", dynlib: avcodecdll.}

proc avcodec_fill_audio_frame*(frame: ptr AVFrame; nb_channels: cint;
                              sample_fmt: AVSampleFormat; buf: ptr uint8_t;
                              buf_size: cint; align: cint): cint {.cdecl,
    importc: "avcodec_fill_audio_frame", dynlib: avcodecdll.}
proc avcodec_flush_buffers*(avctx: ptr AVCodecContext) {.cdecl,
    importc: "avcodec_flush_buffers", dynlib: avcodecdll.}
proc av_get_bits_per_sample*(codec_id: AVCodecID): cint {.cdecl,
    importc: "av_get_bits_per_sample", dynlib: avcodecdll.}
proc av_get_pcm_codec*(fmt: AVSampleFormat; be: cint): AVCodecID {.cdecl,
    importc: "av_get_pcm_codec", dynlib: avcodecdll.}
proc av_get_exact_bits_per_sample*(codec_id: AVCodecID): cint {.cdecl,
    importc: "av_get_exact_bits_per_sample", dynlib: avcodecdll.}
proc av_get_audio_frame_duration*(avctx: ptr AVCodecContext; frame_bytes: cint): cint {.
    cdecl, importc: "av_get_audio_frame_duration", dynlib: avcodecdll.}
proc av_get_audio_frame_duration2*(par: ptr AVCodecParameters; frame_bytes: cint): cint {.
    cdecl, importc: "av_get_audio_frame_duration2", dynlib: avcodecdll.}
type
  AVBSFContext* {.bycopy.} = object
    av_class*: ptr AVClass
    filter*: ptr AVBitStreamFilter
    internal*: ptr AVBSFInternal
    priv_data*: pointer
    par_in*: ptr AVCodecParameters
    par_out*: ptr AVCodecParameters
    time_base_in*: AVRational
    time_base_out*: AVRational

  AVBitStreamFilter* {.bycopy.} = object
    name*: cstring
    codec_ids*: ptr AVCodecID
    priv_class*: ptr AVClass
    priv_data_size*: cint
    init*: proc (ctx: ptr AVBSFContext): cint {.cdecl.}
    filter*: proc (ctx: ptr AVBSFContext; pkt: ptr AVPacket): cint {.cdecl.}
    close*: proc (ctx: ptr AVBSFContext) {.cdecl.}


proc av_bsf_get_by_name*(name: cstring): ptr AVBitStreamFilter {.cdecl,
    importc: "av_bsf_get_by_name", dynlib: avcodecdll.}
proc av_bsf_next*(opaque: ptr pointer): ptr AVBitStreamFilter {.cdecl,
    importc: "av_bsf_next", dynlib: avcodecdll.}
proc av_bsf_alloc*(filter: ptr AVBitStreamFilter; ctx: ptr ptr AVBSFContext): cint {.
    cdecl, importc: "av_bsf_alloc", dynlib: avcodecdll.}
proc av_bsf_init*(ctx: ptr AVBSFContext): cint {.cdecl, importc: "av_bsf_init",
    dynlib: avcodecdll.}
proc av_bsf_send_packet*(ctx: ptr AVBSFContext; pkt: ptr AVPacket): cint {.cdecl,
    importc: "av_bsf_send_packet", dynlib: avcodecdll.}
proc av_bsf_receive_packet*(ctx: ptr AVBSFContext; pkt: ptr AVPacket): cint {.cdecl,
    importc: "av_bsf_receive_packet", dynlib: avcodecdll.}
proc av_bsf_free*(ctx: ptr ptr AVBSFContext) {.cdecl, importc: "av_bsf_free",
    dynlib: avcodecdll.}
proc av_bsf_get_class*(): ptr AVClass {.cdecl, importc: "av_bsf_get_class",
                                    dynlib: avcodecdll.}

proc av_bsf_list_alloc*(): ptr AVBSFList {.cdecl, importc: "av_bsf_list_alloc",
                                       dynlib: avcodecdll.}
proc av_bsf_list_free*(lst: ptr ptr AVBSFList) {.cdecl, importc: "av_bsf_list_free",
    dynlib: avcodecdll.}
proc av_bsf_list_append*(lst: ptr AVBSFList; bsf: ptr AVBSFContext): cint {.cdecl,
    importc: "av_bsf_list_append", dynlib: avcodecdll.}
proc av_bsf_list_append2*(lst: ptr AVBSFList; bsf_name: cstring;
                         options: ptr ptr AVDictionary): cint {.cdecl,
    importc: "av_bsf_list_append2", dynlib: avcodecdll.}
proc av_bsf_list_finalize*(lst: ptr ptr AVBSFList; bsf: ptr ptr AVBSFContext): cint {.
    cdecl, importc: "av_bsf_list_finalize", dynlib: avcodecdll.}
proc av_bsf_list_parse_str*(str: cstring; bsf: ptr ptr AVBSFContext): cint {.cdecl,
    importc: "av_bsf_list_parse_str", dynlib: avcodecdll.}
proc av_bsf_get_null_filter*(bsf: ptr ptr AVBSFContext): cint {.cdecl,
    importc: "av_bsf_get_null_filter", dynlib: avcodecdll.}
proc av_fast_padded_malloc*(`ptr`: pointer; size: ptr cuint; min_size: csize) {.cdecl,
    importc: "av_fast_padded_malloc", dynlib: avcodecdll.}
proc av_fast_padded_mallocz*(`ptr`: pointer; size: ptr cuint; min_size: csize) {.cdecl,
    importc: "av_fast_padded_mallocz", dynlib: avcodecdll.}
proc av_xiphlacing*(s: ptr cuchar; v: cuint): cuint {.cdecl, importc: "av_xiphlacing",
    dynlib: avcodecdll.}
proc av_register_hwaccel*(hwaccel: ptr AVHWAccel) {.cdecl,
    importc: "av_register_hwaccel", dynlib: avcodecdll.}
proc av_hwaccel_next*(hwaccel: ptr AVHWAccel): ptr AVHWAccel {.cdecl,
    importc: "av_hwaccel_next", dynlib: avcodecdll.}
type
  AVLockOp* {.size: sizeof(cint).} = enum
    AV_LOCK_CREATE, AV_LOCK_OBTAIN, AV_LOCK_RELEASE, AV_LOCK_DESTROY


proc av_lockmgr_register*(cb: proc (mutex: ptr pointer; op: AVLockOp): cint {.cdecl.}): cint {.
    cdecl, importc: "av_lockmgr_register", dynlib: avcodecdll.}
proc avcodec_get_type*(codec_id: AVCodecID): AVMediaType {.cdecl,
    importc: "avcodec_get_type", dynlib: avcodecdll.}
proc avcodec_get_name*(id: AVCodecID): cstring {.cdecl, importc: "avcodec_get_name",
    dynlib: avcodecdll.}
proc avcodec_is_open*(s: ptr AVCodecContext): cint {.cdecl,
    importc: "avcodec_is_open", dynlib: avcodecdll.}
proc av_codec_is_encoder*(codec: ptr AVCodec): cint {.cdecl,
    importc: "av_codec_is_encoder", dynlib: avcodecdll.}
proc av_codec_is_decoder*(codec: ptr AVCodec): cint {.cdecl,
    importc: "av_codec_is_decoder", dynlib: avcodecdll.}
proc avcodec_descriptor_get*(id: AVCodecID): ptr AVCodecDescriptor {.cdecl,
    importc: "avcodec_descriptor_get", dynlib: avcodecdll.}
proc avcodec_descriptor_next*(prev: ptr AVCodecDescriptor): ptr AVCodecDescriptor {.
    cdecl, importc: "avcodec_descriptor_next", dynlib: avcodecdll.}
proc avcodec_descriptor_get_by_name*(name: cstring): ptr AVCodecDescriptor {.cdecl,
    importc: "avcodec_descriptor_get_by_name", dynlib: avcodecdll.}
proc av_cpb_properties_alloc*(size: ptr csize): ptr AVCPBProperties {.cdecl,
    importc: "av_cpb_properties_alloc", dynlib: avcodecdll.}