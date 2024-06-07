#include "args.h"
#include "../core/filters.h"
#include "../core/info.h"
#include "../core/tools.h"
#include "../helpers/cmd_helpers.h"

void handle_command_args(char **args)
{
    if (args[1] != NULL && strncmp(args[1], "-m", 2) == 0)
    {
        print_info_commands();
        print_tool_commands();
    }
    else if (args[1] != NULL && strncmp(args[1], "--filter=", 9) == 0)
    {
        handle_filter_args(args);
    }
    else if (args[1] != NULL && strncmp(args[1], "--info=", 7) == 0)
    {
        handle_info_args(args);
    }
    else if (args[1] != NULL && strncmp(args[1], "--tool=", 7) == 0)
    {
        handle_tool_args(args);
    }
    else
    {
        fprintf(stderr, "Unknown argument\n");
    }
}