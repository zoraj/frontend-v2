import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: roomRectangle.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property int mainMargin: 10

    // Search
    Rectangle {
        id: roomRectangle
        x: mainMargin
        y: mainMargin
        width: mainWindow.width - 20
        height: 100
        color: "transparent"
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            MmcComboBox {
                title: "N° Chambre"
            }
        }
    }
    ListView {
        id: controlListView
        width: mainWindow.width - mainMargin
        height: mainWindow.height - 370
        anchors.top: roomRectangle.bottom
        anchors.topMargin: mainMargin
        anchors.horizontalCenter: parent.horizontalCenter
        model: 100
        clip: true
        spacing: 1
        delegate: Rectangle {
            width: parent.width
            height: 70
            x: 10
            Row {
                spacing: 100
                MmcComboBox {
                    textWidth: 200
                }
                Switch {

                }
            }
        }
    }

    TextArea {
        id: noticeTextArea
        x: mainMargin
        anchors.top: controlListView.bottom
        width: mainWindow.width - mainMargin
        height: 100
        placeholderText: qsTr("Notes")

    }
    Button {
        x: mainMargin
        anchors.top: noticeTextArea.bottom
        anchors.topMargin: mainMargin
        text: "Valider"
    }
}
