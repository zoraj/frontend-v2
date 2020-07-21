import QtQuick 2.12

BookingDetailPricingViewForm {
    Component.onCompleted: {
        roomPricingListView.visible = true
        roomPricingDetailedListView.visible = false
    }

    ListModel {
        id: roomPricingModel
        ListElement {
            name: "1"
        }
        ListElement {
            name: "1"
        }
        ListElement {
            name: "1"
        }
        ListElement {
            name: "1"
        }
        ListElement {
            name: "1"
        }
        ListElement {
            name: "1"
        }
        ListElement {
            name: "1"
        }
        ListElement {
            name: "1"
        }
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

    roomPricingListView {
        model: roomPricingModel
    }
    roomPricingDetailedListView {
        model: roomPricingModel
    }

    // Event UI
    detailedSwitch.onCheckedChanged: {
        roomPricingListView.visible = !detailedSwitch.checked
        roomPricingDetailedListView.visible = detailedSwitch.checked
    }
}
