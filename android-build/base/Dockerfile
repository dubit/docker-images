FROM ubuntu:16.04

# --- Environment variables ---
ENV ANDROID_HOME /opt/android-sdk-linux

# --- Run system tool updates ---
RUN apt-get update
RUN apt-get -y install unzip curl git python build-essential

# --- Install Android build requirements ---
RUN dpkg --add-architecture i386
RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-8-jdk libc6:i386 libstdc++6:i386 libgcc1:i386 libncurses5:i386 libz1:i386

# --- Install Gradle ---
RUN apt-get -y install gradle

# --- Install Maven 3 ---
# * Purge any installations of Maven 1 & 2 including user configurations
RUN apt-get purge maven maven2
RUN apt-get -y install maven

# --- Install Ruby required for Fastlane operations ---
RUN apt-get -y install ruby-full
RUN ruby -v

# --- Install Bundler as the primary package manager for Ruby ---
RUN gem install bundler

# --- Install NodeJS required for react native projects
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get -y install nodejs

# --- Install Yarn as an alternative to NPM for package management ---
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

# --- Install React-Native's CLI ---
RUN npm install -g react-native-cli

# --- Create the Android repository config file ---
# * This is not required, but makes warnings on installing packages go away.
RUN mkdir /root/.android
RUN touch /root/.android/repositories.cfg

# --- Download the Android SDK tools and export to $ANDROID_HOME ---
ENV ANDROID_HOME /opt/android-sdk-linux
RUN cd /opt \
  && curl https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -o android-sdk-tools.zip \
  && unzip -q android-sdk-tools.zip -d ${ANDROID_HOME} \
  && rm -f android-sdk-tools.zip

# --- Update the PATH variable ---
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

# --- Accept all standard component licenses before installing any component. ---
# * Non-standard components: MIPS system images, preview versions, GDK (Google Glass) and Android Google TV require separate licenses, not accepted there
RUN yes | sdkmanager --licenses

# --- Cleanup ---
RUN apt-get clean
