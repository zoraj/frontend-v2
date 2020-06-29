import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property string title
    property bool isMandatory: false
    property bool isPassword: false

    implicitHeight: 200
    implicitWidth: 200
    Label {
        text: title //+ isMandatory ? " *" : ""
    }
    TextField {
        id: textField
        echoMode: isPassword ? TextInput.Password : TextInput.Normal
    }
}
