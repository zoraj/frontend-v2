import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

ColumnLayout {
    property string title
    property bool isMandatory: false
    property bool isPassword: false
    property int textWidth: 200
    property string text: textField.text
    property string value: textField.value

    implicitHeight: 200
    implicitWidth: 200

    Label {
        text: title
        color: "#06a8c4"
    }
    Row {
        spacing: 10
        TextField {
            property string value

            id: textField
            echoMode: isPassword ? TextInput.Password : TextInput.Normal
            Layout.preferredWidth: textWidth
        }
        Button {
            text: "..."
            onClicked: {
                datepickerDialog.caller = textField
                datepickerDialog.open()
            }
        }
    }
}

