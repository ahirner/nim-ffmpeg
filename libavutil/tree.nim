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
  AVTreeNode* {.bycopy.} = object
  

var av_tree_node_size* {.importc: "av_tree_node_size", dynlib: avutildll.}: cint

proc av_tree_node_alloc*(): ptr AVTreeNode {.cdecl, importc: "av_tree_node_alloc",
    dynlib: avutildll.}
proc av_tree_find*(root: ptr AVTreeNode; key: pointer;
                  cmp: proc (key: pointer; b: pointer): cint {.cdecl.};
                  next: array[2, pointer]): pointer {.cdecl, importc: "av_tree_find",
    dynlib: avutildll.}
proc av_tree_insert*(rootp: ptr ptr AVTreeNode; key: pointer;
                    cmp: proc (key: pointer; b: pointer): cint {.cdecl.};
                    next: ptr ptr AVTreeNode): pointer {.cdecl,
    importc: "av_tree_insert", dynlib: avutildll.}
proc av_tree_destroy*(t: ptr AVTreeNode) {.cdecl, importc: "av_tree_destroy",
                                       dynlib: avutildll.}
proc av_tree_enumerate*(t: ptr AVTreeNode; opaque: pointer; cmp: proc (opaque: pointer;
    elem: pointer): cint {.cdecl.}; enu: proc (opaque: pointer; elem: pointer): cint {.
    cdecl.}) {.cdecl, importc: "av_tree_enumerate", dynlib: avutildll.}