import QtQuick 2.12
import "qrc:/View/Component"

Column {
    spacing: 10
    topPadding: 100
    leftPadding: mainWindow.width / 4

    property alias clientAccountListView: clientAccountListView

    MmcTextField {
        title: ""
        id: searchTextField
        width: mainWindow.width / 2

    }

    ListView {
        id: clientAccountListView
        width:  mainWindow.width / 2
        height: mainWindow.width - 200
        clip: true
        focus: true
        currentIndex: 1
        delegate: Rectangle {
            width: clientAccountListView.width
            height: 50
            Text {
                text: code + " - " + nom
                width: parent.width
                height: parent.height
            }

            MouseArea {
                z: 1
                hoverEnabled: false
                anchors.fill: parent
                // @disable-check M223
                onClicked: {
                    // @disable-check M222
                    clientAccountListViewSelection(index)
                }
            }
        }
        highlight: Rectangle {
             color:"black"
             radius: 5
             opacity: 0.7
             focus: true
             width: clientAccountListView.width
             height: 50
        }
    }
}
