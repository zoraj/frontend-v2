import QtQuick 2.12


BookingDetailViewForm {
    clientAccountListButton.onClicked: {
        mainStackView.push("/View/Pms/ClientAccountList.qml")
    }
}
