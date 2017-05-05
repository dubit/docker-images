FROM ubuntu:16.04

# --- Environment variables ---
ENV ANDROID_HOME /opt/android-sdk-linux

# --- Run system tool updates ---
RUN apt-get update
RUN apt-get -y install unzip
RUN apt-get -y install curl
RUN apt-get -y install git
RUN apt-get -y install python
RUN apt-get -y install build-essential

# --- Install Android build requirements ---
RUN dpkg --add-architecture i386
RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-8-jdk libc6:i386 libstdc++6:i386 libgcc1:i386 libncurses5:i386 libz1:i386

# --- Download the Android SDK tools and export to $ANDROID_HOME ---
RUN cd /opt && curl -s https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz > android-sdk.tgz
RUN cd /opt && tar -xvzf android-sdk.tgz
RUN cd /opt && rm -rf android-sdk.tgz

# -- Download the Android NDK and export to $ANDROID_NDK ---
ENV ANDROID_NDK /opt/android-ndk

RUN mkdir /opt/android-ndk-tmp
RUN cd /opt/android-ndk-tmp && curl -s https://dl.google.com/android/repository/android-ndk-r10e-linux-x86_64.zip > android-ndk.zip
RUN cd /opt/android-ndk-tmp && unzip android-ndk.zip
RUN cd /opt/android-ndk-tmp && mv ./android-ndk-r10e /opt/android-ndk
RUN rm -rf /opt/android-ndk-tmp

# --- Update the PATH variable ---
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_NDK}

# --- Install the required build packages, tools and SDKs ---
# * To get a list of available packages run: android list sdk --no-ui --all --extended
# * You can only install one package at a time. The license accept (echo y) will only work for a single package.
# The android CLI will silently fail and not install the package if something goes wrong so be careful.

# --- Update the android SDK repositories ---
RUN echo y | android update sdk --no-ui --all --filter platform-tools | grep 'package installed'

# --- Install android SDK
# * If you are installing multiple SDK packages keep these in descending order!
RUN echo y | android update sdk --no-ui --all --filter android-25 | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter android-24 | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter android-23 | grep 'package installed'

# --- Install build-tools
# * If you are installing multiple build tool packages keep these in descending order!
RUN echo y | android update sdk --no-ui --all --filter build-tools-25.0.2 | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter build-tools-24.0.3 | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter build-tools-23.0.3 | grep 'package installed'

# --- Install Extras
RUN echo y | android update sdk --no-ui --all --filter extra-android-m2repository | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter extra-google-m2repository | grep 'package installed'
RUN echo y | android update sdk --no-ui --all --filter extra-google-google_play_services | grep 'package installed'

# --- Install Google APIs
# * If you are installing multiple API packages keep these in descending order!
RUN echo y | android update sdk --no-ui --all --filter addon-google_apis-google-23 | grep 'package installed'

# --- Install Gradle ---
RUN apt-get -y install gradle
RUN mkdir ~/.gradle && touch ~/.gradle/gradle.properties
RUN gradle -v

# --- Install Maven 3 ---
# * Purge any installations of Maven 1 & 2 including user configurations
RUN apt-get purge maven maven2
RUN apt-get update
RUN apt-get -y install maven
RUN mvn --version

# --- Install NodeJS required for react native projects
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get -y install nodejs

# --- Install Yarn as an alternative to NPM for package management ---
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn
RUN yarn --version

# --- Install React-Native's CLI ---
RUN npm install -g react-native-cli

# --- Install Microsoft's CodePush service ---
RUN npm install -g code-push-cli

# --- Cleanup ---
RUN apt-get clean

VOLUME /usr/src/app
WORKDIR /usr/src/app

CMD ls
