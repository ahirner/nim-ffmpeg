    #ifdef C2NIM
    #  dynlib avformatdll
    #  cdecl
    #  if defined(windows)
    #    define avformatdll "avformat.dll"
    #  elif defined(macosx)
    #    define avformatdll "libavformat.dylib"
    #  else
    #    define avformatdll "libavformat.so"
    #  endif
    #endif
    #include "../nim_ffmpeg_common.h"
#include "../libavutil/dict.h"










//#include <stdint.h> // #28

//#include "libavutil/common.h" // #30
//#include "libavutil/dict.h" // #31
//#include "libavutil/log.h" // #32

//#include "libavformat/version.h" // #34













typedef struct AVIOInterruptCB {
    int (*callback)(void*);
    void *opaque;
} AVIOInterruptCB;




enum AVIODirEntryType {
    AVIO_ENTRY_UNKNOWN,
    AVIO_ENTRY_BLOCK_DEVICE,
    AVIO_ENTRY_CHARACTER_DEVICE,
    AVIO_ENTRY_DIRECTORY,
    AVIO_ENTRY_NAMED_PIPE,
    AVIO_ENTRY_SYMBOLIC_LINK,
    AVIO_ENTRY_SOCKET,
    AVIO_ENTRY_FILE,
    AVIO_ENTRY_SERVER,
    AVIO_ENTRY_SHARE,
    AVIO_ENTRY_WORKGROUP,
};







typedef struct AVIODirEntry {
    char *name;                           
    int type;                             
    int utf8;                             

    int64_t size;                         
    int64_t modification_timestamp;       

    int64_t access_timestamp;             

    int64_t status_change_timestamp;      

    int64_t user_id;                      
    int64_t group_id;                     
    int64_t filemode;                     
} AVIODirEntry;

typedef struct AVIODirContext {
    struct URLContext *url_context;
} AVIODirContext;





enum AVIODataMarkerType {
    


    AVIO_DATA_MARKER_HEADER,
    





    AVIO_DATA_MARKER_SYNC_POINT,
    




    AVIO_DATA_MARKER_BOUNDARY_POINT,
    





    AVIO_DATA_MARKER_UNKNOWN,
    



    AVIO_DATA_MARKER_TRAILER
};



typedef struct AVIOContext {
    

    const AVClass *av_class;

    

    unsigned char *buffer;  
    int buffer_size;        
    unsigned char *buf_ptr; 
    unsigned char *buf_end; 



    void *opaque;           

    int (*read_packet)(void *opaque, uint8_t *buf, int buf_size);
    int (*write_packet)(void *opaque, uint8_t *buf, int buf_size);
    int64_t (*seek)(void *opaque, int64_t offset, int whence);
    int64_t pos;            
    int must_flush;         
    int eof_reached;        
    int write_flag;         
    int max_packet_size;
    unsigned long checksum;
    unsigned char *checksum_ptr;
    unsigned long (*update_checksum)(unsigned long checksum, const uint8_t *buf, unsigned int size);
    int error;              
    


    int (*read_pause)(void *opaque, int pause);
    




    int64_t (*read_seek)(void *opaque, int stream_index,
                         int64_t timestamp, int flags);
    


    int seekable;

    



    int64_t maxsize;

    




    int direct;

    



    int64_t bytes_read;

    



    int seek_count;

    



    int writeout_count;

    




    int orig_buffer_size;

    



    int short_seek_threshold;

    


    const char *protocol_whitelist;

    


    const char *protocol_blacklist;

    


    int (*write_data_type)(void *opaque, uint8_t *buf, int buf_size,
                           enum AVIODataMarkerType type, int64_t time);
    




    int ignore_boundary_point;

    


    enum AVIODataMarkerType current_type;
    int64_t last_time;

    



    int (*short_seek_get)(void *opaque);
} AVIOContext;








const char *avio_find_protocol_name(const char *url);



int avio_check(const char *url, int flags);










int avpriv_io_move(const char *url_src, const char *url_dst);







