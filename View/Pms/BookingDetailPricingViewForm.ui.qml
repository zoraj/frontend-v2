import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Column {
    spacing: 10

    property alias detailedSwitch: detailedSwitch
    property alias roomPricingListView: roomPricingListView
    property alias roomPricingDetailedListView: roomPricingDetailedListView
    Switch {
        id:detailedSwitch
        text: qsTr("DETAILED")
    }
    ListView {
        id: roomPricingDetailedListView
        width: 500
        height: 500
        delegate: RowLayout {
            width: 200
            height: 100
            spacing: 10
            MmcComboBox {
                title: qsTr("ROOM_NUMBER")
            }
            MmcTextField {
                title: qsTr("ROOM_TYPE")
            }
            MmcTextField {
                title: qsTr("NAME")
            }
            MmcSpinBox {
                title: qsTr("NB_ADULT")
            }
            MmcSpinBox {
                title: qsTr("NB_CHILD")
            }
            MmcDatePicker {
                title: qsTr("DATE_START")
            }
            MmcDatePicker {
                title: qsTr("DATE_END")
            }
            MmcComboBox {
                title: qsTr("RATE")
            }
            MmcComboBox {
                title: qsTr("BASE")
            }
            MmcTextField {
                title: qsTr("AMOUNT")
            }
        }
    }
    ListView {
        id: roomPricingListView
        width: 500
        height: 500
        delegate: RowLayout {
            width: 200
            height: 100
            spacing: 10
            MmcSpinBox {
                title: qsTr("NB_ROOM")
            }
            MmcComboBox {
                title: qsTr("ROOM_TYPE")
            }
            MmcComboBox {
                title: qsTr("RATE")
            }
            MmcSpinBox {
                title: qsTr("NB_ADULT")
            }
            MmcSpinBox {
                title: qsTr("NB_CHILD")
            }
            MmcComboBox {
                title: qsTr("BASE")
            }
            MmcTextField {
                title: qsTr("AMOUNT")
            }
        }
    }
}
