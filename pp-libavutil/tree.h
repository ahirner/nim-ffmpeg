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
#include "attributes.h"











//#include "attributes.h" // #29
//#include "version.h" // #30





struct AVTreeNode;
extern const int av_tree_node_size;




struct AVTreeNode *av_tree_node_alloc(void);



void *av_tree_find(const struct AVTreeNode *root, void *key,
                   int (*cmp)(const void *key, const void *b), void *next[2]);



void *av_tree_insert(struct AVTreeNode **rootp, void *key,
                     int (*cmp)(const void *key, const void *b),
                     struct AVTreeNode **next);

void av_tree_destroy(struct AVTreeNode *t);



void av_tree_enumerate(struct AVTreeNode *t, void *opaque,
                       int (*cmp)(void *opaque, void *elem),
                       int (*enu)(void *opaque, void *elem));






