import QtQuick 2.12
import QtQuick.Controls 2.12
import "qrc:/View/Component"

Dialog {
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    width: parent.width / 2
    height: parent.height - 100
    modal: true
    parent: Overlay.overlay
    title: "Liste des prestations"
    standardButtons: Dialog.Close

    Rectangle {
        anchors.fill: parent
        MmcTextField {
            id: searchTextField
            textWidth: parent.width / 2
            title: ""
            anchors.horizontalCenter: parent.horizontalCenter
        }
        ListView {
            anchors.top: searchTextField.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height - 50
            width: parent.width
            model: 100
            clip: true
            delegate: Row {
                Label {
                    text: "Coca Cola"
                }
                Label {
                    text: "30€"
                }
            }
        }
    }
}
