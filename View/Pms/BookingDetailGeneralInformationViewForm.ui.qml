import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded

    property alias clientAccountListButton: clientAccountListButton
    property alias arrivalDatePicker: arrivalDatePicker
    property alias nbNightSpinBox: nbNightSpinBox
    property alias departureDatePicker: departureDatePicker
    property alias fullNameTextField: fullNameTextField
    property alias groupedSwitch: groupedSwitch
    property alias nbRoomSpinBox: nbRoomSpinBox
    property alias nbPaxSpinBox: nbPaxSpinBox
    property alias nbChildSpinBox: nbChildSpinBox
    property alias clientAccountTextField: clientAccountTextField

    Column {
        id: mainColumn
        spacing: 10
        topPadding: 50

        RowLayout {
            id: firstRow
            MmcDatePicker {
                id: arrivalDatePicker
                title: qsTr("ARRIVAL1")
            }
            MmcSpinBox {
                id: nbNightSpinBox
                title: qsTr("NB_NIGHT")
                startValue: 1
            }
        }

        MmcDatePicker {
            id: departureDatePicker
            title: qsTr("DEPARTURE")
            anchors.left: firstRow.left
        }

        RowLayout {
            anchors.left: firstRow.left
            MmcTextField {
                id: fullNameTextField
                title: qsTr("NAME")
                isMandatory: true
            }
            Switch {
                id:groupedSwitch
                text: qsTr("GROUPED")
            }
        }

        MmcSpinBox {
            id: nbRoomSpinBox
            anchors.left: firstRow.left
            title: qsTr("NB_ROOM")
            startValue: 1
        }

        RowLayout {
            anchors.left: firstRow.left
            MmcSpinBox {
                id: nbPaxSpinBox
                title: qsTr("NB_PERS")
                startValue: 1
            }
            MmcSpinBox {
                id: nbChildSpinBox
                title: qsTr("NB_CHILD")
                startValue: 0
            }
        }
        RowLayout {
            anchors.left: firstRow.left
            MmcTextField {
                id: clientAccountTextField
                title: qsTr("CLIENT_ACCOUNT")
            }
            Button {
                id: clientAccountListButton
                text: ">"
            }
        }
    }
}
