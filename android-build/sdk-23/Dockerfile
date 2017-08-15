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

# --- Create the Android repository config file ---
# * This is not required, but makes warnings on installing packages go away.
RUN mkdir /root/.android
RUN touch /root/.android/repositories.cfg

# --- Download the Android SDK tools and export to $ANDROID_HOME ---
ENV ANDROID_HOME /opt/android-sdk-linux
RUN cd /opt \
    && curl https://dl.google.com/android/repository/sdk-tools-linux-3952940.zip -o android-sdk-tools.zip \
    && unzip -q android-sdk-tools.zip -d ${ANDROID_HOME} \
    && rm -f android-sdk-tools.zip

# --- Update the PATH variable ---
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

# --- Install the required build packages, tools and SDKs ---
# * To get a list of available packages run: sdkmanager --list

# --- Accept all standard component licenses before installing any component. ---
# * Non-standard components: MIPS system images, preview versions, GDK (Google Glass) and Android Google TV require separate licenses, not accepted there
RUN mkdir -p ${ANDROID_HOME}/licenses
RUN echo 8933bad161af4178b1185d1a37fbf41ea5269c55 > ${ANDROID_HOME}/licenses/android-sdk-license

# --- Update the android SDK repositories ---
RUN sdkmanager "platform-tools"

# --- Install android SDK
# * If you are installing multiple SDK packages keep these in descending order!
RUN sdkmanager "platforms;android-23"

# --- Install build-tools
# * If you are installing multiple build tool packages keep these in descending order!
RUN sdkmanager "build-tools;23.0.1"

# --- Install Extras
RUN sdkmanager "extras;android;m2repository"
RUN sdkmanager "extras;google;m2repository"
RUN sdkmanager "extras;google;google_play_services"

# --- Install Google APIs
# * If you are installing multiple API packages keep these in descending order!
RUN sdkmanager "add-ons;addon-google_apis-google-23"

# --- Install Gradle ---
RUN apt-get -y install gradle
RUN gradle -v

# --- Install Maven 3 ---
# * Purge any installations of Maven 1 & 2 including user configurations
RUN apt-get purge maven maven2
RUN apt-get update
RUN apt-get -y install maven
RUN mvn --version

# --- Install NodeJS required for react native projects
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
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

RUN useradd -ms /bin/bash builder
USER builder
RUN mkdir ~/.gradle && touch ~/.gradle/gradle.properties

VOLUME /usr/src/app
WORKDIR /usr/src/app

CMD ls
