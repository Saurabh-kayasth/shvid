#include "cmd_helpers.h"

void print_header(char *header)
{
    printf("================================================== %s =====================================================\n", header);
}

void print_footer()
{
    printf("=============================================================================================================\n\n");
}

void print_divider()
{
    printf("|--------------------------------|--------------------------------------------------------------------------|\n");
}

void print_info_commands()
{
    print_header("INFO");
    printf("| %-30s | %-72s |\n", "Option", "Description");
    print_divider();
    printf("| %-30s | %-72s |\n", "--info=format", "To get video format, bitrate etc.");
    print_divider();
    printf("| %-30s | %-72s |\n", "--info=codec", "To get codec, sample rate etc.");
    print_footer();
}

void print_tool_commands()
{
    print_header("TOOL");
    printf("| %-30s | %-72s |\n", "Option", "Description");
    print_divider();
    printf("| %-30s | %-72s |\n", "--tool=ss timestamp", "To get screenshot at specified timestamp in seconds");
    print_divider();
    printf("| %-30s | %-72s |\n", "--tool=ss-gray timestamp", "To get grayscale screenshot at specified timestamp in seconds");
    print_footer();
}