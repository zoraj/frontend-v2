import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property string title
    property int textWidth: 200

    implicitHeight: 200
    implicitWidth: 200
    Label {
        text: title
        color: "#06a8c4"
    }
    TextField {
        id: textField
        echoMode: isPassword ? TextInput.Password : TextInput.Normal
        Layout.preferredWidth: textWidth
    }
}
