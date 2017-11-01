 {.deadCodeElim: on.}
when defined(windows):
  const
    avformatdll* = "avformat.dll"
elif defined(macosx):
  const
    avformatdll* = "libavformat.dylib"
else:
  const
    avformatdll* = "libavformat.so"
import
  ../nim_ffmpeg_common, ../libavutil/dict


type
  AVIOInterruptCB* {.bycopy.} = object
    callback*: proc (a2: pointer): cint {.cdecl.}
    opaque*: pointer

  AVIODirEntryType* {.size: sizeof(cint).} = enum
    AVIO_ENTRY_UNKNOWN, AVIO_ENTRY_BLOCK_DEVICE, AVIO_ENTRY_CHARACTER_DEVICE,
    AVIO_ENTRY_DIRECTORY, AVIO_ENTRY_NAMED_PIPE, AVIO_ENTRY_SYMBOLIC_LINK,
    AVIO_ENTRY_SOCKET, AVIO_ENTRY_FILE, AVIO_ENTRY_SERVER, AVIO_ENTRY_SHARE,
    AVIO_ENTRY_WORKGROUP


type
  AVIODirEntry* {.bycopy.} = object
    name*: cstring
    `type`*: cint
    utf8*: cint
    size*: int64_t
    modification_timestamp*: int64_t
    access_timestamp*: int64_t
    status_change_timestamp*: int64_t
    user_id*: int64_t
    group_id*: int64_t
    filemode*: int64_t

  AVIODirContext* {.bycopy.} = object
    url_context*: ptr URLContext

  AVIODataMarkerType* {.size: sizeof(cint).} = enum
    AVIO_DATA_MARKER_HEADER, AVIO_DATA_MARKER_SYNC_POINT,
    AVIO_DATA_MARKER_BOUNDARY_POINT, AVIO_DATA_MARKER_UNKNOWN,
    AVIO_DATA_MARKER_TRAILER


type
  AVIOContext* {.bycopy.} = object
    av_class*: ptr AVClass
    buffer*: ptr cuchar
    buffer_size*: cint
    buf_ptr*: ptr cuchar
    buf_end*: ptr cuchar
    opaque*: pointer
    read_packet*: proc (opaque: pointer; buf: ptr uint8_t; buf_size: cint): cint {.cdecl.}
    write_packet*: proc (opaque: pointer; buf: ptr uint8_t; buf_size: cint): cint {.cdecl.}
    seek*: proc (opaque: pointer; offset: int64_t; whence: cint): int64_t {.cdecl.}
    pos*: int64_t
    must_flush*: cint
    eof_reached*: cint
    write_flag*: cint
    max_packet_size*: cint
    checksum*: culong
    checksum_ptr*: ptr cuchar
    update_checksum*: proc (checksum: culong; buf: ptr uint8_t; size: cuint): culong {.
        cdecl.}
    error*: cint
    read_pause*: proc (opaque: pointer; pause: cint): cint {.cdecl.}
    read_seek*: proc (opaque: pointer; stream_index: cint; timestamp: int64_t;
                    flags: cint): int64_t {.cdecl.}
    seekable*: cint
    maxsize*: int64_t
    direct*: cint
    bytes_read*: int64_t
    seek_count*: cint
    writeout_count*: cint
    orig_buffer_size*: cint
    short_seek_threshold*: cint
    protocol_whitelist*: cstring
    protocol_blacklist*: cstring
    write_data_type*: proc (opaque: pointer; buf: ptr uint8_t; buf_size: cint;
                          `type`: AVIODataMarkerType; time: int64_t): cint {.cdecl.}
    ignore_boundary_point*: cint
    current_type*: AVIODataMarkerType
    last_time*: int64_t
    short_seek_get*: proc (opaque: pointer): cint {.cdecl.}


proc avio_find_protocol_name*(url: cstring): cstring {.cdecl,
    importc: "avio_find_protocol_name", dynlib: avformatdll.}
proc avio_check*(url: cstring; flags: cint): cint {.cdecl, importc: "avio_check",
    dynlib: avformatdll.}
proc avpriv_io_move*(url_src: cstring; url_dst: cstring): cint {.cdecl,
    importc: "avpriv_io_move", dynlib: avformatdll.}
proc avpriv_io_delete*(url: cstring): cint {.cdecl, importc: "avpriv_io_delete",
    dynlib: avformatdll.}
proc avio_open_dir*(s: ptr ptr AVIODirContext; url: cstring;
                   options: ptr ptr AVDictionary): cint {.cdecl,
    importc: "avio_open_dir", dynlib: avformatdll.}
