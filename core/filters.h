#ifndef FILTERS_H
#define FILTERS_H

#include <stdio.h>
#include <string.h>
#include <libavformat/avformat.h>
#include <libavfilter/avfilter.h>
#include <libavfilter/buffersink.h>
#include <libavfilter/buffersrc.h>
#include <libavutil/opt.h>
#include <libswscale/swscale.h>
#include "libavcodec/avcodec.h"
#include <libswscale/swscale.h>

void applyGrayscaleFilter(const char *inputFile, const char *outputFile);
void applySepiaFilter(const char *inputFile, const char *outputFile);
void handle_filter_args(char **args);

#endif