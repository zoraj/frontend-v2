import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded

    property alias clientAccountListButton: clientAccountListButton
    Column {
        id: mainColumn
        spacing: 10
        width: parent.width
        topPadding: 100

        RowLayout {
            id: firstRow
            anchors.horizontalCenter: parent.horizontalCenter
            MmcTextField {
                id: arrivalTextField
                title: qsTr("ARRIVAL")
            }
            MmcSpinBox {
                id: nbNightSpinBox
                title: qsTr("NB_NIGHT")
                startValue: 1
            }
        }

        MmcDatePicker {
            id: departureTextField
            title: qsTr("DEPARTURE")
            anchors.left: firstRow.left
        }
        MmcTextField {
            id: fullNameTextField
            title: qsTr("NAME")
            isMandatory: true
            anchors.left: firstRow.left
        }
        RowLayout {
            anchors.left: firstRow.left
            anchors.horizontalCenter: parent.horizontalCenter
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
            anchors.horizontalCenter: parent.horizontalCenter
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
