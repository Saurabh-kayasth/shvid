#include "file_helpers.h"

int open_input_file(const char *inputFile, AVFormatContext **format_ctx)
{
    if (avformat_open_input(format_ctx, inputFile, NULL, NULL) != 0)
    {
        fprintf(stderr, "\033[1;31merror: Could not open input file '%s'\033[0m\n", inputFile);
        return -1;
    }

    if (avformat_find_stream_info(*format_ctx, NULL) < 0)
    {
        fprintf(stderr, "\033[1;31merror: Failed to retrieve input stream information for file '%s'\033[0m\n", inputFile);
        avformat_close_input(format_ctx);
        return -1;
    }

    return 0;
}

int open_output_file(const char *outputFile, AVFormatContext *input_ctx, AVFormatContext **output_ctx)
{
    if (avformat_alloc_output_context2(output_ctx, NULL, NULL, outputFile) < 0)
    {
        fprintf(stderr, "Could not create output context\n");
        return -1;
    }

    for (unsigned int i = 0; i < input_ctx->nb_streams; i++)
    {
        AVStream *in_stream = input_ctx->streams[i];
        AVStream *out_stream = avformat_new_stream(*output_ctx, NULL);
        if (!out_stream)
        {
            fprintf(stderr, "Failed allocating output stream\n");
            return -1;
        }
        if (avcodec_parameters_copy(out_stream->codecpar, in_stream->codecpar) < 0)
        {
            fprintf(stderr, "Failed to copy codec parameters\n");
            return -1;
        }
    }

    if (!(*output_ctx)->oformat->flags & AVFMT_NOFILE)
    {
        if (avio_open(&(*output_ctx)->pb, outputFile, AVIO_FLAG_WRITE) < 0)
        {
            fprintf(stderr, "Could not open output file '%s'\n", outputFile);
            return -1;
        }
    }

    if (avformat_write_header(*output_ctx, NULL) < 0)
    {
        fprintf(stderr, "Error occurred when opening output file\n");
        return -1;
    }

    return 0;
}

void save_frame_as_image(AVFrame *pFrame, int width, int height)
{
    char szFilename[32];
    snprintf(szFilename, sizeof(szFilename), "thumbnail.ppm");

    FILE *pFile = fopen(szFilename, "wb");
    if (pFile == NULL)
        return;

    fprintf(pFile, "P6\n%d %d\n255\n", width, height);

    for (int y = 0; y < height; y++)
    {
        fwrite(pFrame->data[0] + y * pFrame->linesize[0], 1, width * 3, pFile);
    }

    fclose(pFile);
}

void save_frame_as_grayscale_image(AVFrame *pFrame, int width, int height)
{
    char szFilename[32];
    snprintf(szFilename, sizeof(szFilename), "thumbnail.pgm");

    FILE *pFile = fopen(szFilename, "wb");
    if (pFile == NULL)
        return;

    fprintf(pFile, "P5\n%d %d\n255\n", width, height);

    for (int y = 0; y < height; y++)
    {
        for (int x = 0; x < width; x++)
        {
            int rgb_index = x * 3;
            uint8_t r = pFrame->data[0][y * pFrame->linesize[0] + rgb_index];
            uint8_t g = pFrame->data[0][y * pFrame->linesize[0] + rgb_index + 1];
            uint8_t b = pFrame->data[0][y * pFrame->linesize[0] + rgb_index + 2];
            uint8_t gray = (uint8_t)(0.299 * r + 0.587 * g + 0.114 * b);
            fwrite(&gray, 1, 1, pFile);
        }
    }

    fclose(pFile);
}
