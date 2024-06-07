#include "tools.h"
#include "../helpers/file_helpers.h"

void takeScreenshot(const char *inputFile, const int interval, ScreenshotType type)
{
    AVFormatContext *pFormatCtx = NULL;
    if (open_input_file(inputFile, &pFormatCtx) != 0)
        return;

    av_dump_format(pFormatCtx, 0, inputFile, 0);

    int videoStream = -1;
    for (int i = 0; i < pFormatCtx->nb_streams; i++)
    {
        if (pFormatCtx->streams[i]->codecpar->codec_type == AVMEDIA_TYPE_VIDEO)
        {
            videoStream = i;
            break;
        }
    }

    if (videoStream == -1)
    {
        printf("Couldn't find a video stream.\n");
        return;
    }

    AVCodecParameters *pCodecParams = pFormatCtx->streams[videoStream]->codecpar;
    AVCodec *pCodec = avcodec_find_decoder(pCodecParams->codec_id);
    if (pCodec == NULL)
    {
        printf("Unsupported codec!\n");
        return;
    }

    AVCodecContext *pCodecCtx = avcodec_alloc_context3(pCodec);
    if (avcodec_parameters_to_context(pCodecCtx, pCodecParams) < 0)
    {
        printf("Couldn't copy codec context.\n");
        return;
    }

    if (avcodec_open2(pCodecCtx, pCodec, NULL) < 0)
    {
        printf("Couldn't open codec.\n");
        return;
    }

    AVFrame *pFrame = av_frame_alloc();
    AVFrame *pFrameRGB = av_frame_alloc();
    if (pFrameRGB == NULL || pFrame == NULL)
    {
        printf("Couldn't allocate frame.\n");
        return;
    }

    int numBytes = av_image_get_buffer_size(AV_PIX_FMT_RGB24, pCodecCtx->width, pCodecCtx->height, 32);
    uint8_t *buffer = (uint8_t *)av_malloc(numBytes * sizeof(uint8_t));

    av_image_fill_arrays(pFrameRGB->data, pFrameRGB->linesize, buffer, AV_PIX_FMT_RGB24, pCodecCtx->width, pCodecCtx->height, 32);

    struct SwsContext *sws_ctx = sws_getContext(pCodecCtx->width, pCodecCtx->height, pCodecCtx->pix_fmt,
                                                pCodecCtx->width, pCodecCtx->height, AV_PIX_FMT_RGB24,
                                                SWS_BILINEAR, NULL, NULL, NULL);

    int frameFinished;
    AVPacket packet;
    int frame_index = 0;
    int64_t timestamp = 0;

    while (av_read_frame(pFormatCtx, &packet) >= 0)
    {
        if (packet.stream_index == videoStream)
        {
            avcodec_send_packet(pCodecCtx, &packet);
            avcodec_receive_frame(pCodecCtx, pFrame);

            if (frame_index % (interval * (pCodecCtx->framerate.num / pCodecCtx->framerate.den)) == 0)
            {
                sws_scale(sws_ctx, (uint8_t const *const *)pFrame->data, pFrame->linesize, 0, pCodecCtx->height,
                          pFrameRGB->data, pFrameRGB->linesize);

                if (type == SS)
                    save_frame_as_image(pFrameRGB, pCodecCtx->width, pCodecCtx->height);
                else if (type == SS_GRAY)
                    save_frame_as_grayscale_image(pFrameRGB, pCodecCtx->width, pCodecCtx->height);
            }
            frame_index++;
        }

        av_packet_unref(&packet);
    }

    av_free(buffer);
    av_frame_free(&pFrameRGB);
    av_frame_free(&pFrame);
    avcodec_close(pCodecCtx);
    avformat_close_input(&pFormatCtx);
}

void handle_tool_args(char **args)
{
    const char *format_name = args[1] + 7;

    const char *input_file = args[2];

    const char *interval = args[3];

    if (input_file == NULL)
    {
        fprintf(stderr, "Usage: shvid --tool=%s input.mp4\n", format_name);
        return;
    }

    if (strcmp(format_name, "ss") == 0)
    {
        takeScreenshot(input_file, atoi(interval), SS);
    }
    else if (strcmp(format_name, "ss-gray") == 0)
    {
        takeScreenshot(input_file, atoi(interval), SS_GRAY);
    }
    else
    {
        fprintf(stderr, "Unknown tool: %s\n", format_name);
    }
}