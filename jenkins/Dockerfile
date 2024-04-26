FROM docker.io/jenkins/jenkins:jdk21

ENV ANDROID_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
ENV ANDROID_VERSION="34"
ENV ANDROID_BUILD_TOOLS_VERSION="35.0.0-rc3"
ENV ANDROID_ARCHITECTURE="arm64-v8a"
ENV ANDROID_SDK_ROOT="/opt/android"
ENV FLUTTER_CHANNEL="stable"
ENV FLUTTER_VERSION="3.19.6"
ENV FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/$FLUTTER_CHANNEL/linux/flutter_linux_$FLUTTER_VERSION-$FLUTTER_CHANNEL.tar.xz"
ENV FLUTTER_HOME="/opt/flutter"
ENV PATH="$ANDROID_SDK_ROOT/cmdline-tools/tools/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/platforms:$FLUTTER_HOME/bin:$PATH"

USER root
RUN apt-get update \
        && apt-get install -y --no-install-recommends curl git unzip xz-utils zip libglu1-mesa \
        && rm -rf /var/lib/{apt,dpkg,cache,log}

RUN mkdir -p $ANDROID_SDK_ROOT/cmdline-tools/tools /home/$USER/.android \
        && touch /home/$USER/.android/repositories.cfg \
        && curl -fLo android_tools.zip $ANDROID_TOOLS_URL \
        && unzip -qq -d "$ANDROID_SDK_ROOT" android_tools.zip \
        && rm android_tools.zip \
        && mv $ANDROID_SDK_ROOT/cmdline-tools/bin $ANDROID_SDK_ROOT/cmdline-tools/tools \
        && mv $ANDROID_SDK_ROOT/cmdline-tools/lib $ANDROID_SDK_ROOT/cmdline-tools/tools \
        && yes | sdkmanager --licenses \
        && sdkmanager \
                "platforms;android-$ANDROID_VERSION" \
                "cmdline-tools;latest" \
                "build-tools;$ANDROID_BUILD_TOOLS_VERSION" \
                "platform-tools" \
                "emulator" \
                "system-images;android-$ANDROID_VERSION;google_apis_playstore;$ANDROID_ARCHITECTURE"

RUN curl -fLo flutter.tar.xz $FLUTTER_URL \
        && mkdir -p $FLUTTER_HOME \
        && tar xf flutter.tar.xz -C /opt \
        && rm flutter.tar.xz \
        && git config --global --add safe.directory $FLUTTER_HOME \
        && flutter --disable-analytics \
        && flutter precache \
        && yes | flutter doctor --android-licenses \
        && flutter doctor \
        && flutter emulators --create \
        && flutter update-packages
RUN chown -R jenkins:jenkins /opt && chmod -R g+w /opt
USER jenkins
