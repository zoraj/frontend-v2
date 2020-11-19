import QtQuick 2.12

SplashViewForm {
    Connections {
        target: _splashViewController

        onViewDidLoadWithResult: {
            mainStackView.replace(result ? "qrc:/View/Common/LoginView.qml" : "qrc:/View/Common/SignupView.qml")
            if(!result)
                console.log("Either no UUID or APIKEY")
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
