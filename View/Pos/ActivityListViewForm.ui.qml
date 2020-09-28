import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: activitiesListView.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property int mainMargin: 10

    ListView {
        id: activitiesListView
        width: 400
        height: mainWindow.height - 200
        model: 100
        spacing: 1
        x: 20
        y: 20
        delegate: Rectangle {
            width: parent.width
            height: 100
            Row {
                spacing: 20
                x: 20
                Label {
                    text: "RESTAURANT"
                    font.pointSize: 21
                    //anchors.verticalCenter: parent.verticalCenter
                }
                Column {
                    Button {
                        text: "Note ouverte"
                        //anchors.right: parent.right
                    }
                    Button {
                        text: "Plan de table"
                        //anchors.right: parent.right
                    }
                }
                Button {
                    text: "Nouvelle Com."
                    //anchors.right: parent.right
                    // @disable-check M223
                    onClicked: {
                        // @disable-check M222
                        onClicked: mainStackView.push(null, "qrc:/View/Pos/OrderView.qml")
                    }
                }
            }
        }
    }
    GridView {
        id: tableGridView
        model: 50
        width: mainWindow.width - mainMargin - activitiesListView.width
        height: mainWindow.height - 200
        anchors.left: activitiesListView.right
        anchors.leftMargin: mainMargin
        cellHeight: 120
        cellWidth: 120
        y: 20
        delegate: Rectangle {
            width: 100
            height: 100
            color: "#94c7cf"
            Label {
                text: index
                color: "white"
                anchors.centerIn: parent
            }
        }
    }
}
