import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: roomOriginRectangle.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property int mainMargin: 10

    // Room Origin
    Rectangle {
        id: roomOriginRectangle
        x: mainMargin
        y: mainMargin
        color: "white"
        width: mainWindow.width / 2
        height: 200
        clip: true
        radius: 2

        Column {
            anchors.centerIn: parent
            spacing: mainMargin
            MmcComboBox {
                anchors.horizontalCenter: parent.horizontalCenter
                title: "Chambre origine"
                textWidth: roomOriginRectangle.width / 2
            }
            Label {
                text: "NOM"
            }
            Label {
                text: "ARRIVEE"
            }
            Label {
                text: "DEPART"
            }
            Label {
                text: "TYPE DE NOTE"
            }
        }
    }
    Rectangle {
        id: roomOriginTitleRectangle
        width: roomOriginRectangle.width
        height: 40
        color: "#06a8c4"
        anchors.top: roomOriginRectangle.bottom
        anchors.left: roomOriginRectangle.left
        anchors.topMargin: mainMargin
        Label {
            text: "NOTE CLIENT"
            color: "white"
            y: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Rectangle {
        id: rateRectangle
        anchors.left: roomOriginTitleRectangle.left
        anchors.top: roomOriginTitleRectangle.bottom
        color: "transparent"
        width: roomOriginTitleRectangle.width
        height: mainWindow.height - mainMargin - roomOriginRectangle.height - mainMargin - roomOriginTitleRectangle.height - mainMargin - mainMargin
        clip: true
        radius: 2

        ListView {
            id: rateListView
            anchors.fill: parent
            clip: true
            model: 100
            spacing: 1

            delegate: Rectangle {
               width: rateListView.width
               height: 40
               color: "white"
               Label {
                   x: 10
                   anchors.verticalCenter: parent.verticalCenter
                   text: "17/12/20     (2) LOCATION APPARTEMENT - 300€"
               }
           }
        }
    }

    // Target Room
    Rectangle {
        id: roomTargetRectangle
        y: mainMargin
        anchors.left: roomOriginRectangle.right
        anchors.rightMargin: mainMargin
        anchors.leftMargin: mainMargin
        color: "white"
        width: mainWindow.width / 2 - 30
        height: 200
        clip: true
        radius: 2

        Column {
            anchors.centerIn: parent
            spacing: mainMargin
            MmcComboBox {
                anchors.horizontalCenter: parent.horizontalCenter
                title: "Chambre origine"
                textWidth: roomTargetRectangle.width / 2
            }
            Label {
                text: "NOM"
            }
            Label {
                text: "ARRIVEE"
            }
            Label {
                text: "DEPART"
            }
            Label {
                text: "TYPE DE NOTE"
            }
        }
    }
    Rectangle {
        id: roomTargetTitleRectangle
        width: roomTargetRectangle.width
        height: roomOriginTitleRectangle.height
        color: "#06a8c4"
        anchors.top: roomTargetRectangle.bottom
        anchors.left: roomTargetRectangle.left
        anchors.topMargin: mainMargin
        Label {
            text: "NOTE CLIENT"
            color: "white"
            y: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Rectangle {
        id: rateTargetRectangle
        anchors.left: roomTargetTitleRectangle.left
        anchors.top: roomTargetTitleRectangle.bottom
        color: "transparent"
        width: roomTargetTitleRectangle.width
        height: rateRectangle.height
        clip: true
        radius: 2

        ListView {
            id: rateTargetListView
            anchors.fill: parent
            clip: true
            model: 2
            spacing: 1

            delegate: Rectangle {
               width: rateTargetListView.width
               height: 40
               color: "white"
               Label {
                   x: 10
                   anchors.verticalCenter: parent.verticalCenter
                   text: "17/12/20     (2) LOCATION APPARTEMENT - 300€"
               }
           }
        }
    }



}
