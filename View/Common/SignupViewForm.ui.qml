import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import "qrc:/View/Component"


Flickable {
    contentHeight: mainRectangle.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property alias validateButton: validateButton
    property alias activateDeviceButton: activateDeviceButton

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
        height: mainWindow.height - 200
        x: mainWindow.width - width - 100
        y: 100
        clip: true
        // Title
        Label {
            id: label1
            topPadding: 80
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "Souscription d'un etablissement \n"
                + "Create one"
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
                title: qsTr("ESTABLISHMENT_NAME")
                textWidth: mainRectangle.width - 100
            }
            ComboBox {
                editable: true
                id: typeComboBox
                anchors.horizontalCenter: parent.horizontalCenter
                width: mainRectangle.width - 100
            }
            ComboBox {
                editable: true
                id: countryComboBox
                anchors.horizontalCenter: parent.horizontalCenter
                width: mainRectangle.width - 100
            }
            MmcTextField {
                id: addressTextField
                anchors.horizontalCenter: parent.horizontalCenter
                title: qsTr("ESTABLISHMENT_ADDRESS")
                textWidth: mainRectangle.width - 100
            }
            Row {
                spacing: 5
                anchors.horizontalCenter: parent.horizontalCenter
                MmcTextField {
                    id: ownerFirstnameTextField
                    title: qsTr("OWNER FIRSTNAME")
                    textWidth: mainRectangle.width / 2 - 50
                }
                MmcTextField {
                    id: ownerLastnameTextField
                    title: qsTr("OWNER LASTNAME")
                    textWidth: mainRectangle.width / 2 - 50
                }
            }
            Row {
                spacing: 5
                anchors.horizontalCenter: parent.horizontalCenter
                MmcTextField {
                    id: email1TextField
                    title: qsTr("EMAIL")
                    textWidth: mainRectangle.width / 2 - 50
                }
                MmcTextField {
                    id: phoneTextField
                    title: qsTr("PHONE NUMBER")
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
                }

                background: Rectangle {
                    implicitWidth: 350
                    implicitHeight: 60
                    opacity: enabled ? 1 : 0.3
                    border.width: 0
                    radius: 2
                }
            }
        }
    }
}
