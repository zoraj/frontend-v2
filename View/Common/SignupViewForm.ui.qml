import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import "qrc:/View/Component"


Flickable {
    contentHeight: mainRectangle.height
    flickableDirection: Flickable.AutoFlickIfNeeded

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
            MmcTextField {
                id: ownerFirstnameTextField
                anchors.horizontalCenter: parent.horizontalCenter
                title: qsTr("OWNER FIRSTNAME")
                textWidth: mainRectangle.width - 100
            }
            MmcTextField {
                id: ownerLastnameTextField
                anchors.horizontalCenter: parent.horizontalCenter
                title: qsTr("OWNER LASTNAME")
                textWidth: mainRectangle.width - 100
            }
            MmcTextField {
                id: email1TextField
                anchors.horizontalCenter: parent.horizontalCenter
                title: qsTr("EMAIL")
                textWidth: mainRectangle.width - 100
            }
            MmcTextField {
                id: email2TextField
                anchors.horizontalCenter: parent.horizontalCenter
                title: qsTr("RETYPE_EMAIL")
                textWidth: mainRectangle.width - 100
            }
            MmcTextField {
                id: phoneTextField
                anchors.horizontalCenter: parent.horizontalCenter
                title: qsTr("PHONE NUMBER")
                textWidth: mainRectangle.width - 100
            }
        }
    }
}

/*
Flickable {
    property alias activateDeviceButton: activateDeviceButton
    property alias validateButton: validateButton
    property alias nameTextField: nameTextField
    property alias addressTextField: addressTextField
    property alias ownerFirstnameTextField: ownerFirstnameTextField
    property alias ownerLastnameTextField: ownerLastnameTextField
    property alias email1TextField: email1TextField
    property alias email2TextField: email2TextField
    property alias phoneTextField: phoneTextField
    property alias typeComboBox: typeComboBox
    property alias countryComboBox: countryComboBox
    property alias busyIndicator: busyIndicator

    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded

    Column {
        id: mainColumn
        spacing: 10
        width: parent.width
        topPadding: 30
        anchors.centerIn: parent





        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                id: validateButton
                text: qsTr("SIGNUP")
            }
            BusyIndicator {
                id: busyIndicator
                opacity: 0
            }

            Button {
                id: activateDeviceButton
                text: qsTr("YOU HAVE ALREADY AN ACCOUNT. ACTIVATE IT")

                contentItem: Text {
                    font.pointSize: 12
                    font.underline: true
                    opacity: enabled ? 1.0 : 0.3
                    //color: "#06a8c4"
                    text: "YOU HAVE ALREADY AN ACCOUNT. ACTIVATE IT"
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
*/
