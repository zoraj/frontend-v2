import QtQuick 2.12

BookingSearchViewForm {
    resultListView {
        model: 100
    }

    function resultItemClicked(selectedItem) {
        mainStackView.push(null, "qrc:/View/Pms/BookingDetailView.qml")
    }
}