proc avio_read_dir*(s: ptr AVIODirContext; next: ptr ptr AVIODirEntry): cint {.cdecl,
    importc: "avio_read_dir", dynlib: avformatdll.}
proc avio_close_dir*(s: ptr ptr AVIODirContext): cint {.cdecl,
    importc: "avio_close_dir", dynlib: avformatdll.}
proc avio_free_directory_entry*(entry: ptr ptr AVIODirEntry) {.cdecl,
    importc: "avio_free_directory_entry", dynlib: avformatdll.}
proc avio_alloc_context*(buffer: ptr cuchar; buffer_size: cint; write_flag: cint;
                        opaque: pointer; read_packet: proc (opaque: pointer;
    buf: ptr uint8_t; buf_size: cint): cint {.cdecl.}; write_packet: proc (
    opaque: pointer; buf: ptr uint8_t; buf_size: cint): cint {.cdecl.}; seek: proc (
    opaque: pointer; offset: int64_t; whence: cint): int64_t {.cdecl.}): ptr AVIOContext {.
    cdecl, importc: "avio_alloc_context", dynlib: avformatdll.}
proc avio_w8*(s: ptr AVIOContext; b: cint) {.cdecl, importc: "avio_w8",
                                       dynlib: avformatdll.}
proc avio_write*(s: ptr AVIOContext; buf: ptr cuchar; size: cint) {.cdecl,
    importc: "avio_write", dynlib: avformatdll.}
proc avio_wl64*(s: ptr AVIOContext; val: uint64_t) {.cdecl, importc: "avio_wl64",
    dynlib: avformatdll.}
proc avio_wb64*(s: ptr AVIOContext; val: uint64_t) {.cdecl, importc: "avio_wb64",
    dynlib: avformatdll.}
proc avio_wl32*(s: ptr AVIOContext; val: cuint) {.cdecl, importc: "avio_wl32",
    dynlib: avformatdll.}
proc avio_wb32*(s: ptr AVIOContext; val: cuint) {.cdecl, importc: "avio_wb32",
    dynlib: avformatdll.}
proc avio_wl24*(s: ptr AVIOContext; val: cuint) {.cdecl, importc: "avio_wl24",
    dynlib: avformatdll.}
proc avio_wb24*(s: ptr AVIOContext; val: cuint) {.cdecl, importc: "avio_wb24",
    dynlib: avformatdll.}
proc avio_wl16*(s: ptr AVIOContext; val: cuint) {.cdecl, importc: "avio_wl16",
    dynlib: avformatdll.}
proc avio_wb16*(s: ptr AVIOContext; val: cuint) {.cdecl, importc: "avio_wb16",
    dynlib: avformatdll.}
proc avio_put_str*(s: ptr AVIOContext; str: cstring): cint {.cdecl,
    importc: "avio_put_str", dynlib: avformatdll.}
proc avio_put_str16le*(s: ptr AVIOContext; str: cstring): cint {.cdecl,
    importc: "avio_put_str16le", dynlib: avformatdll.}
proc avio_put_str16be*(s: ptr AVIOContext; str: cstring): cint {.cdecl,
    importc: "avio_put_str16be", dynlib: avformatdll.}
proc avio_write_marker*(s: ptr AVIOContext; time: int64_t; `type`: AVIODataMarkerType) {.
    cdecl, importc: "avio_write_marker", dynlib: avformatdll.}
proc avio_seek*(s: ptr AVIOContext; offset: int64_t; whence: cint): int64_t {.cdecl,
    importc: "avio_seek", dynlib: avformatdll.}
proc avio_skip*(s: ptr AVIOContext; offset: int64_t): int64_t {.cdecl,
    importc: "avio_skip", dynlib: avformatdll.}
proc avio_tell*(s: ptr AVIOContext): int64_t {.cdecl.} =
  return avio_seek(s, 0, SEEK_CUR)

proc avio_size*(s: ptr AVIOContext): int64_t {.cdecl, importc: "avio_size",
    dynlib: avformatdll.}
proc avio_feof*(s: ptr AVIOContext): cint {.cdecl, importc: "avio_feof",
                                       dynlib: avformatdll.}
proc avio_printf*(s: ptr AVIOContext; fmt: cstring): cint {.varargs, cdecl,
    importc: "avio_printf", dynlib: avformatdll.}
proc avio_flush*(s: ptr AVIOContext) {.cdecl, importc: "avio_flush",
                                   dynlib: avformatdll.}
