import QtQuick 2.12
import QtQuick.Controls 2.12
import "qrc:/View/Component"

Dialog {
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    width: parent.width / 2
    height: parent.height / 2
    modal: true
    parent: Overlay.overlay
    title: "Stock autres"
    standardButtons: Dialog.Close

    Column {
        anchors.centerIn: parent
        anchors.fill: parent
        MmcComboBox {
            title: "CB"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        MmcTextField {
            title: "N°"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        MmcTextField {
            title: "Expire"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        MmcTextField {
            title: "Titulaire"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}
