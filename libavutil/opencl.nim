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
  ../nim_ffmpeg_common, dict


type
  AVOpenCLDeviceNode* {.bycopy.} = object
    device_type*: cint
    device_name*: cstring
    device_id*: cl_device_id

  AVOpenCLPlatformNode* {.bycopy.} = object
    platform_id*: cl_platform_id
    platform_name*: cstring
    device_num*: cint
    device_node*: ptr ptr AVOpenCLDeviceNode

  AVOpenCLDeviceList* {.bycopy.} = object
    platform_num*: cint
    platform_node*: ptr ptr AVOpenCLPlatformNode

  AVOpenCLExternalEnv* {.bycopy.} = object
    platform_id*: cl_platform_id
    device_type*: cl_device_type
    context*: cl_context
    device_id*: cl_device_id
    command_queue*: cl_command_queue
    platform_name*: cstring


proc av_opencl_get_device_list*(device_list: ptr ptr AVOpenCLDeviceList): cint {.
    cdecl, importc: "av_opencl_get_device_list", dynlib: avutildll.}
proc av_opencl_free_device_list*(device_list: ptr ptr AVOpenCLDeviceList) {.cdecl,
    importc: "av_opencl_free_device_list", dynlib: avutildll.}
proc av_opencl_set_option*(key: cstring; val: cstring): cint {.cdecl,
    importc: "av_opencl_set_option", dynlib: avutildll.}
proc av_opencl_get_option*(key: cstring; out_val: ptr ptr uint8_t): cint {.cdecl,
    importc: "av_opencl_get_option", dynlib: avutildll.}
proc av_opencl_free_option*() {.cdecl, importc: "av_opencl_free_option",
                              dynlib: avutildll.}
proc av_opencl_alloc_external_env*(): ptr AVOpenCLExternalEnv {.cdecl,
    importc: "av_opencl_alloc_external_env", dynlib: avutildll.}
proc av_opencl_free_external_env*(ext_opencl_env: ptr ptr AVOpenCLExternalEnv) {.
    cdecl, importc: "av_opencl_free_external_env", dynlib: avutildll.}
proc av_opencl_errstr*(status: cl_int): cstring {.cdecl, importc: "av_opencl_errstr",
    dynlib: avutildll.}
proc av_opencl_register_kernel_code*(kernel_code: cstring): cint {.cdecl,
    importc: "av_opencl_register_kernel_code", dynlib: avutildll.}
proc av_opencl_init*(ext_opencl_env: ptr AVOpenCLExternalEnv): cint {.cdecl,
    importc: "av_opencl_init", dynlib: avutildll.}
proc av_opencl_compile*(program_name: cstring; build_opts: cstring): cl_program {.
    cdecl, importc: "av_opencl_compile", dynlib: avutildll.}
proc av_opencl_get_command_queue*(): cl_command_queue {.cdecl,
    importc: "av_opencl_get_command_queue", dynlib: avutildll.}
proc av_opencl_buffer_create*(cl_buf: ptr cl_mem; cl_buf_size: csize; flags: cint;
                             host_ptr: pointer): cint {.cdecl,
    importc: "av_opencl_buffer_create", dynlib: avutildll.}
proc av_opencl_buffer_write*(dst_cl_buf: cl_mem; src_buf: ptr uint8_t; buf_size: csize): cint {.
    cdecl, importc: "av_opencl_buffer_write", dynlib: avutildll.}
proc av_opencl_buffer_read*(dst_buf: ptr uint8_t; src_cl_buf: cl_mem; buf_size: csize): cint {.
    cdecl, importc: "av_opencl_buffer_read", dynlib: avutildll.}
proc av_opencl_buffer_write_image*(dst_cl_buf: cl_mem; cl_buffer_size: csize;
                                  dst_cl_offset: cint; src_data: ptr ptr uint8_t;
                                  plane_size: ptr cint; plane_num: cint): cint {.
    cdecl, importc: "av_opencl_buffer_write_image", dynlib: avutildll.}
proc av_opencl_buffer_read_image*(dst_data: ptr ptr uint8_t; plane_size: ptr cint;
                                 plane_num: cint; src_cl_buf: cl_mem;
                                 cl_buffer_size: csize): cint {.cdecl,
    importc: "av_opencl_buffer_read_image", dynlib: avutildll.}
proc av_opencl_buffer_release*(cl_buf: ptr cl_mem) {.cdecl,
    importc: "av_opencl_buffer_release", dynlib: avutildll.}
proc av_opencl_uninit*() {.cdecl, importc: "av_opencl_uninit", dynlib: avutildll.}
proc av_opencl_benchmark*(device: ptr AVOpenCLDeviceNode; platform: cl_platform_id;
    benchmark: proc (ext_opencl_env: ptr AVOpenCLExternalEnv): int64_t {.cdecl.}): int64_t {.
    cdecl, importc: "av_opencl_benchmark", dynlib: avutildll.}