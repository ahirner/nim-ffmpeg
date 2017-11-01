    #ifdef C2NIM
    #  dynlib avutildll
    #  cdecl
    #  if defined(windows)
    #    define avutildll "avutil.dll"
    #  elif defined(macosx)
    #    define avutildll "libavutil.dylib"
    #  else
    #    define avutildll "libavutil.so"
    #  endif
    #endif
    #include "../nim_ffmpeg_common.h"
#include "dict.h"















//#include <OpenCL/cl.h> // #36



//#include <stdint.h> // #40
//#include "dict.h" // #41

//#include "libavutil/version.h" // #43



typedef struct {
    int device_type;
    char *device_name;
    cl_device_id device_id;
} AVOpenCLDeviceNode;

typedef struct {
    cl_platform_id platform_id;
    char *platform_name;
    int device_num;
    AVOpenCLDeviceNode **device_node;
} AVOpenCLPlatformNode;

typedef struct {
    int platform_num;
    AVOpenCLPlatformNode **platform_node;
} AVOpenCLDeviceList;

typedef struct {
    cl_platform_id platform_id;
    cl_device_type device_type;
    cl_context context;
    cl_device_id  device_id;
    cl_command_queue command_queue;
    char *platform_name;
} AVOpenCLExternalEnv;



int av_opencl_get_device_list(AVOpenCLDeviceList **device_list);







void av_opencl_free_device_list(AVOpenCLDeviceList **device_list);



int av_opencl_set_option(const char *key, const char *val);










int av_opencl_get_option(const char *key, uint8_t **out_val);





void av_opencl_free_option(void);








AVOpenCLExternalEnv *av_opencl_alloc_external_env(void);







void av_opencl_free_external_env(AVOpenCLExternalEnv **ext_opencl_env);







const char *av_opencl_errstr(cl_int status);










int av_opencl_register_kernel_code(const char *kernel_code);








int av_opencl_init(AVOpenCLExternalEnv *ext_opencl_env);









cl_program av_opencl_compile(const char *program_name, const char* build_opts);






cl_command_queue av_opencl_get_command_queue(void);



int av_opencl_buffer_create(cl_mem *cl_buf, size_t cl_buf_size, int flags, void *host_ptr);









int av_opencl_buffer_write(cl_mem dst_cl_buf, uint8_t *src_buf, size_t buf_size);









int av_opencl_buffer_read(uint8_t *dst_buf, cl_mem src_cl_buf, size_t buf_size);



int av_opencl_buffer_write_image(cl_mem dst_cl_buf, size_t cl_buffer_size, int dst_cl_offset,
                                 uint8_t **src_data, int *plane_size, int plane_num);



int av_opencl_buffer_read_image(uint8_t **dst_data, int *plane_size, int plane_num,
                                cl_mem src_cl_buf, size_t cl_buffer_size);







void av_opencl_buffer_release(cl_mem *cl_buf);







void av_opencl_uninit(void);



int64_t av_opencl_benchmark(AVOpenCLDeviceNode *device, cl_platform_id platform,
                            int64_t (*benchmark)(AVOpenCLExternalEnv *ext_opencl_env));


