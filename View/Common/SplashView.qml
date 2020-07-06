import QtQuick 2.4

SplashViewForm {
    Connections {
        target: _splashViewController

        onViewLoadedWithResult: {
            /*
            if (result === "NO_APIKEY") {
                mainLoader.source = "qrc:/View/Common/SignupView.qml"
            }
            else {
                mainLoader.source = "qrc:/View/Common/LoginView.qml"
            }*/
            mainStackView.replace("qrc:/View/Common/SignupView.qml")
        }
    }

    Timer {
        id: timer
        interval: 2000; running: false; repeat: false
        onTriggered: {
            _splashViewController.viewLoaded()
        }
    }

    Component.onCompleted: {
        timer.start()
    }
}
