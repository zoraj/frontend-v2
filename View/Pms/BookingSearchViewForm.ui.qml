import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import "qrc:/View/Component"

Flickable {
    property alias resultListView: resultListView

    flickableDirection: Flickable.AutoFlickIfNeeded
    RectangularGlow {
        anchors.fill: topRectangle
        glowRadius: 15
        spread: 0.1
        color: "lightgrey"
        cornerRadius: topRectangle.radius + glowRadius
    }
    Rectangle {
        id: topRectangle
        color: "white"
        width: mainWindow.width - 50
        height: 100
        clip: true
        radius: 2
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
        RowLayout {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            y: 20
            MmcTextField {
                title: "Référence"
            }
            MmcTextField {
                title: "Nom"
            }
            MmcDatePicker {
                title: "Date d'arrivée"
            }
            MmcDatePicker {
                title: "Date de départ"
            }
            Button {
                id:searchButton
                text: "Rechercher"
            }
        }
    }
    ListView {
        id: resultListView
        x: 20
        y: topRectangle.height + 40
        height: 500
        width: mainWindow.width - 50
        clip: true
        delegate: Column {
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle {
                id: resultRectangle
                width: resultListView.width
                height: 60
                color: "white"
                Row {
                    spacing: 60
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
            }
            Rectangle {
                width: resultListView.width
                height: 1
                color: "lightgrey"
            }
        }
    }
}

