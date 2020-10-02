import QtQuick 2.12

SplashViewForm {
    Connections {
        target: _splashViewController

        onViewDidLoadWithResult: {
            if (result)
                mainStackView.replace(result ? "qrc:/View/Common/LoginView.qml" : "qrc:/View/Common/SignupView.qml")
        }
    }

    Timer {
        id: timer
        // Show the splash during 2 sec
        interval: 2000; running: false; repeat: false
        onTriggered: {
            _splashViewController.viewDidLoad()
        }
    }

    Component.onCompleted: {
        timer.start()
    }
}
