FROM node:23.9.0

# Install Haxe dependencies
RUN apt-get update && apt-get install -y g++ g++-multilib libgc-dev

# Set important env vars for build environment
ENV HAXEPATH=/root/haxe
ENV HAXE_STD_PATH=/root/haxe/std/
ENV PATH=/root/haxe:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV NEKOPATH=/root/neko
ENV LD_LIBRARY_PATH=/root/neko
ENV PATH=/root/neko:/root/haxe:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Download Haxe 3.3.0 and Neko 2.4.0 (it would be nice to make these easily changeable)

RUN mkdir $HAXEPATH $NEKOPATH
RUN wget -O - https://github.com/HaxeFoundation/neko/releases/download/v2-4-0/neko-2.4.0-linux64.tar.gz | tar xzf - --strip=1 -C $NEKOPATH
RUN wget -O - https://github.com/HaxeFoundation/haxe/releases/download/3.3.0-rc1/haxe-3.3.0-rc.1-linux64.tar.gz | tar -xzf - --strip=1 -C $HAXEPATH

RUN mkdir /root/haxelib
RUN echo /root/haxelib > /root/.haxelib
RUN cp /root/.haxelib /etc/
RUN haxelib install hxcpp

WORKDIR /opt/app

CMD ["npm install && npm run build"]
