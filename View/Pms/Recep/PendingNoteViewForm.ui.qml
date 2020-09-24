import QtQuick 2.12
import QtQuick.Controls 2.12

GridView {
    id: pendingNoteGridView
    topMargin: 30
    leftMargin: 30
    anchors.fill: parent
    cellWidth: 200
    cellHeight: 200
    delegate: Rectangle {
        color: "#94c7cf"
        width: pendingNoteGridView.cellWidth - 10
        height: pendingNoteGridView.cellHeight - 10

        Column {
            spacing: 10
            topPadding: 10
            leftPadding: 10
            Label {
                text: "Type de note ..."
                color: "white"
            }
            Label {
                text: "Nom Note"
                color: "white"
            }
            Label {
                text: "Id Note ... HC201"
                color: "white"
            }
        }
    }
    model: 100
}
