import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: mainRectangle.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property alias signinButton: signinButton

    RectangularGlow {
        anchors.fill: mainRectangle
        glowRadius: 15
        spread: 0.1
        color: "lightsteelblue"
        cornerRadius: mainRectangle.radius + glowRadius
    }
    Rectangle {
        id: mainRectangle
        color: "white"
        width: mainWindow.width / 2
        height: 400
        clip: true
        radius: 2
        anchors.horizontalCenter: parent.horizontalCenter
        y: mainWindow.height / 2 - mainRectangle.height / 2
        Label {
            id: label1
            anchors.horizontalCenter: parent.horizontalCenter
            text: "S'authentifier"
            font.pointSize: 24
            y: 10
        }
        // Form start
        Column {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: label1.bottom
            topPadding: 100
            MmcTextField {
                id: loginTextField
                anchors.horizontalCenter: parent.horizontalCenter
                title: "Login"
                textWidth: mainRectangle.width / 2
            }
            MmcTextField {
                id: passwordTextField
                anchors.horizontalCenter: parent.horizontalCenter
                title: "Mot de passe"
                isPassword: true
                textWidth: mainRectangle.width / 2
            }
            Button {
                id: signinButton
                text: "Valider"
            }
        }
    }
}
/*
Flickable {
    property alias signinButton: signinButton
    property alias loginTextField: loginTextField
    property alias passwordTextField: passwordTextField

    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded

    Column {
        id: mainColumn
        spacing: 10
        width: parent.width
        topPadding: mainWindow.height / 4
        anchors.centerIn: parent

        Image {
            source: "qrc:/Asset/Images/verouillage_caisse.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "If you don't have any account yet. "
                + "Create one"
        }
        MmcTextField {
            id: loginTextField
            anchors.horizontalCenter: parent.horizontalCenter
            title: qsTr("LOGIN")
        }
        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            MmcTextField {
                id: passwordTextField
                title: qsTr("PASSWORD")
                isPassword: true
            }
            Button {
                id: signinButton
                text: ">"
            }
        }
    }
}
*/
