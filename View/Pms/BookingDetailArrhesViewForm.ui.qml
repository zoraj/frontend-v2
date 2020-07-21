import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"


Column {
    spacing: 10

    property alias arrhesListView: arrhesListView
    ListView {
        id: arrhesListView
        width: 500
        height: 500
        delegate: RowLayout {
            width: 200
            height: 100
            spacing: 10
            MmcComboBox {
                title: qsTr("PAYMENT_MODE")
            }
            MmcTextField {
                title: qsTr("AMOUNT")
            }
            MmcDatePicker {
                title: qsTr("DATE_PAYMENT")
            }
        }
    }
    Button {
        text: qsTr("RETAKE")
    }
}
