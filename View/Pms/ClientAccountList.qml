import QtQuick 2.12

ClientAccountListForm {
    Connections {
        target: _pmsBookingDetailViewController
    }

    Component.onCompleted: {
        clientAccountListView.model = _pmsBookingDetailViewController.clientListModel
    }

    function clientAccountListViewSelection(index) {
        _pmsBookingDetailViewController.setClient(index)
        mainStackView.pop()
    }
}
