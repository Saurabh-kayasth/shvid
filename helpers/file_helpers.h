#ifndef FILE_HELPERS_H
#define FILE_HELPERS_H

#include "libavformat/avformat.h"

int open_input_file(const char *inputFile, AVFormatContext **format_ctx);
int open_output_file(const char *outputFile, AVFormatContext *input_ctx, AVFormatContext **output_ctx);
void save_frame_as_image(AVFrame *pFrame, int width, int height);
void save_frame_as_grayscale_image(AVFrame *pFrame, int width, int height);

#endif