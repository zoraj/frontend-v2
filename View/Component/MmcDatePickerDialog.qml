import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12


Dialog {
    id: confirmationDialog

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    parent: Overlay.overlay

    modal: true
    title: "Confirmation"
    standardButtons: Dialog.Yes | Dialog.No

    Column {
        spacing: 20
        anchors.fill: parent
        Label {
            text: "The document has been modified.\nDo you want to save your changes?"
        }
        CheckBox {
            text: "Do not ask again"
            anchors.right: parent.right
        }
    }
}
