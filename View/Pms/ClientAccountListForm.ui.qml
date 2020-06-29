import QtQuick 2.12
import "qrc:/View/Component"

Rectangle {
    width: 400
    height: 400
    property alias clientAccountListView: clientAccountListView

    Column {
        MmcTextField {
            title: ""
            id: searchTextField
            width: parent.width
        }

        ListView {
            id: clientAccountListView
            anchors.fill: parent
            delegate: Text {
                text: name + ": " + number
            }
        }
    }
}
