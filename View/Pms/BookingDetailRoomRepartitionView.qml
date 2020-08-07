import QtQuick 2.12

BookingDetailRoomRepartitionViewForm {
    Component.onCompleted: {
        roomRepartitionListView.visible = true
        roomRepartitionDetailedListView.visible = false
    }

    ListModel {
        id: roomRepartitionModel
        ListElement {
            name: "1"
        }
        ListElement {
            name: "1"
        }
        ListElement {
            name: "1"
        }
    }

    roomRepartitionListView {
        model: roomRepartitionModel
    }
    roomRepartitionDetailedListView {
        model: roomRepartitionModel
    }

    ListModel {
        id: _model
        ListElement { text: "TWIN" }
        ListElement { text: "SINGLE" }
        ListElement { text: "SALON" }
    }

    roomRepartitionDetailedListView {

    }

    // Event UI
    detailedSwitch.onCheckedChanged: {
        roomRepartitionListView.visible = !detailedSwitch.checked
        roomRepartitionDetailedListView.visible = detailedSwitch.checked
    }
}
