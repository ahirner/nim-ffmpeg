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
  ../nim_ffmpeg_common, attributes, config


proc av_bswap16*(x: uint16_t): uint16_t {.cdecl.} =
  x = (x shr 8) or (x shl 8)
  return x

proc av_bswap32*(x: uint32_t): uint32_t {.cdecl.} =
  return (((x) shl 8 and 0x0000FF00) or ((x) shr 8 and 0x000000FF)) shl 16 or
      ((((x) shr 16) shl 8 and 0x0000FF00) or (((x) shr 16) shr 8 and 0x000000FF))

proc av_bswap64*(x: uint64_t): uint64_t {.inline, cdecl.} =
  return cast[uint64_t](av_bswap32(x)) shl 32 or av_bswap32(x shr 32)

