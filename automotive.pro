TEMPLATE = app
TARGET = automotive
QT +=quick \
quickcontrols2 \
opengl \
webengine

CONFIG += c++11
DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += \
    main.cpp \
    src/Tools.cpp \
    src/udiskdevice.cpp

RESOURCES += \
    clock.qrc \
    icons/icons.qrc \
    pictures.qrc \
    qml/qml.qrc

CONFIG += qt \
          release

DESTDIR = usr/bin
BUILDDIR = build
OBJECTS_DIR = $${BUILDDIR}
MOC_DIR = $${BUILDDIR}
RCC_DIR = $${BUILDDIR}
UI_DIR = $${BUILDDIR}
OBJECTS_DIR&=$${BUILDDIR}
INCLUDEPATH +=build
target.path = /home/pi
INSTALLS += target

##DISTFILES += shar/pictures/music.jpg

HEADERS += \
    src/Tools.h \
    src/udiskdevice.h
OTHER_FILES  +=qml/outils/clock/content/*.png \

