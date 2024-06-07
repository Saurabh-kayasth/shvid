FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    cmake \
    gcc \
    g++ \
    git \
    pkg-config \
    wget \
    yasm \
    nasm \
    libx264-dev \
    libx265-dev \
    libvpx-dev \
    libfdk-aac-dev \
    libmp3lame-dev \
    libopus-dev \
    libass-dev \
    libfreetype6-dev \
    libvorbis-dev \
    libssl-dev \
    libv4l-dev \
    autoconf \
    automake \
    build-essential \
    libtool \
    checkinstall \
    zlib1g-dev

RUN mkdir -p /tmp/ffmpeg && cd /tmp/ffmpeg && git clone https://github.com/FFmpeg/FFmpeg.git ffmpeg && cd ffmpeg && ./configure \
    --prefix=/usr/local \
    --enable-gpl \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libvpx \
    --enable-libfdk-aac \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libass \
    --enable-libfreetype \
    --enable-libvorbis \
    --enable-nonfree && make && make install && ldconfig && rm -rf /tmp/ffmpeg

WORKDIR /app

COPY . /app

RUN rm CMakeLists.txt

RUN mv CMakeListsDocker.txt CMakeLists.txt

RUN rm -rf CMakeCache.txt CMakeFiles build

RUN mkdir -p build

RUN cmake -S . -B build

RUN cmake .

RUN make

CMD ["./build/shvid"]
