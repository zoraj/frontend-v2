import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Flickable {
    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded

    Column {
        id: mainColumn
        spacing: 20
        anchors.centerIn: parent
        topPadding: mainWindow.height / 4

        Rectangle {
            id: planningRectangle
            color: "brown"
            width: 300
            height: 80
            Label {
                text: qsTr("PLANNING")
                color: "white"
                anchors.centerIn: parent
            }
        }
    }
}
