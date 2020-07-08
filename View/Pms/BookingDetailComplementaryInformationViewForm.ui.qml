import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    Column {
        id: mainColumn
        spacing: 10
        width: parent.width
        topPadding: 100
        Rectangle {
            color: "yellow"
            width: 200
            height: 200
        }
    }
}
