TEMPLATE = lib
DEPENDPATH += .
INCLUDEPATH += .
DESTDIR = $$PWD/../plugins/script
QT += script
CONFIG += plugin
GENERATEDCPP = $$PWD/../generated_cpp
CONFIG(debug, debug|release):TARGET=$$qtLibraryTarget($$TARGET)d
CONFIG(release, debug|release):TARGET=$$qtLibraryTarget($$TARGET)

final.path = "$$[QT_INSTALL_PLUGINS]/script"
win32:final.files = "$$_PRO_FILE_PWD_/../../plugins/script/$${TARGET}.dll"
macx:final.files = "$$_PRO_FILE_PWD_/../../plugins/script/lib$${TARGET}.dylib"
unix:!macx:final.files = "$$_PRO_FILE_PWD_/../../plugins/script/lib$${TARGET}.so"
final.CONFIG = no_check_exist

INSTALLS += final
