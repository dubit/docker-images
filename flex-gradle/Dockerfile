FROM niaquinto/gradle

# Create required flex sdk directories (-p creates all parents)
RUN mkdir -p /opt/flexsdk/frameworks/libs/player/11.1/

# Download and install flex SDK

RUN wget --quiet http://archive.apache.org/dist/flex/4.9.0/binaries/apache-flex-sdk-4.9.0-bin.zip && \
    unzip apache-flex-sdk-4.9.0-bin.zip -d /opt/flexsdk

# Download and install player global swc

RUN wget --quiet http://download.macromedia.com/get/flashplayer/updaters/11/playerglobal11_1.swc -O /opt/flexsdk/frameworks/libs/player/11.1/playerglobal.swc

ENV PLAYERGLOBAL_HOME=libs/player/
ENV FLEX_HOME /opt/flexsdk/

WORKDIR /app

ENTRYPOINT ["gradle"]
CMD ["build", "publish"]