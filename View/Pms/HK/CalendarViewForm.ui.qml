import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "qrc:/View/Component"

Flickable {
    flickableDirection: Flickable.AutoFlickIfNeeded
    property int mainMargin: 10

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
    }
    Calendar {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: topRectangle.bottom
        anchors.topMargin: mainMargin
        width: mainWindow.width - 50
        height: mainWindow.height - 250
        weekNumbersVisible: true

        style: CalendarStyle {
                gridVisible: true
                dayDelegate: Rectangle {
                    // @disable-check M222
                    color: isToday(styleData.date) ? "#F4F7FA" : "white"
                    Label {
                        // @disable-check M222
                        text: styleData.date.getDate()
                        x: 5
                        y : 5
                        // @disable-check M223
                        color: {
                            // @disable-check M222
                            if (isToday(styleData.date)) return "#98B2C3";
                            // @disable-check M222
                            if (isDateWeekend(styleData.date) && styleData.visibleMonth) return "#E33235";
                            if (styleData.visibleMonth && styleData.valid) return "black";
                            return "lightgrey"
                        }

                        font.pointSize: 24
                    }
                    Rectangle {
                        width: parent.width / 2
                        height: 14
                        x: parent.width / 2
                        color: "#E9FAF0"

                        Label {
                            x: 2
                            y: 2
                            font.pointSize: 8
                            color: "#21D267"
                            // @disable-check M222
                            text: getMaidList(styleData.date)
                        }
                    }

                    Rectangle {
                        width: parent.width
                        height: 1
                        color: "transparent"
                        anchors.bottom: parent.bottom
                    }

                    Rectangle {
                        width: 1
                        height: parent.height
                        color: "transparent"
                        anchors.right: parent.right
                    }
                }
            }
    }
}