int avpriv_io_delete(const char *url);



int avio_open_dir(AVIODirContext **s, const char *url, AVDictionary **options);



int avio_read_dir(AVIODirContext *s, AVIODirEntry **next);










int avio_close_dir(AVIODirContext **s);






void avio_free_directory_entry(AVIODirEntry **entry);



AVIOContext *avio_alloc_context(
                  unsigned char *buffer,
                  int buffer_size,
                  int write_flag,
                  void *opaque,
                  int (*read_packet)(void *opaque, uint8_t *buf, int buf_size),
                  int (*write_packet)(void *opaque, uint8_t *buf, int buf_size),
                  int64_t (*seek)(void *opaque, int64_t offset, int whence));

void avio_w8(AVIOContext *s, int b);
void avio_write(AVIOContext *s, const unsigned char *buf, int size);
void avio_wl64(AVIOContext *s, uint64_t val);
void avio_wb64(AVIOContext *s, uint64_t val);
void avio_wl32(AVIOContext *s, unsigned int val);
void avio_wb32(AVIOContext *s, unsigned int val);
void avio_wl24(AVIOContext *s, unsigned int val);
void avio_wb24(AVIOContext *s, unsigned int val);
void avio_wl16(AVIOContext *s, unsigned int val);
void avio_wb16(AVIOContext *s, unsigned int val);





int avio_put_str(AVIOContext *s, const char *str);








int avio_put_str16le(AVIOContext *s, const char *str);








int avio_put_str16be(AVIOContext *s, const char *str);



void avio_write_marker(AVIOContext *s, int64_t time, enum AVIODataMarkerType type);




















int64_t avio_seek(AVIOContext *s, int64_t offset, int whence);





int64_t avio_skip(AVIOContext *s, int64_t offset);





static av_always_inline int64_t avio_tell(AVIOContext *s)
{
    return avio_seek(s, 0, SEEK_CUR);
}





int64_t avio_size(AVIOContext *s);





int avio_feof(AVIOContext *s);









int avio_printf(AVIOContext *s, const char *fmt, ...) av_printf_format(2, 3);



void avio_flush(AVIOContext *s);





int avio_read(AVIOContext *s, unsigned char *buf, int size);








int          avio_r8  (AVIOContext *s);
unsigned int avio_rl16(AVIOContext *s);
unsigned int avio_rl24(AVIOContext *s);
unsigned int avio_rl32(AVIOContext *s);
uint64_t     avio_rl64(AVIOContext *s);
unsigned int avio_rb16(AVIOContext *s);
unsigned int avio_rb24(AVIOContext *s);
unsigned int avio_rb32(AVIOContext *s);
uint64_t     avio_rb64(AVIOContext *s);






int avio_get_str(AVIOContext *pb, int maxlen, char *buf, int buflen);







int avio_get_str16le(AVIOContext *pb, int maxlen, char *buf, int buflen);
int avio_get_str16be(AVIOContext *pb, int maxlen, char *buf, int buflen);





























int avio_open(AVIOContext **s, const char *url, int flags);



int avio_open2(AVIOContext **s, const char *url, int flags,
               const AVIOInterruptCB *int_cb, AVDictionary **options);



int avio_close(AVIOContext *s);



int avio_closep(AVIOContext **s);








int avio_open_dyn_buf(AVIOContext **s);



int avio_get_dyn_buf(AVIOContext *s, uint8_t **pbuffer);










int avio_close_dyn_buf(AVIOContext *s, uint8_t **pbuffer);



const char *avio_enum_protocols(void **opaque, int output);








int     avio_pause(AVIOContext *h, int pause);



int64_t avio_seek_time(AVIOContext *h, int stream_index,
                       int64_t timestamp, int flags);


struct AVBPrint;







int avio_read_to_bprint(AVIOContext *h, struct AVBPrint *pb, size_t max_size);








int avio_accept(AVIOContext *s, AVIOContext **c);



int avio_handshake(AVIOContext *c);

