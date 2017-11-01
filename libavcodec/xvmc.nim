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
  ../nim_ffmpeg_common, ../libavutil/attributes, avcodec


type
  xvmc_pix_fmt* {.bycopy.} = object
    xvmc_id*: cint
    data_blocks*: ptr cshort
    mv_blocks*: ptr XvMCMacroBlock
    allocated_mv_blocks*: cint
    allocated_data_blocks*: cint
    idct*: cint
    unsigned_intra*: cint
    p_surface*: ptr XvMCSurface
    p_past_surface*: ptr XvMCSurface
    p_future_surface*: ptr XvMCSurface
    picture_structure*: cuint
    flags*: cuint
    start_mv_blocks_num*: cint
    filled_mv_blocks_num*: cint
    next_free_data_block_num*: cint

