QT += quick websockets sql quickcontrols2

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        Application/ApplicationManager.cpp \
        Cache/MmcParametrageCache.cpp \
        Controller/Common/CodeConfirmationViewController.cpp \
        Controller/Common/LoginViewController.cpp \
        Controller/Common/SignupViewController.cpp \
        Controller/Common/SplashViewController.cpp \
        Controller/Pms/CashSaleViewController.cpp \
        Controller/Pms/PmsBookingDetailViewController.cpp \
        ListModel/MmcClientListModel.cpp \
        Service/BaseService.cpp \
        Service/ClientService.cpp \
        Service/DeviceService.cpp \
        Service/EstablishmentService.cpp \
        Service/NoteService.cpp \
        Service/RoomService.cpp \
        Service/UserService.cpp \
        Util/HttpUtil.cpp \
        Util/Util.cpp \
        main.cpp

RESOURCES += qml.qrc \
    icons/gallery/20x20/back.png \
    icons/gallery/20x20/drawer.png \
    icons/gallery/20x20/menu.png \
    icons/gallery/20x20@2/back.png \
    icons/gallery/20x20@2/drawer.png \
    icons/gallery/20x20@2/menu.png \
    icons/gallery/20x20@3/back.png \
    icons/gallery/20x20@3/drawer.png \
    icons/gallery/20x20@3/menu.png \
    icons/gallery/20x20@4/back.png \
    icons/gallery/20x20@4/drawer.png \
    icons/gallery/20x20@4/menu.png \
    icons/gallery/index.theme \
    qtquickcontrols2.conf


TRANSLATIONS += \
    Frontend_fr_FR.ts

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/View/

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
CONFIG(release, debug|release):DEFINES += QT_NO_DEBUG_OUTPUT

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    icons/gallery/20x20/back.png \
    icons/gallery/20x20/drawer.png \
    icons/gallery/20x20/menu.png \
    icons/gallery/20x20@2/back.png \
    icons/gallery/20x20@2/drawer.png \
    icons/gallery/20x20@2/menu.png \
    icons/gallery/20x20@3/back.png \
    icons/gallery/20x20@3/drawer.png \
    icons/gallery/20x20@3/menu.png \
    icons/gallery/20x20@4/back.png \
    icons/gallery/20x20@4/drawer.png \
    icons/gallery/20x20@4/menu.png \
    icons/gallery/index.theme \
    qtquickcontrols2.conf

HEADERS += \
    Application/ApplicationManager.h \
    Cache/MmcParametrageCache.h \
    Controller/Common/CodeConfirmationViewController.h \
    Controller/Common/LoginViewController.h \
    Controller/Common/SignupViewController.h \
    Controller/Common/SplashViewController.h \
    Controller/Pms/CashSaleViewController.h \
    Controller/Pms/PmsBookingDetailViewController.h \
    ListModel/MmcClientListModel.h \
    Model/DeviceModel.h \
    Model/EtablissementModel.h \
    Model/MmcClientModel.h \
    Model/MmcParametrageModel.h \
    Model/MmcUserModel.h \
    Model/PmsChambreModel.h \
    Model/PmsNoteEnteteModel.h \
    Model/PmsTypeChambreModel.h \
    Model/PmsVenteComptantModel.h \
    Service/BaseService.h \
    Service/ClientService.h \
    Service/DeviceService.h \
    Service/EstablishmentService.h \
    Service/NoteService.h \
    Service/RoomService.h \
    Service/UserService.h \
    Util/Constant.h \
    Util/HttpRequest.h \
    Util/HttpUtil.h \
    Util/Util.h
