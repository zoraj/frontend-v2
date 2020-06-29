import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"


MmcScrollablePage {
    property alias clientAccountListButton: clientAccountListButton
    Column {
        spacing: 10
        width: parent.width
        topPadding: 100

        /*
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "SpinBox allows the user to choose an integer value by clicking the up or down indicator buttons, "
                + "by pressing up or down on the keyboard, or by entering a text value in the input field."
        }
        */
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

        MmcTextField {
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
