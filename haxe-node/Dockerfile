FROM node:10.15.0

# Install Haxe dependencies
RUN apt-get update &&  apt-get install -y g++ g++-multilib libgc-dev

# Set important env vars for build environment
ENV HAXEPATH=/root/haxe
ENV HAXE_STD_PATH=/root/haxe/std/
ENV PATH=/root/haxe:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV NEKOPATH=/root/neko
ENV LD_LIBRARY_PATH=/root/neko
ENV PATH=/root/neko:/root/haxe:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Download Haxe 3.1.3 and Neko 2.0.0 (it would be nice to make these easily changeable)

RUN mkdir $HAXEPATH $NEKOPATH
RUN wget -O - http://nekovm.org/_media/neko-2.0.0-linux64.tar.gz | tar xzf - --strip=1 -C $NEKOPATH
RUN wget -O - https://haxe.org/website-content/downloads/3.1.3/downloads/haxe-3.1.3-linux64.tar.gz | tar -xzf - --strip=1 -C $HAXEPATH

RUN mkdir /root/haxelib
RUN echo /root/haxelib > /root/.haxelib
RUN cp /root/.haxelib /etc/
RUN haxelib install hxcpp

WORKDIR /opt/app

CMD ["npm install && npm run build"]
