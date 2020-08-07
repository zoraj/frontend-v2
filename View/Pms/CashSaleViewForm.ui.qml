import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    anchors.fill: parent
    property alias cashSellingGridView: cashSellingGridView
    property alias newSaleButton: newSaleButton

    GridView {
        id: cashSellingGridView
        topMargin: 30
        leftMargin: 30
        anchors.fill: parent
        cellWidth: 200
        cellHeight: 200
        delegate: Rectangle {
            color: "#94c7cf"
            width: cashSellingGridView.cellWidth - 10
            height: cashSellingGridView.cellHeight - 10
        }
    }

    RoundButton {
        id: newSaleButton
        text: "+"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
    }
}
