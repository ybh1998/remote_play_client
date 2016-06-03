TEMPLATE = app

QT += qml quick widgets network core

CONFIG += c++11

SOURCES += main.cpp \
    connection.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    http/*

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
ANDROID_EXTRA_LIBS += $$PWD/../ffmpeg-2.7.2/lib/libavutil-54.so \
    $$PWD/../ffmpeg-2.7.2/lib/libswscale-3.so \
    $$PWD/../ffmpeg-2.7.2/lib/libswresample-1.so \
    $$PWD/../ffmpeg-2.7.2/lib/libavcodec-56.so
HEADERS += \
    connection.h \
    ../include/defines.h \
    imageprovider.h

INCLUDEPATH += $$PWD/../include
DEPENDPATH += $$PWD/../include

android: LIBS +=-L$$PWD/../ffmpeg-2.7.2/lib/ -lavcodec-56 -lswscale-3 -lavutil-54
!android: LIBS += -lavcodec -lavdevice -lavfilter -lavformat -lswscale -lavutil
INCLUDEPATH += $$PWD/../ffmpeg-2.7.2/include
DEPENDPATH += $$PWD/../ffmpeg-2.7.2/include
