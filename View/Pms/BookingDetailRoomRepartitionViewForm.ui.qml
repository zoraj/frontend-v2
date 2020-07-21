import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Column {
    spacing: 10

    property alias detailedSwitch: detailedSwitch
    property alias roomRepartitionListView: roomRepartitionListView
    property alias roomRepartitionDetailedListView: roomRepartitionDetailedListView
    Switch {
        id:detailedSwitch
        text: qsTr("DETAILED")
    }
    ListView {
        id: roomRepartitionDetailedListView
        width: 500
        height: 500
        delegate: RowLayout {
            width: 200
            height: 100
            spacing: 10
            Text {
                text: name
                font.pointSize: 21
            }
            MmcComboBox {
                title: qsTr("ROOM_TYPE")
            }
            MmcComboBox {
                title: qsTr("ROOM_NUMBER")
            }
        }
    }
    ListView {
        id: roomRepartitionListView
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
        }
    }
}
