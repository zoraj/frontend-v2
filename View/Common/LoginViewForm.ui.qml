import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

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
