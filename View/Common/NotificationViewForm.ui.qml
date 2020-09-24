import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12


Flickable {
    property alias notificationListView: notificationListView
    flickableDirection: Flickable.AutoFlickIfNeeded

    ListView {
        id: notificationListView
        topMargin: 20
        leftMargin: 20
        //anchors.fill: parent
        rightMargin: 20
        height: parent.height - 20
        width: parent.width - 20
        clip: true
        delegate: Column {
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle {
                id: resultRectangle
                width: notificationListView.width
                height: 60
                color: "white"
                Row {
                    spacing: 60
                    leftPadding: 100
                    anchors.verticalCenter: parent.verticalCenter
                    Label {
                        text: "TEST"
                    }
                    Label {
                        text: "TEST"
                    }
                    Label {
                        text: "TEST"
                    }
                    Label {
                        text: "TEST"
                    }
                    Label {
                        text: "TEST"
                    }
                    Label {
                        text: "TEST"
                    }
                }
                MouseArea{
                     id: itemMouseArea
                     anchors.fill: parent
                     // @disable-check M223
                     onClicked: {
                         // @ disable-check M222
                         // resultItemClicked(index)
                     }
                 }
            }
            Rectangle {
                width: notificationListView.width
                height: 1
                color: "lightgrey"
            }
        }
        model: 100
    }
}