proc avio_read*(s: ptr AVIOContext; buf: ptr cuchar; size: cint): cint {.cdecl,
    importc: "avio_read", dynlib: avformatdll.}
proc avio_r8*(s: ptr AVIOContext): cint {.cdecl, importc: "avio_r8", dynlib: avformatdll.}
proc avio_rl16*(s: ptr AVIOContext): cuint {.cdecl, importc: "avio_rl16",
                                        dynlib: avformatdll.}
proc avio_rl24*(s: ptr AVIOContext): cuint {.cdecl, importc: "avio_rl24",
                                        dynlib: avformatdll.}
proc avio_rl32*(s: ptr AVIOContext): cuint {.cdecl, importc: "avio_rl32",
                                        dynlib: avformatdll.}
proc avio_rl64*(s: ptr AVIOContext): uint64_t {.cdecl, importc: "avio_rl64",
    dynlib: avformatdll.}
proc avio_rb16*(s: ptr AVIOContext): cuint {.cdecl, importc: "avio_rb16",
                                        dynlib: avformatdll.}
proc avio_rb24*(s: ptr AVIOContext): cuint {.cdecl, importc: "avio_rb24",
                                        dynlib: avformatdll.}
proc avio_rb32*(s: ptr AVIOContext): cuint {.cdecl, importc: "avio_rb32",
                                        dynlib: avformatdll.}
proc avio_rb64*(s: ptr AVIOContext): uint64_t {.cdecl, importc: "avio_rb64",
    dynlib: avformatdll.}
proc avio_get_str*(pb: ptr AVIOContext; maxlen: cint; buf: cstring; buflen: cint): cint {.
    cdecl, importc: "avio_get_str", dynlib: avformatdll.}
proc avio_get_str16le*(pb: ptr AVIOContext; maxlen: cint; buf: cstring; buflen: cint): cint {.
    cdecl, importc: "avio_get_str16le", dynlib: avformatdll.}
proc avio_get_str16be*(pb: ptr AVIOContext; maxlen: cint; buf: cstring; buflen: cint): cint {.
    cdecl, importc: "avio_get_str16be", dynlib: avformatdll.}
proc avio_open*(s: ptr ptr AVIOContext; url: cstring; flags: cint): cint {.cdecl,
    importc: "avio_open", dynlib: avformatdll.}
proc avio_open2*(s: ptr ptr AVIOContext; url: cstring; flags: cint;
                int_cb: ptr AVIOInterruptCB; options: ptr ptr AVDictionary): cint {.
    cdecl, importc: "avio_open2", dynlib: avformatdll.}
proc avio_close*(s: ptr AVIOContext): cint {.cdecl, importc: "avio_close",
                                        dynlib: avformatdll.}
proc avio_closep*(s: ptr ptr AVIOContext): cint {.cdecl, importc: "avio_closep",
    dynlib: avformatdll.}
proc avio_open_dyn_buf*(s: ptr ptr AVIOContext): cint {.cdecl,
    importc: "avio_open_dyn_buf", dynlib: avformatdll.}
proc avio_get_dyn_buf*(s: ptr AVIOContext; pbuffer: ptr ptr uint8_t): cint {.cdecl,
    importc: "avio_get_dyn_buf", dynlib: avformatdll.}
proc avio_close_dyn_buf*(s: ptr AVIOContext; pbuffer: ptr ptr uint8_t): cint {.cdecl,
    importc: "avio_close_dyn_buf", dynlib: avformatdll.}
proc avio_enum_protocols*(opaque: ptr pointer; output: cint): cstring {.cdecl,
    importc: "avio_enum_protocols", dynlib: avformatdll.}
proc avio_pause*(h: ptr AVIOContext; pause: cint): cint {.cdecl, importc: "avio_pause",
    dynlib: avformatdll.}
proc avio_seek_time*(h: ptr AVIOContext; stream_index: cint; timestamp: int64_t;
                    flags: cint): int64_t {.cdecl, importc: "avio_seek_time",
    dynlib: avformatdll.}
type
  AVBPrint* {.bycopy.} = object
  

proc avio_read_to_bprint*(h: ptr AVIOContext; pb: ptr AVBPrint; max_size: csize): cint {.
    cdecl, importc: "avio_read_to_bprint", dynlib: avformatdll.}
proc avio_accept*(s: ptr AVIOContext; c: ptr ptr AVIOContext): cint {.cdecl,
    importc: "avio_accept", dynlib: avformatdll.}
proc avio_handshake*(c: ptr AVIOContext): cint {.cdecl, importc: "avio_handshake",
    dynlib: avformatdll.}