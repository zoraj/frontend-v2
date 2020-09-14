import QtQuick 2.12

LoginViewForm {

    signinButton.onClicked: {
        prettyRectangle.visible = false
        // PMS

        mainStackView.replace(null, "qrc:/View/Pms/PlanningChoiceView.qml")
    }

    /*
    Connections {
        target: _loginViewController
        onSigninFinishedWithResult: { // result
            mainStackView.replace(null, "qrc:/View/Pms/PlanningChoiceView.qml")
            toolBar.visible = true
            tabBar.visible = true
        }
    }

    signinButton.onClicked: {
        if (loginTextField.text !== "" && passwordTextField.text !== "") {
            _loginViewController.loginButtonClicked(loginTextField.text, passwordTextField.text)
        }
    }
    */
}
