import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: topRectangle.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property int mainMargin: 10

    // Room Origin
    Rectangle {
        id: topRectangle
        x: mainMargin
        y: mainMargin
        color: "white"
        width: mainWindow.width - 25
        height: 70
        clip: true
        radius: 2

        Row {
            anchors.centerIn: parent
            spacing: mainMargin
            MmcDatePicker {
                title: "Arrivée du"
            }
            Button {
                text: "Automatique"
            }
            Button {
                text: "Valider"
            }
        }
    }

    Rectangle {
        id: roomTitleRectangle
        width: topRectangle.width
        height: 40
        color: "#06a8c4"
        anchors.top: topRectangle.bottom
        anchors.left: topRectangle.left
        anchors.topMargin: mainMargin
        Label {
            text: "Liste des arrivées du 17/09/2020"
            color: "white"
            y: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: reservationRectangle
        anchors.left: roomTitleRectangle.left
        anchors.top: roomTitleRectangle.bottom
        color: "transparent"
        width: roomTitleRectangle.width
        height: mainWindow.height - mainMargin - topRectangle.height - mainMargin - roomTitleRectangle.height - mainMargin - mainMargin
        clip: true
        radius: 2

        ListView {
            id: reservationListView
            anchors.fill: parent
            clip: true
            model: 100
            spacing: 1

            delegate: Rectangle {
               width: reservationListView.width
               height: 60
               color: "white"
               Row {
                   spacing: 10
                   x: mainMargin
                   MmcComboBox {
                       textWidth: 100
                   }
                   Label {
                       x: mainMargin
                       anchors.verticalCenter: parent.verticalCenter
                       text: "DOUBLE  Jean Onari Arrivé le 17/12/20, départ le 21/12/20 - Tarif"
                   }
                   Button {
                       text: "Réservation >"
                   }

               }
           }
        }
    }
}
