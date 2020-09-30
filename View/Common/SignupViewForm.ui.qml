import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import "qrc:/View/Component"
import cloud.multimicro.mmc.frontend 1.0

Flickable {
    contentHeight: mainRectangle.height
    width: mainWindow.width / 3
    flickableDirection: Flickable.AutoFlickIfNeeded
    property alias validateButton: validateButton
    property alias activateDeviceButton: activateDeviceButton
    property alias nameTextField: nameTextField
    property alias typeComboBox: typeComboBox
    property alias countryComboBox: countryComboBox
    property alias addressTextField: addressTextField
    property alias ownerFirstnameTextField: ownerFirstnameTextField
    property alias ownerLastnameTextField: ownerLastnameTextField
    property alias email1TextField: email1TextField
    property alias phoneTextField: phoneTextField

    Label {
        id: title1
        x: 100
        y: mainWindow.height / 4
        color: "white"
        text: "La gestion de votre etablissement en toute sérenité."
        font.bold: true
        font.pointSize: 36
        width: mainWindow.width / 3 + 150
        clip: true
        elide: Text.ElideLeft
        wrapMode: Text.Wrap
    }
    Label {
        anchors.top: title1.bottom
        anchors.left: title1.left
        anchors.topMargin: 10
        color: "white"
        text: "PMS, POS, Housekeeping. Un email vous sera envoyé après l'inscription contenant le lien de confirmation et l'accès backoffice."
        font.pointSize: 18
        width: title1.width
        clip: true
        elide: Text.ElideLeft
        wrapMode: Text.Wrap
    }

    RectangularGlow {
        anchors.fill: mainRectangle
        glowRadius: 15
        spread: 0.1
        color: "lightsteelblue"
        cornerRadius: mainRectangle.radius + glowRadius
    }
    // Main Rectangle
    Rectangle {
        id: mainRectangle
        //anchors.fill: parent
        color: "white"
        radius: 2
        width: mainWindow.width / 3
        height: mainWindow.height - 100
        x: mainWindow.width - width - 100
        y: (mainWindow.height - mainRectangle.height) / 2
        clip: true

        // Title
        Label {
            id: label1
            topPadding: 80
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "Création d'un nouveau \n compte MMC"
            font.pointSize: 18
            color: "#374866"
        }

        // Form start
        Column {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: label1.bottom
            topPadding: 100
            MmcTextField {
                id: nameTextField
                anchors.horizontalCenter: parent.horizontalCenter
                title: "Nom de l'etablissement"
                textWidth: mainRectangle.width - 100
            }
            MmcComboBox {
                id: typeComboBox
                anchors.horizontalCenter: parent.horizontalCenter
                width: mainRectangle.width - 100
                title: "Type"
                textWidth: mainRectangle.width - 100
            }
            MmcComboBox {
                id: countryComboBox
                anchors.horizontalCenter: parent.horizontalCenter
                width: mainRectangle.width - 100
                title: "Pays"
                textWidth: mainRectangle.width - 100
            }
            MmcTextField {
                id: addressTextField
                anchors.horizontalCenter: parent.horizontalCenter
                title: "Adresse"
                textWidth: mainRectangle.width - 100
            }
            Row {
                spacing: 5
                anchors.horizontalCenter: parent.horizontalCenter
                MmcTextField {
                    id: ownerFirstnameTextField
                    title: "Prénom"
                    textWidth: mainRectangle.width / 2 - 50
                }
                MmcTextField {
                    id: ownerLastnameTextField
                    title: "Nom"
                    textWidth: mainRectangle.width / 2 - 50
                }
            }
            Row {
                spacing: 5
                anchors.horizontalCenter: parent.horizontalCenter
                MmcTextField {
                    id: email1TextField
                    title: "Email"
                    textWidth: mainRectangle.width / 2 - 50
                }
                MmcTextField {
                    id: phoneTextField
                    title: "Téléphone"
                    textWidth: mainRectangle.width / 2 - 50
                }
            }
            Button {
                id: validateButton
                text: "S'enregistrer"
                width: mainRectangle.width / 2
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: activateDeviceButton
                anchors.horizontalCenter: parent.horizontalCenter
                contentItem: Text {
                    font.pointSize: 12
                    font.underline: true
                    opacity: enabled ? 1.0 : 0.3
                    //color: "#06a8c4"
                    text: "Vous avez déjà un compte. Activer ce poste."
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    color: "#374866"
                }

                background: Rectangle {
                    implicitWidth: 350
                    implicitHeight: 60
                    opacity: enabled ? 1 : 0.3
                    border.width: 0
                    radius: 2
                    color: "transparent"
                }
            }
        }
    }
}
