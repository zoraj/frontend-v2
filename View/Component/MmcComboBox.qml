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
    ComboBox {
        editable: true
        id: comboBox
        Layout.preferredWidth: textWidth
    }
}
