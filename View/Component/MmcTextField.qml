import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property string title
    property bool isMandatory: false
    property bool isPassword: false
    property int textWidth: 200
    property string text: textField.text
    property string value: ""

    implicitHeight: 200
    implicitWidth: 200
    Label {
        text: title //+ isMandatory ? " *" : ""
        color: "#06a8c4"
    }
    TextField {
        id: textField
        echoMode: isPassword ? TextInput.Password : TextInput.Normal
        Layout.preferredWidth: textWidth
        text: value
    }
}
