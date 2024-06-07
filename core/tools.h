#ifndef TOOLS_H
#define TOOLS_H

#include <stdio.h>
#include <string.h>
#include <libavformat/avformat.h>
#include <libavutil/imgutils.h>
#include "libavcodec/avcodec.h"
#include <libswscale/swscale.h>

typedef enum
{
    SS,
    SS_GRAY
} ScreenshotType;

void takeScreenshot(const char *inputFile, const int interval, ScreenshotType type);
void handle_tool_args(char **args);

#endif