import QtQuick 2.4

SplashViewForm {
    Connections {
        target: _splashViewController

        onViewLoadedWithResult: {
            mainStackView.replace(result ? "qrc:/View/Common/LoginView.qml" : "qrc:/View/Common/SignupView.qml")
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
