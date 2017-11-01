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
  ../nim_ffmpeg_common, avutil, fifo, samplefmt



proc av_audio_fifo_free*(af: ptr AVAudioFifo) {.cdecl, importc: "av_audio_fifo_free",
    dynlib: avutildll.}
proc av_audio_fifo_alloc*(sample_fmt: AVSampleFormat; channels: cint;
                         nb_samples: cint): ptr AVAudioFifo {.cdecl,
    importc: "av_audio_fifo_alloc", dynlib: avutildll.}
proc av_audio_fifo_realloc*(af: ptr AVAudioFifo; nb_samples: cint): cint {.cdecl,
    importc: "av_audio_fifo_realloc", dynlib: avutildll.}
proc av_audio_fifo_write*(af: ptr AVAudioFifo; data: ptr pointer; nb_samples: cint): cint {.
    cdecl, importc: "av_audio_fifo_write", dynlib: avutildll.}
proc av_audio_fifo_peek*(af: ptr AVAudioFifo; data: ptr pointer; nb_samples: cint): cint {.
    cdecl, importc: "av_audio_fifo_peek", dynlib: avutildll.}
proc av_audio_fifo_peek_at*(af: ptr AVAudioFifo; data: ptr pointer; nb_samples: cint;
                           offset: cint): cint {.cdecl,
    importc: "av_audio_fifo_peek_at", dynlib: avutildll.}
proc av_audio_fifo_read*(af: ptr AVAudioFifo; data: ptr pointer; nb_samples: cint): cint {.
    cdecl, importc: "av_audio_fifo_read", dynlib: avutildll.}
proc av_audio_fifo_drain*(af: ptr AVAudioFifo; nb_samples: cint): cint {.cdecl,
    importc: "av_audio_fifo_drain", dynlib: avutildll.}
proc av_audio_fifo_reset*(af: ptr AVAudioFifo) {.cdecl,
    importc: "av_audio_fifo_reset", dynlib: avutildll.}
proc av_audio_fifo_size*(af: ptr AVAudioFifo): cint {.cdecl,
    importc: "av_audio_fifo_size", dynlib: avutildll.}
proc av_audio_fifo_space*(af: ptr AVAudioFifo): cint {.cdecl,
    importc: "av_audio_fifo_space", dynlib: avutildll.}