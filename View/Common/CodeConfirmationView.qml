import QtQuick 2.12
import QtQuick.Controls 2.12

CodeConfirmationViewForm {
    function nextFocusOrValidate() {
        // TODO This function can be better written without the multiple if
        if (t0.text !== "") t1.focus = true
        if (t1.text !== "") t2.focus = true
        if (t2.text !== "") t3.focus = true
        if (t3.text !== "") t4.focus = true
        if (t4.text !== "") t5.focus = true
        var code = t0.text + t1.text + t2.text + t3.text + t4.text + t5.text
        if (code.length === 6) {
            //_codeConfirmationViewController.validateCodeTriggered(code)
            resultText.opacity = 1
            timer.running = true
        }
    }
    Timer {
        id: timer
        interval: 3000; running: false; repeat: false
        onTriggered: {
            mainStackView.replace(null, "qrc:/View/Common/LoginView.qml", StackView.Immediate)
        }
    }
    t0.onTextEdited: {
        if (t0.text !== "")
            nextFocusOrValidate()
    }
    t1.onTextEdited: {
        if (t1.text !== "")
            nextFocusOrValidate()
    }
    t2.onTextEdited: {
        if (t2.text !== "")
            nextFocusOrValidate()
    }
    t3.onTextEdited: {
        if (t3.text !== "")
            nextFocusOrValidate()
    }
    t4.onTextEdited: {
        if (t4.text !== "")
            nextFocusOrValidate()
    }
    t5.onTextEdited: {
        if (t5.text !== "")
            nextFocusOrValidate()
    }

    Component.onCompleted: {
        t0.focus = true
    }

    /*
    Connections {
        target: _codeConfirmationViewController
        onValidateCodeTriggeredTerminated: {
            if (result) {
                resultText.opacity = 1
                timer.running = true
            }
            else {

            }
        }
    }

    Timer {
        id: timer
        interval: 3000; running: false; repeat: false
        onTriggered: {
            mainStackView.replace(null, "qrc:/View/Common/LoginView.qml", StackView.Immediate)
        }
    }

    Component.onCompleted: {
        toolBar.visible = true
    }




*/
}
