#ifndef INFO_H
#define INFO_H

#include <stdio.h>
#include <string.h>
#include "libavformat/avformat.h"
#include "libavcodec/avcodec.h"
#include "libswscale/swscale.h"
#include <libavutil/pixdesc.h>

void print_format_info(const char *inputFile);
void print_codec_info(const char *inputFile);
void handle_info_args(char **args);

#endif