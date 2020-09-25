import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import "qrc:/View/Component"

Flickable {
    flickableDirection: Flickable.AutoFlickIfNeeded
    property alias ventillationAndRatingListView: ventillationAndRatingListView
    property alias stkAutreButton: stkAutreButton
    property alias paymentButton: paymentButton

    RectangularGlow {
        anchors.fill: topRectangle
        glowRadius: 15
        spread: 0.1
        color: "lightgrey"
        cornerRadius: topRectangle.radius + glowRadius
    }

    RectangularGlow {
        anchors.fill: clientAccountRectangle
        glowRadius: 15
        spread: 0.1
        color: "lightgrey"
        cornerRadius: clientAccountRectangle.radius + glowRadius
    }

    Rectangle {
        id: topRectangle
        color: "white"
        width: mainWindow.width - 50
        height: 200
        clip: true
        radius: 2
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
        ColumnLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 25
            y: 25
            Row {
                spacing: 20
                MmcDatePicker {
                    id: arrivalDatePicker
                    title: "Arrivée le"
                }
                MmcTextField {
                    id: arrivalHourTextField
                    title: "à"
                    textWidth: 50
                }
                MmcSpinBox {
                    id: nbNightSpinBox
                    title: "Nombre de nuité"
                    startValue: 1
                }
                MmcDatePicker {
                    id: optionDatePicker
                    title: "Option"
                }
                MmcDatePicker {
                    id: departureDatePicker
                    title: "Départ le"
                }
                MmcTextField {
                    id: fullNameTextField
                    title: "Nom"
                    textWidth: 400
                }
            }
            Row {
                spacing: 20
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
                Button {
                    id: stkAutreButton
                    text: "Stock Autres"
                }
                Button {
                    id: paymentButton
                    text: "Information de paiement"
                }
            }
        }
    }
    Rectangle {
        id: clientAccountRectangle
        color: "white"
        width: mainWindow.width - 50
        height: 100
        clip: true
        radius: 2
        anchors.horizontalCenter: parent.horizontalCenter
        y: topRectangle.height + 35
        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 10
            MmcTextField {
                id: cardexTextField
                title: "Cardex"
                textWidth: 200
            }
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
    Rectangle {
        id: subtitleRectangle
        width: mainWindow.width - 50
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#06a8c4"
        y: topRectangle.height + clientAccountRectangle.height + 50
        Label {
            text: "Ventillation et tarification"
            color: "white"
            y: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: bottomRectangle
        //anchors.top: topRectangle.bottom
        color: "white"
        width: mainWindow.width - 50
        height: mainWindow.height - topRectangle.height + subtitleRectangle.height - clientAccountRectangle.height - 200
        clip: true
        radius: 2
        anchors.horizontalCenter: parent.horizontalCenter
        y: topRectangle.height + subtitleRectangle.height + clientAccountRectangle.height + 50

        ListView {
            id: ventillationAndRatingListView
            anchors.fill: parent
            clip: true
            delegate: RowLayout {
                width: ventillationAndRatingListView.width - 10
                anchors.horizontalCenter: parent.horizontalCenter
                x: 10
                spacing: 20
                Label {
                    text: "1"
                }
                MmcComboBox {
                    //id: roomType
                }
                MmcComboBox {
                    //id:
                }
                MmcTextField {
                    //title: "Nb Adulte"
                    textWidth: 60
                }
                MmcTextField {
                    title: ""
                    textWidth: 60
                }
                MmcDatePicker {
                    title: ""
                }
                MmcDatePicker {
                    title: ""
                }
                MmcComboBox {
                    //title: "Tarif"
                }
                MmcComboBox {
                    //title: "Base"
                    textWidth: 60
                }
                Label {
                    text: "1000"
                }

            }
            header: Row {
                spacing: 80
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    text: "Nb Chb"
                }
                Label {
                    text: "Type de chambre"
                }
                Label {
                    text: "#chambre"
                }
                Label {
                    text: "Nb Adulte"
                }
                Label {
                    text: "Nb Enf."
                }
                Label {
                    text: "Date début."
                }
                Label {
                    text: "Date fin."
                }
                Label {
                    text: "Tarif"
                }
                Label {
                    text: "Base"
                }
                Label {
                    text: "Montant"
                }
            }
        }
    }
}
