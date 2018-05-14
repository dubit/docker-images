FROM dubit/android-build-image:base

# --- Install the required build packages, tools and SDKs ---
# * To get a list of available packages run: sdkmanager --list

# --- Update the android SDK repositories ---
RUN sdkmanager "platform-tools"

# --- Install android SDK
# * If you are installing multiple SDK packages keep these in descending order!
RUN sdkmanager "platforms;android-27"
RUN sdkmanager "platforms;android-26"
RUN sdkmanager "platforms;android-25"
RUN sdkmanager "platforms;android-24"
RUN sdkmanager "platforms;android-23"

# --- Install build-tools
# * If you are installing multiple build tool packages keep these in descending order!
RUN sdkmanager "build-tools;27.0.3"
RUN sdkmanager "build-tools;27.0.2"
RUN sdkmanager "build-tools;27.0.1"
RUN sdkmanager "build-tools;27.0.0"
RUN sdkmanager "build-tools;26.0.2"
RUN sdkmanager "build-tools;26.0.1"
RUN sdkmanager "build-tools;25.0.3"
RUN sdkmanager "build-tools;25.0.2"
RUN sdkmanager "build-tools;24.0.3"
RUN sdkmanager "build-tools;23.0.3"
RUN sdkmanager "build-tools;23.0.2"
RUN sdkmanager "build-tools;23.0.1"

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

VOLUME /usr/src/app
WORKDIR /usr/src/app

CMD ls
