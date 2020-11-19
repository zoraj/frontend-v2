import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import "qrc:/View/Component"

Flickable {
    flickableDirection: Flickable.AutoFlickIfNeeded

    Rectangle {
        id: rectangle1
        width: mainWindow.width / 3
        height: 90
        x: globalPadding
        y: globalPadding
        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 50
            leftPadding: globalPadding
            MmcDatePicker {
                id: arrivalDatePicker
                title: "Arrivée le"
            }
            MmcTextField {
                id: arrivalHourTextField
                title: "à"
                textWidth: 50
            }
        }
    }
    Rectangle {
        id: rectangle2
        width: mainWindow.width / 3 - globalPadding
        height: rectangle1.height
        anchors.left: rectangle1.right
        anchors.leftMargin: 1
        anchors.top: rectangle1.top
        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 50
            leftPadding: globalPadding
            MmcSpinBox {
                id: nbNightSpinBox
                title: "Nombre de nuité"
                startValue: 1
            }
        }
    }

    Rectangle {
        id: rectangle3
        width: mainWindow.width / 3  - globalPadding
        anchors.top: rectangle1.top
        anchors.left: rectangle2.right
        anchors.leftMargin: 1
        height: rectangle1.height
        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 50
            leftPadding: globalPadding

            MmcDatePicker {
                id: departureDatePicker
                title: "Départ le"
            }
            /*
            Switch {
                id:groupedSwitch
                text: "Réservation Groupée ?"
            }*/
        }
    }
    Rectangle {
        id: rectangle4
        width: rectangle1.width
        height: rectangle1.height
        anchors.top: rectangle1.bottom
        anchors.left: rectangle1.left
        anchors.topMargin: 1
        Row {
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: globalPadding
            MmcTextField {
                id: fullNameTextField
                title: "Nom (CARDEX FIELD)"
                textWidth: rectangle4.width - globalPadding * 2
            }
        }
    }
    Rectangle {
        id: rectangle5
        width: rectangle2.width + rectangle3.width
        height: rectangle4.height
        anchors.top: rectangle1.bottom
        anchors.topMargin: 1
        anchors.left: rectangle4.right
        anchors.leftMargin: 1
        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 15
            leftPadding: globalPadding

            MmcSpinBox {
                id: nbRoomSpinBox
                title: "Nombre de chambre"
                startValue: 1
            }
            MmcSpinBox {
                id: nbPaxSpinBox
                title: "Nombre de pax"
                startValue: 1
            }
            MmcSpinBox {
                id: nbChildSpinBox
                title: "Nombre d'enfant"
                startValue: 1
            }
            Switch {
                id:groupedSwitch
                text: "Réservation Groupée ?"
            }
        }
    }
    Label {
        id: label1
        text: "Information"
        anchors.top: rectangle4.bottom
        anchors.topMargin: 20
        anchors.left: rectangle1.left
    }

    Rectangle {
        id: rectangle6
        width: rectangle1.width
        height: mainWindow.height - rectangle1.height - rectangle4.height - label1.height - 150
        anchors.left: label1.left
        anchors.top: label1.bottom
        anchors.topMargin: 10
        Column {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter
            y: 10
            MmcComboBox {
                title: "Grille tarif"
            }
            MmcComboBox {
                title: "Compte client"
            }
            MmcComboBox {
                title: "Type client"
            }
            MmcComboBox {
                title: "Segmentation"
            }
            MmcComboBox {
                title: "Prescripteur"
            }
            MmcComboBox {
                title: "Nationalité"
            }
        }
    }

    Label {
        id: label2
        text: "Tarif et ventillation"
        anchors.top: rectangle5.bottom
        anchors.topMargin: 20
        anchors.left: rectangle6.right
    }

    Rectangle {
        id: rectangle7
        width: rectangle5.width
        height: rectangle6.height
        anchors.top: rectangle6.top
        anchors.left: rectangle6.right
        anchors.leftMargin: 1


    }
}
