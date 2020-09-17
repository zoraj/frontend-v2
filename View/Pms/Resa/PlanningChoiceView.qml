import QtQuick 2.12

PlanningChoiceViewForm {
    Component.onCompleted: {
        toolBar.visible = true
        tabBar.visible = true
    }

    newBookingButton.onClicked: {
         onClicked: mainStackView.push(null, "qrc:/View/Pms/BookingDetailView.qml")
    }
}
