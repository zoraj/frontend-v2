import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

ListView {
    property alias roomRepartitionListView: roomRepartitionListView
    id: roomRepartitionListView
    width: 500
    height: 500
    delegate: Rectangle {
        width: 200
        height: 200
        color: "#ee7272"
        Text {
            text: name
            anchors.centerIn: parent
            font.pointSize: 24
            color: "#fff"
        }
    }
}
/*
Flickable {
    property alias roomRepartitionListView: roomRepartitionListView
    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    Column {
        id: mainColumn
        spacing: 10
        width: parent.width
        topPadding: 100

        ListView {
            id: roomRepartitionListView
            delegate: Rectangle {
                width: 200
                height: 200
                color: "#ee7272"
                Text {
                    text: name
                    anchors.centerIn: parent
                    font.pointSize: 24
                    color: "#fff"
                }
            }
        }
    }
}
*/
