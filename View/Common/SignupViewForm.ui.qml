import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"


Flickable {
    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded

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

    Column {
        id: mainColumn
        spacing: 10
        width: parent.width
        topPadding: 30
        anchors.centerIn: parent

        Image {
            source: "qrc:/Asset/Images/nouvelle_note@4x.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "Souscription d'un etablissement \n"
                + "Create one"
        }
        MmcTextField {
            id: nameTextField
            anchors.horizontalCenter: parent.horizontalCenter
            title: qsTr("ESTABLISHMENT_NAME")
            textWidth: parent.width / 2
        }
        ComboBox {
            editable: true
            id: typeComboBox
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width / 2
        }

        ComboBox {
            editable: true
            id: countryComboBox
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width / 2
        }

        MmcTextField {
            id: addressTextField
            anchors.horizontalCenter: parent.horizontalCenter
            title: qsTr("ESTABLISHMENT_ADDRESS")
            textWidth: parent.width / 2
        }
        MmcTextField {
            id: ownerFirstnameTextField
            anchors.horizontalCenter: parent.horizontalCenter
            title: qsTr("OWNER FIRSTNAME")
            textWidth: parent.width / 2
        }
        MmcTextField {
            id: ownerLastnameTextField
            anchors.horizontalCenter: parent.horizontalCenter
            title: qsTr("OWNER LASTNAME")
            textWidth: parent.width / 2
        }
        MmcTextField {
            id: email1TextField
            anchors.horizontalCenter: parent.horizontalCenter
            title: qsTr("EMAIL")
            textWidth: parent.width / 2
        }
        MmcTextField {
            id: email2TextField
            anchors.horizontalCenter: parent.horizontalCenter
            title: qsTr("RETYPE_EMAIL")
            textWidth: parent.width / 2
        }
        MmcTextField {
            id: phoneTextField
            anchors.horizontalCenter: parent.horizontalCenter
            title: qsTr("PHONE NUMBER")
            textWidth: parent.width / 2
        }
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
