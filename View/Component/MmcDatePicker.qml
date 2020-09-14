import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

ColumnLayout {
    property string title
    property bool isMandatory: false
    property int textWidth: 120
    property string text: textField.text
    property string value: textField.value

    implicitHeight: 200
    implicitWidth: 200

    Label {
        text: title
        color: "#06a8c4"
    }
    RowLayout {
        TextField {
            property string value
            id: textField
            Layout.preferredWidth: textWidth
            placeholderText: "jj/MM/AAAA"
            horizontalAlignment: Text.AlignHCenter

        }
        Button {
            onClicked: {
                datepickerDialog.caller = textField
                datepickerDialog.open()
            }
            contentItem: Text {
                font.pointSize: 12
                text: "..."
                opacity: 1.0
                //color: "#06a8c4"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 10
                implicitHeight: 10
                border.width: 0
            }
        }
    }
}

