#include "shell/shell.h"
#include "shell/args.h"

#define VERSION "1.0"

int main(int argc, char **argv)
{
    if (argc > 1 && strcmp(argv[1], "-version") == 0)
    {
        printf("shvid version %s\n", VERSION);
        return 0;
    }

    handle_command_args(argv);

    // to use custom shell
    // loop();

    return EXIT_SUCCESS;
}