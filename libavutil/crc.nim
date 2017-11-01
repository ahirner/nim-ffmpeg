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
  ../nim_ffmpeg_common, attributes


type
  AVCRC* = uint32_t
  AVCRCId* {.size: sizeof(cint).} = enum
    AV_CRC_8_ATM, AV_CRC_16_ANSI, AV_CRC_16_CCITT, AV_CRC_32_IEEE,
    AV_CRC_32_IEEE_LE, AV_CRC_16_ANSI_LE, AV_CRC_24_IEEE, AV_CRC_MAX


proc av_crc_init*(ctx: ptr AVCRC; le: cint; bits: cint; poly: uint32_t; ctx_size: cint): cint {.
    cdecl, importc: "av_crc_init", dynlib: avutildll.}
proc av_crc_get_table*(crc_id: AVCRCId): ptr AVCRC {.cdecl,
    importc: "av_crc_get_table", dynlib: avutildll.}
proc av_crc*(ctx: ptr AVCRC; crc: uint32_t; buffer: ptr uint8_t; length: csize): uint32_t {.
    cdecl, importc: "av_crc", dynlib: avutildll.}