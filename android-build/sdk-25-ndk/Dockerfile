FROM dubit/android-build-image:sdk-25

# --- Switch to the root user to install the NDK and it's components
USER root

ENV ANDROID_NDK_HOME /opt/android-ndk
ENV ANDROID_NDK_VERSION r10e

# -- Download the Android NDK and export to $ANDROID_NDK ---
RUN mkdir /opt/android-ndk-tmp
RUN cd /opt/android-ndk-tmp && curl https://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip -o android-ndk.zip
RUN cd /opt/android-ndk-tmp && unzip android-ndk.zip
RUN cd /opt/android-ndk-tmp && mv ./android-ndk-r10e /opt/android-ndk
RUN rm -rf /opt/android-ndk-tmp

# --- Update the PATH variable ---
ENV PATH ${PATH}:${ANDROID_NDK_HOME}

USER builder

VOLUME /usr/src/app
WORKDIR /usr/src/app

CMD ls
