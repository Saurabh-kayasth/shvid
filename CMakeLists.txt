cmake_minimum_required(VERSION 3.10)
project(shvid VERSION 1.0)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)

include_directories(/opt/homebrew/Cellar/ffmpeg/7.0.1/include /opt/homebrew/Cellar/ffmpeg/7.0.1/lib)

# Add your source files
add_executable(shvid main.c shell/shell.c shell/args.c core/filters.c core/info.c core/tools.c helpers/cmd_helpers.c helpers/file_helpers.c)

target_include_directories(shvid PRIVATE include)

set_target_properties(shvid PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/build
)

install(TARGETS shvid DESTINATION /usr/local/bin)

target_link_libraries(shvid
    /opt/homebrew/Cellar/ffmpeg/7.0.1/lib/libavformat.dylib
    /opt/homebrew/Cellar/ffmpeg/7.0.1/lib/libavcodec.dylib
    /opt/homebrew/Cellar/ffmpeg/7.0.1/lib/libavutil.dylib
    /opt/homebrew/Cellar/ffmpeg/7.0.1/lib/libavdevice.dylib
    /opt/homebrew/Cellar/ffmpeg/7.0.1/lib/libavfilter.dylib
    /opt/homebrew/Cellar/ffmpeg/7.0.1/lib/libswresample.dylib
    /opt/homebrew/Cellar/ffmpeg/7.0.1/lib/libswscale.dylib
    /opt/homebrew/Cellar/ffmpeg/7.0.1/lib/libpostproc.dylib
)