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

    ListView {
        model: 50
        spacing: 1
        anchors.fill: parent
        delegate: Row {
            width: parent.width
            height: 20
            spacing: 10
            Label {
                text: "MACHINE A CAFE"
            }
            MmcTextField {

            }
            MmcDatePicker {

            }
            MmcDatePicker {

            }
        }
    }
}
