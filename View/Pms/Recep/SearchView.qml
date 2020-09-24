import QtQuick 2.12

SearchViewForm {
    resultListView {
        model: 100
    }

    function resultItemClicked(selectedItem) {
        mainStackView.push(null, "qrc:/View/Pms/BookingDetailView.qml")
    }
}
