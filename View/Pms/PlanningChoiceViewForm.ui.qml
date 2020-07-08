import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"


Flickable {
    property alias planningRectangle: planningRectangle
    property alias newBookingButton: newBookingButton

    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded


    Column {
        id: mainColumn
        spacing: 50
        anchors.centerIn: parent
        topPadding: mainWindow.height / 4

        Rectangle {
            id: planningRectangle
            color: "red"
            width: mainWindow.width / 2
            height: 100
            Label {
                text: qsTr("PLANNING_BY_DAY")
                color: "white"
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: planningRectangle
                // @disable-check M222
                onClicked: mainStackView.push(null, "qrc:/View/Pms/PlanningView.qml")
            }
        }

        Rectangle {
            color: "blue"
            width: mainWindow.width / 2
            height: 100
            Label {
                text: qsTr("PLANNING_BY_ROOM")
                color: "white"
                anchors.centerIn: parent
            }
        }

        Rectangle {
            color: "grey"
            width: mainWindow.width / 2
            height: 100
            Label {
                text: qsTr("PLANNING_BY_TYPE")
                color: "white"
                anchors.centerIn: parent
            }
        }
    }
    RoundButton {
        id: newBookingButton
        text: "+"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
    }
}
