import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12

Flickable {
    contentHeight: planningRectangle.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property alias planningGrid: planningGrid
    property alias planningRectangle: planningRectangle
    property alias containerPlanningRectangle: containerPlanningRectangle
    property alias newNoteButton: newNoteButton

    RectangularGlow {
        anchors.fill: topRectangle
        glowRadius: 15
        spread: 0.1
        color: "lightgrey"
        cornerRadius: topRectangle.radius + glowRadius
    }
    RectangularGlow {
        anchors.fill: planningRectangle
        glowRadius: 15
        spread: 0.1
        color: "lightgrey"
        cornerRadius: topRectangle.radius + glowRadius
    }

    Rectangle {
        id: topRectangle
        width: mainWindow.width - 50
        height: 80
        clip: true
        radius: 2
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
        RowLayout {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            y: 20
            Button {
                text: "Tout le planning"
            }
            Button {
                text: "Planning Jour"
            }
            Button {
                text: "Planning Mois"
            }
            Button {
                text: "Planning / Type"
            }
            Button {
                text: "Planning / Chambre"
            }
            Button {
                text: "Planning / Segment"
            }
            Button {
                id: newNoteButton
                text: "Nouvelle Réservation"
            }

        }
    }

    Rectangle {
        id: planningRectangle
        width: mainWindow.width - 50
        height: mainWindow.height - 220
        radius: 2
        clip: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: topRectangle.bottom
        anchors.topMargin: 10
        color: "lightgrey"
        Grid {
            id: planningGrid
            columns: 365
            spacing: 1
            x: -hbar.position * width
            y: -vbar.position * height

            Repeater {
                model: 7300
                Rectangle {
                    width: 110
                    height: 40
                    // @disable-check M223
                    color: {
                        if (index < 365) return "#94c7cf"
                        if (index % 365 === 0) return "#94c7cf"
                        return "white"
                    }

                    Text {
                        id: name
                        color: "black"
                        anchors.centerIn: parent
                        // @disable-check M223
                        text: {
                            if (index === 0) return "CHAMBRES"
                            // @disable-check M222
                            if (index < 365) return getDate(index - 1)
                            // @disable-check M222
                            if (index % 365 === 0) return getRoom(index / 365)
                            return ""
                        }
                    }
                }
            }
        }


        Rectangle {
            id: containerPlanningRectangle
            x: -hbar.position * width + 150
            y: -vbar.position * height + 40
            width: planningGrid.width
            height: planningGrid.height
            color: "transparent"
        }
        ScrollBar {
            id: vbar
            hoverEnabled: true
            active: hovered || pressed
            orientation: Qt.Vertical
            size: planningRectangle.height / planningGrid.height
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
        ScrollBar {
            id: hbar
            hoverEnabled: true
            active: hovered || pressed
            orientation: Qt.Horizontal
            size: planningRectangle.width / planningGrid.width
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }
}
