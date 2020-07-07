import QtQuick 2.12
import "qrc:/View/Component"

BookingDetailViewForm {

    MmcDatePickerPopup {
        id: tttt
    }

    clientAccountListButton.onClicked: {
        tttt.open()
        //mainStackView.push("/View/Pms/ClientAccountList.qml")
    }
}
