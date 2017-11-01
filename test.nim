## Start by making the following imports work
#[
#include <libavcodec/avcodec.h>
#include <libavformat/avformat.h>
#include <libswscale/swscale.h>
#include <libavutil/motion_vector.h>
]#

import libavcodec/avcodec
import libavformat/avformat
import libswscale/swscale
import libavutil/motion_vector

import libavutil/avutil

echo "Imported basics of ffmpeg version " & $av_version_info()

