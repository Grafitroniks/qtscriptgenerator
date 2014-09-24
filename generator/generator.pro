include(generator.pri)

# Input
HEADERS += \
        generatorsetqtscript.h \
        metaqtscriptbuilder.h \
        metaqtscript.h \
        classgenerator.h \
        shellgenerator.h \
        shellimplgenerator.h \
        shellheadergenerator.h \
        setupgenerator.h \
        docgenerator.h

SOURCES += \
        generatorsetqtscript.cpp \
        metaqtscriptbuilder.cpp \
        metaqtscript.cpp \
        classgenerator.cpp \
        shellgenerator.cpp \
        shellimplgenerator.cpp \
        shellheadergenerator.cpp \
        setupgenerator.cpp \
        docgenerator.cpp

CONFIG -= debug
CONFIG += release

!win32:QMAKE_CLEAN += -r $$PWD/../generated_cpp $$PWD/../doc $$PWD/../plugins
win32:QMAKE_CLEAN += /S /Q /F $$PWD/../generated_cpp $$PWD/../doc $$PWD/../plugins

win32:QMAKE_POST_LINK += "cd \"$$replace(_PRO_FILE_PWD_, /, $$QMAKE_DIR_SEP)\" && set PATH=$$[QT_INSTALL_PREFIX]/bin;%PATH%&& \"$$replace(OUT_PWD, /, $$QMAKE_DIR_SEP)\\release\\generator.exe\" --include-paths=\"$$[QT_INSTALL_HEADERS]\""
macx:QMAKE_POST_LINK = "cd '$$_PRO_FILE_PWD_' && '$$OUT_PWD/generator' --include-paths='$$[QT_INSTALL_LIBS]'"
unix:!macx:QMAKE_POST_LINK = "cd '$$_PRO_FILE_PWD_' && '$$OUT_PWD/generator' --include-paths='$$[QT_INSTALL_HEADERS]'"
