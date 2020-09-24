import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: searchRectangle.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property int mainMargin: 10

    // Search
    Rectangle {
        id: searchRectangle
        x: mainMargin
        y: mainMargin
        width: mainWindow.width - 20
        height: 70
        color: "transparent"
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            MmcComboBox {
                title: "N° Etage"
            }
            MmcComboBox {
                title: "Etat"
            }
        }
    }

    // Rooms
    Rectangle {
        id: mainRectangle
        color: "transparent"
        x: mainMargin
        width: mainWindow.width - 20
        height: mainWindow.height - mainMargin - searchRectangle.height - mainMargin
        clip: true
        radius: 2
        anchors.top: searchRectangle.bottom
        anchors.topMargin: mainMargin

        GridView {
            anchors.fill: parent
            model: roomsModel
            cellWidth: 300
            cellHeight: 90
            delegate: Rectangle {
                color: "white"
                width: 280
                height: 70
                Rectangle {
                    id: roomNumRect
                    width: 70
                    height: 50
                    x: 5
                    anchors.verticalCenter: parent.verticalCenter
                    // @disable-check M223
                    color: {
                        switch (status) {
                        case "DIRTY":
                            "#FCECEA"
                            break;
                        case "OUT":
                            "#FFF7EA"
                            break;
                        case "BUSY":
                            "#F4F7FA"
                            break;
                        case "CLEAN":
                            "#E9FAF0"
                            break;
                        }
                    }
                    Label {
                        x: 5
                        anchors.centerIn: parent
                        text: num
                        font.bold: true
                        font.pointSize: 21
                        // @disable-check M223
                        color: {
                            switch (status) {
                            case "DIRTY":
                                "#E33235"
                                break;
                            case "OUT":
                                "#F5A631"
                                break;
                            case "BUSY":
                                "#98B2C3"
                                break;
                            case "CLEAN":
                                "#21D267"
                                break;
                            }
                        }
                    }
                }
                Label {
                    id: statusLabel
                    text: status
                    anchors.left: roomNumRect.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 19
                    // @disable-check M223
                    color: {
                        switch (status) {
                        case "DIRTY":
                            "#E33235"
                            break;
                        case "OUT":
                            "#F5A631"
                            break;
                        case "BUSY":
                            "#98B2C3"
                            break;
                        case "CLEAN":
                            "#21D267"
                            break;
                        }
                    }
                }
                Label {
                    y: 2
                    anchors.left: statusLabel.right
                    anchors.leftMargin: 60
                    font.pointSize: 8
                    color: "#98B2C3"
                    text: "Jusqu'au 15/11"
                    visible: status === "OUT"
                }
                Label {
                    y: parent.height - 12
                    anchors.left: statusLabel.right
                    anchors.leftMargin: 90
                    font.pointSize: 8
                    color: "#98B2C3"
                    text: "3 Pers"
                    visible: status === "BUSY"
                }
            }
        }
    }
}
