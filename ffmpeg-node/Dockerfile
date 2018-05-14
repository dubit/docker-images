FROM node:10.1.0-slim

# --- Update apt and install all build dependencies. ---
RUN apt-get update -qq && apt-get -y install \
  autoconf \
  automake \
  build-essential \
  git \
  libass-dev \
  libfreetype6-dev \
  libtool \
  libvorbis-dev \
  pkg-config \
  texinfo \
  wget \
  zlib1g-dev

# --- Install a prebuilt binary of CMake ---
# * The Debian package on apt is only version 3.0.x. Some of the
# * build process requires a CMake version higher than 3.5.
RUN wget https://cmake.org/files/v3.11/cmake-3.11.1-Linux-x86_64.tar.gz && tar -xzf cmake-3.11.1-Linux-x86_64.tar.gz
ENV PATH="${PATH}:/cmake-3.11.1-Linux-x86_64/bin/"

# --- FFMPEG Build and install ---
RUN mkdir -p ~/ffmpeg_sources ~/bin

# --- Install nasm assembler ---
# * This is an assembler used by some of FFMPEG's peer dependencies.
RUN cd ~/ffmpeg_sources && \
  wget https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03.tar.bz2 && \
  tar xjvf nasm-2.13.03.tar.bz2 && \
  cd nasm-2.13.03 && \
  ./autogen.sh && \
  PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
  make -j4 && \
  make -j4 install

# --- Install Yasm assembler ---
# * This is an assembler used by some of FFMPEG's peer dependencies.
RUN apt-get install -y yasm

# --- Install the H.264 video encoder. ---
RUN apt-get install -y libx264-dev

# --- Install the H.265/HEVC video encoder. ---
# * This encoder is not packaged for Debian and we need to build it from source.
RUN apt-get install -y mercurial && \
  cd ~/ffmpeg_sources && \
  if cd x265 2> /dev/null; then hg pull && hg update; else hg clone https://bitbucket.org/multicoreware/x265; fi && \
  cd x265/build/linux && \
  PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED=off ../../source && \
  PATH="$HOME/bin:$PATH" make -j4 && \
  make -j4 install

# --- Install the VP8/VP9 video encoder/decoder. ---
# * This encoder/decoder is not packaged for Debian and we need to build it from source.
RUN cd ~/ffmpeg_sources && \
  git -C libvpx pull 2> /dev/null || git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git && \
  cd libvpx && \
  PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm && \
  PATH="$HOME/bin:$PATH" make -j4 && \
  make -j4 install

# --- Install the AAC audio encoder. ---
# * This encoder is not packaged for Debian and we need to build it from source.
RUN cd ~/ffmpeg_sources && \
  git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
  cd fdk-aac && \
  autoreconf -fiv && \
  ./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
  make -j4 && \
  make -j4 install

# --- Install the MP3 audio encoder. ---
RUN apt-get install -y libmp3lame-dev

# --- Install the Opus audio decoder and encoder. ---
RUN apt-get install -y libopus-dev

# --- Install the AV1 video encoder/decoder. ---
# * This encoder is not packaged for Debian and we need to build it from source.
RUN cd ~/ffmpeg_sources && \
  git -C aom pull 2> /dev/null || git clone --depth 1 https://aomedia.googlesource.com/aom && \
  mkdir aom_build && \
  cd aom_build && \
  PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED=off -DENABLE_NASM=on ../aom && \
  PATH="$HOME/bin:$PATH" make -j4 && \
  make -j4 install

# --- Configure and build FFMPEG from source ---
RUN cd ~/ffmpeg_sources && \
  wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
  tar xjvf ffmpeg-snapshot.tar.bz2 && \
  cd ffmpeg && \
  PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-libaom \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree && \
  PATH="$HOME/bin:$PATH" make -j4 && \
  make -j4 install && \
  hash -r

ENV PATH="${PATH}:~/ffmpeg_sources/ffmpeg/"

CMD node -v && ffmpeg -version
