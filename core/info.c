#include "info.h"
#include "../helpers/file_helpers.h"

void print_format_info(const char *inputFile)
{
    AVFormatContext *format_ctx = NULL;

    if (open_input_file(inputFile, &format_ctx) != 0)
        return;

    printf("Format: %s\n", format_ctx->iformat->long_name);
    printf("Duration: %lld seconds\n", (long long)(format_ctx->duration / AV_TIME_BASE));
    printf("Bitrate: %lld kbps\n", (long long)(format_ctx->bit_rate / 1000));

    avformat_close_input(&format_ctx);
}

void print_codec_info(const char *inputFile)
{
    AVFormatContext *format_ctx = NULL;

    if (open_input_file(inputFile, &format_ctx) != 0)
    {
        return;
    }

    for (unsigned int i = 0; i < format_ctx->nb_streams; i++)
    {
        AVStream *stream = format_ctx->streams[i];
        AVCodecParameters *codecpar = stream->codecpar;
        AVCodec *codec = avcodec_find_decoder(codecpar->codec_id);

        if (codec == NULL)
        {
            fprintf(stderr, "Failed to find codec for stream %d\n", i);
            continue;
        }

        printf("Codec Information for Stream #%d:\n", i);
        printf("Stream Index: %d\n", stream->index);
        printf("Codec: %s (%s)\n", codec->long_name, codec->name);
        printf("Codec Type: %s\n", av_get_media_type_string(codecpar->codec_type));
        printf("Bitrate: %lld kbps\n", (long long)(codecpar->bit_rate / 1000));

        if (codecpar->codec_type == AVMEDIA_TYPE_VIDEO)
        {
            AVCodecContext *codec_ctx = avcodec_alloc_context3(codec);
            if (!codec_ctx)
            {
                fprintf(stderr, "Failed to allocate codec context for stream %d\n", i);
                continue;
            }

            if (avcodec_parameters_to_context(codec_ctx, codecpar) < 0)
            {
                fprintf(stderr, "Failed to copy codec parameters to codec context for stream %d\n", i);
                avcodec_free_context(&codec_ctx);
                continue;
            }

            printf("Resolution: %dx%d\n", codecpar->width, codecpar->height);
            printf("Frame Rate: %.2f fps\n", av_q2d(stream->r_frame_rate));
            printf("Aspect Ratio: %d/%d\n", codecpar->sample_aspect_ratio.num, codecpar->sample_aspect_ratio.den);
            printf("Pixel Format: %s\n", av_get_pix_fmt_name(codecpar->format));
            printf("Color Space: %d\n", codecpar->color_space);
            printf("Color Range: %d\n", codecpar->color_range);
            printf("Color Transfer: %d\n", codecpar->color_trc);
            printf("Color Primaries: %d\n", codecpar->color_primaries);
            printf("Bit Depth: %d\n", codecpar->bits_per_raw_sample);
            printf("Profile: %d\n", codec_ctx->profile);
            printf("Level: %d\n", codec_ctx->level);

            avcodec_free_context(&codec_ctx);
        }
        else if (codecpar->codec_type == AVMEDIA_TYPE_AUDIO)
        {
            printf("Sample Rate: %d\n", codecpar->sample_rate);
            printf("Profile: %d\n", codecpar->profile);
            printf("Level: %d\n", codecpar->level);
        }

        AVDictionaryEntry *tag = NULL;
        while ((tag = av_dict_get(stream->metadata, "", tag, AV_DICT_IGNORE_SUFFIX)))
        {
            printf("%s=%s\n", tag->key, tag->value);
        }
    }

    avformat_close_input(&format_ctx);
}

void handle_info_args(char **args)
{
    const char *format_name = args[1] + 7;

    const char *input_file = args[2];

    if (input_file == NULL)
    {
        fprintf(stderr, "Usage: shvid --info=%s input.mp4\n", format_name);
        return;
    }

    if (strcmp(format_name, "format") == 0)
    {
        print_format_info(input_file);
    }
    else if (strcmp(format_name, "codec") == 0)
    {
        print_codec_info(input_file);
    }
    else
    {
        fprintf(stderr, "Unknown info: %s\n", format_name);
    }
}