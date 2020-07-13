import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Column {
    id: mainColumn
    spacing: 10
    topPadding: 20
    property alias searchButton: searchButton

    RowLayout {
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter
        MmcTextField {
            title: qsTr("REFERENCE")
        }
        MmcTextField {
            title: qsTr("NAME")
        }
        MmcDatePicker {
            title: qsTr("ARRIVAL")
        }
        MmcDatePicker {
            title: qsTr("DEPARTURE")
        }
        Button {
            id:searchButton
            text: qsTr("SEARCH")
        }
    }
    ListView {
        anchors.centerIn: parent
        id: resultListView
    }
}
