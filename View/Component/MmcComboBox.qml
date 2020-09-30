import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property string title
    property int textWidth: 200
    property var comboBoxModel
    property string role
    property int  currentIndex: comboBox.currentIndex

    implicitHeight: 200
    implicitWidth: 200
    Label {
        text: title
        color: "#374866" //"#06a8c4"
        font.bold: true
    }
    ComboBox {
        editable: true
        id: comboBox
        Layout.preferredWidth: textWidth
        model: comboBoxModel
        textRole: role
    }
}
