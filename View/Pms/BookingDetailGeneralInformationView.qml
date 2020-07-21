import QtQuick 2.12
import "qrc:/View/Component"

BookingDetailGeneralInformationViewForm {
    clientAccountListButton.onClicked: {
        mainStackView.push("/View/Pms/ClientAccountList.qml")
    }
}
