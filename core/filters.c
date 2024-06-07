#include "filters.h"

void applyGrayscaleFilter(const char *inputFile, const char *outputFile)
{
    printf("Applying grayscale filter on %s and saving to %s\n", inputFile, outputFile);
}

void applySepiaFilter(const char *inputFile, const char *outputFile)
{
    printf("Applying sepia filter on %s and saving to %s\n", inputFile, outputFile);
}

void handle_filter_args(char **args)
{
    const char *filter_name = args[1] + 9;

    const char *input_file = args[2];
    const char *output_file = args[3];

    if (input_file == NULL || output_file == NULL)
    {
        fprintf(stderr, "Usage: shvid --filter=%s input.mp4 output.mp4\n", filter_name);
        return;
    }

    if (strcmp(filter_name, "grayscale") == 0)
    {
        applyGrayscaleFilter(input_file, output_file);
    }
    else if (strcmp(filter_name, "sepia") == 0)
    {
        applySepiaFilter(input_file, output_file);
    }
    else
    {
        fprintf(stderr, "Unknown filter: %s\n", filter_name);
    }
}