FROM dubit/android-build-image:base

# --- Install the required build packages, tools and SDKs ---
# * To get a list of available packages run: sdkmanager --list

# --- Update the android SDK repositories ---
RUN sdkmanager "platform-tools"

# --- Install android SDK
# * If you are installing multiple SDK packages keep these in descending order!
RUN sdkmanager "platforms;android-30"
RUN sdkmanager "platforms;android-29"

# --- Install build-tools
# * If you are installing multiple build tool packages keep these in descending order!
RUN sdkmanager "build-tools;30.0.3"
RUN sdkmanager "build-tools;29.0.3"

# --- Install Extras
RUN sdkmanager "extras;android;m2repository"
RUN sdkmanager "extras;google;m2repository"
RUN sdkmanager "extras;google;google_play_services"

# --- Install Google APIs
# * If you are installing multiple API packages keep these in descending order!
RUN sdkmanager "add-ons;addon-google_apis-google-23"

RUN useradd -ms /bin/bash builder
USER builder
RUN mkdir ~/.gradle && touch ~/.gradle/gradle.properties

# Set GEM_HOME so that all aspects of gem installations are local to the user we just created to avoid permission issues
ENV GEM_HOME=~/.gem

VOLUME /usr/src/app
WORKDIR /usr/src/app

CMD ls
