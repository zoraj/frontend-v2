import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: headerRectangle.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property int mainMargin: 10
    property alias rateListView: rateListView

    RectangularGlow {
        anchors.fill: headerRectangle
        glowRadius: 15
        spread: 0.1
        color: "lightgrey"
        cornerRadius: headerRectangle.radius + glowRadius
    }
    Rectangle {
        id: headerRectangle
        color: "white"
        width: mainWindow.width - 100
        height: 300
        clip: true
        radius: 2
        anchors.horizontalCenter: parent.horizontalCenter
        y: mainMargin

        Column {
            anchors.centerIn: parent
            spacing: mainMargin
            MmcTextField {
                id: nameTextField
                anchors.horizontalCenter: parent.horizontalCenter
                title: "Nom"
                textWidth: headerRectangle.width / 2
            }
            Row {
                spacing: mainMargin
                MmcComboBox {
                    id:segComboBox
                    title: "Segmentation"
                    textWidth: headerRectangle.width / 4 - 10
                }
                MmcComboBox {
                    id: clientAccountComboBox
                    title: "Compte client"
                    textWidth: headerRectangle.width / 4 - 10
                }
            }

            Row {
                spacing: mainMargin
                MmcTextField {
                    id: remGlobalTextField
                    title: "Remise globale"
                }
                MmcTextField {
                    id: commGlobalTextField
                    title: "Commission globale"
                }
            }
        }
    }
    // Rate
    Rectangle {
        id: rateTitleRectangle
        width: headerRectangle.width
        height: 40
        color: "#06a8c4"
        anchors.top: headerRectangle.bottom
        anchors.left: headerRectangle.left
        anchors.topMargin: mainMargin
        Label {
            text: "FACTURATION - TOTAL: 2000€"
            color: "white"
            y: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Rectangle {
        id: rateRectangle
        anchors.left: rateTitleRectangle.left
        anchors.top: rateTitleRectangle.bottom
        color: "white"
        width: rateTitleRectangle.width
        height: mainWindow.height - mainMargin - headerRectangle.height - mainMargin - rateTitleRectangle.height - mainMargin - mainMargin
        clip: true
        radius: 2

        ListView {
            id: rateListView
            anchors.fill: parent
            clip: true
            model: 100
            header: Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    text: "Date"
                }
                Label {
                    text: "Designation"
                }
                Label {
                    text: "Qte"
                }
                Label {
                    text: "P.U"
                }
                Label {
                    text: "Remise"
                }
                Label {
                    text: "Commission"
                }
                Label {
                    text: "Total NET"
                }
            }
            delegate: RowLayout {
                width: rateListView.width - 10
                //anchors.horizontalCenter: parent.horizontalCenter
                x: 10
                spacing: 5
                Label {
                    text: "17/09/20"
                }
                MmcComboBox {
                    //id: prestationComboBox
                    textWidth: 300
                }
                MmcTextField {
                    textWidth: 60
                }
                MmcTextField {
                    textWidth: 60
                }
                MmcTextField {
                    textWidth: 60
                }
                MmcTextField {
                    textWidth: 60
                }
                MmcTextField {
                    textWidth: 60
                }
                MmcTextField {
                    textWidth: 120
                }
            }
        }
    }
}
