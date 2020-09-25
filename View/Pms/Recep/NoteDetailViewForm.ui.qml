import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import "qrc:/View/Component"

Flickable {
    flickableDirection: Flickable.AutoFlickIfNeeded
    property alias rateListView: rateListView
    property alias rateDetailListView: rateDetailListView
    property alias clientNoteDetailRectangle:clientNoteDetailRectangle
    property alias clientNoteRectangle:clientNoteRectangle
    property int mainMargin: 10

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
    RectangularGlow {
        anchors.fill: dateRectangle
        glowRadius: 15
        spread: 0.1
        color: "lightgrey"
        cornerRadius: dateRectangle.radius + glowRadius
    }

    Rectangle {
        id: dateRectangle
        color: "white"
        width: 450
        height: 180
        clip: true
        radius: 2
        x: mainMargin
        y: mainMargin
        ColumnLayout {
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.centerIn: parent
            spacing: 5
            Row {
                spacing: 10
                MmcDatePicker {
                    id: arrivalDatePicker
                    title: "Arrivée le"
                }
                MmcSpinBox {
                    id: nbNightSpinBox
                    title: "Nombre de nuité"
                    startValue: 1
                }
            }
            MmcDatePicker {
                id: departureDatePicker
                title: "Départ le"
            }
        }
    }
    Rectangle {
        id: topRectangle
        color: "white"
        width: mainWindow.width - mainMargin - dateRectangle.width - mainMargin - mainMargin
        height: dateRectangle.height
        clip: true
        radius: 2
        anchors.left: dateRectangle.right
        anchors.leftMargin: mainMargin
        y: mainMargin
        ColumnLayout {
            spacing: mainMargin
            anchors.centerIn: parent
            RowLayout {
                spacing: 20
                MmcComboBox {
                    id: qualityTextField
                    textWidth: 80
                }
                MmcTextField {
                    id: fullNameTextField
                    title: "Nom"
                    textWidth: 300
                }
                MmcSpinBox {
                    id: nbPaxSpinBox
                    title: "Nombre de pax"
                    startValue: 1
                }
                MmcSpinBox {
                    id: nbChildSpinBox
                    title: "Dont enfant"
                    startValue: 1
                }
            }
            RowLayout {
                MmcComboBox {
                    title: "Type"
                    textWidth: 150
                }
                MmcComboBox {
                    title: "Chb N°"
                    textWidth: 80
                }
                Rectangle {
                    width: 20
                }

                MmcTextField {
                    title: "Observation"
                    textWidth: 300
                }

                Button {
                    text: "Information de paiement"
                }
            }
        }
    }
    Rectangle {
        id: clientAccountRectangle
        color: "white"
        width: mainWindow.width - mainMargin - mainMargin
        height: 80
        clip: true
        radius: 2
        anchors.top: dateRectangle.bottom
        anchors.left: dateRectangle.left
        anchors.topMargin: mainMargin

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 10
            spacing: 10
            MmcTextField {
                id: clientAccountTextField
                title: "Compte client"
            }
            Button {
                contentItem: Text {
                    font.pointSize: 12
                    text: "..."
                    opacity: 1.0
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: 10
                    implicitHeight: 10
                    border.width: 0
                }
            }
            MmcComboBox {
                title: "Grille de tarif"
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
        id: noteChoiceRectangle
        width: clientAccountRectangle.width
        height: 60
        anchors.top: clientAccountRectangle.bottom
        anchors.topMargin: mainMargin
        anchors.left: dateRectangle.left
        ListView {
            anchors.fill: parent
            orientation: ListView.Horizontal
            spacing: 20
            delegate: RowLayout {
                spacing: 10
                Button {
                    text: "Note client"
                    // @disable-check M223
                    onClicked: {
                        rateRectangle.visible = false
                        rateDetailRectangle.visible = false
                        clientNoteRectangle.visible = true
                        clientNoteDetailRectangle.visible = true
                    }

                }
            }
            model: 10
        }
    }

    // Rate
    Rectangle {
        id: rateTitleRectangle
        width: dateRectangle.width
        height: 40
        color: "#06a8c4"
        anchors.top: noteChoiceRectangle.bottom
        anchors.left: dateRectangle.left
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
        height: mainWindow.height - mainMargin - dateRectangle.height - mainMargin - clientAccountRectangle.height - mainMargin - noteChoiceRectangle.height - mainMargin - rateTitleRectangle.height - mainMargin
        clip: true
        radius: 2


        ListView {
            id: rateListView
            anchors.fill: parent
            clip: true
            header: Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    text: "Date"
                }
                Label {
                    text: "Type de tarif"
                }
                Label {
                    text: "Base"
                }
                Label {
                    text: "Montant"
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
                    //id: roomType
                }
                MmcComboBox {
                    textWidth: 60
                }
                MmcTextField {
                    textWidth: 60
                }
            }
        }
    }

    // Rate detail
    Rectangle {
        id: rateDetailTitleRectangle
        width: topRectangle.width
        height: rateTitleRectangle.height
        color: "#06a8c4"
        anchors.left: rateTitleRectangle.right
        anchors.leftMargin: mainMargin
        anchors.top: noteChoiceRectangle.bottom
        anchors.topMargin: mainMargin
        Label {
            text: "DETAIL FACTURATION au 17/09/20"
            color: "white"
            y: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    // Rate detail
    Rectangle {
        id: rateDetailRectangle
        anchors.left: rateDetailTitleRectangle.left
        color: "white"
        width: rateDetailTitleRectangle.width
        height: rateRectangle.height
        clip: true
        radius: 2
        y: rateRectangle.y

        ListView {
            id: rateDetailListView
            anchors.fill: parent
            clip: true
            header: Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    text: "Prestation"
                }
                Label {
                    text: "Qte"
                }
                Label {
                    text: "PU"
                }
                Label {
                    text: "Remise"
                }
                Label {
                    text: "Promo"
                }
                Label {
                    text: "Commis"
                }
                Label {
                    text: "Early Booking"
                }
                Label {
                    text: "O-N-G"
                }
                Label {
                    text: "Extra"
                }
                Label {
                    text: "Rec"
                }
                Label {
                    text: "Total Net"
                }
            }
            delegate: RowLayout {
                width: rateDetailListView.width - 10
                anchors.horizontalCenter: parent.horizontalCenter
                x: 10
                spacing: 10
                MmcComboBox {
                    textWidth: 120
                }
                MmcTextField {
                    textWidth: 40
                }
                MmcTextField {
                    textWidth: 70
                }
                MmcTextField {
                    textWidth: 70
                }
                MmcTextField {
                    textWidth: 70
                }
                MmcTextField {
                    textWidth: 70
                }
                MmcTextField {
                    textWidth: 70
                }
                Switch {

                }
                Switch {
                }
                Switch {
                }
                Switch {
                }
                Switch {
                }
                MmcTextField {
                    textWidth: 80
                }
            }
        }
    }

    // Client Note
    Rectangle {
        id: clientNoteRectangle
        anchors.left: rateTitleRectangle.left
        anchors.top: rateTitleRectangle.bottom
        color: "white"
        width: rateTitleRectangle.width
        height: mainWindow.height - mainMargin - dateRectangle.height - mainMargin - clientAccountRectangle.height - mainMargin - noteChoiceRectangle.height - mainMargin - rateTitleRectangle.height - mainMargin
        clip: true
        radius: 2


        ListView {
            id: clientNoteListView
            anchors.fill: parent
            clip: true
            header: Row {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    text: "Date"
                }
                Label {
                    text: "Type de tarif"
                }
                Label {
                    text: "Base"
                }
                Label {
                    text: "Montant"
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
                    //id: roomType
                }
                MmcComboBox {
                    textWidth: 60
                }
                MmcTextField {
                    textWidth: 60
                }
            }
        }
    }

    Rectangle {
        id: clientNoteDetailRectangle
        anchors.left: rateDetailTitleRectangle.left
        color: "white"
        width: rateDetailTitleRectangle.width
        height: rateRectangle.height
        clip: true
        radius: 2
        y: rateRectangle.y

        ListView {
            id: clientNoteDetailListView
            anchors.fill: parent
            clip: true
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
                    text: "Rem"
                }
                Label {
                    text: "Comm"
                }
                Label {
                    text: "Total Net"
                }
            }
            delegate: RowLayout {
                width: rateDetailListView.width - 10
                anchors.horizontalCenter: parent.horizontalCenter
                x: 10
                spacing: 10
                MmcComboBox {
                    textWidth: 120
                }
                MmcTextField {
                    textWidth: 40
                }
                MmcTextField {
                    textWidth: 70
                }
                MmcTextField {
                    textWidth: 70
                }
                MmcTextField {
                    textWidth: 70
                }
                MmcTextField {
                    textWidth: 70
                }
                MmcTextField {
                    textWidth: 70
                }
                Switch {

                }
                MmcTextField {
                    textWidth: 80
                }
            }
        }
    }

}
