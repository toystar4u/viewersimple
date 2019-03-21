TEMPLATE = app
TARGET = ViewerSimple
QT += qml quick
SOURCES += main.cpp \
    cameradatamanager.cpp
CONFIG += link_pkgconfig
static {
    QT += svg
    QTPLUGIN += qtvirtualkeyboardplugin
}

target.path = /tmp/$${TARGET}/bin
INSTALLS += target

RESOURCES += \
    demo.qrc

OTHER_FILES += \
    Basic.qml \

disable-xcb {
    message("The disable-xcb option has been deprecated. Please use disable-desktop instead.")
    CONFIG += disable-desktop
}

DEFINES += MAIN_QML=\\\"Basic.qml\\\"

HEADERS += \
    cameradatamanager.h
