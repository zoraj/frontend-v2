import QtQuick 2.12
import "qrc:/View/Component"
import cloud.multimicro.mmc.frontend 1.0

BookingDetailGeneralInformationViewForm {
    PmsNoteEnteteModel {
        id: headerNote;
    }

    Connections {
        target: _pmsBookingDetailViewController
    }


    clientAccountListButton.onClicked: {
        mainStackView.push("/View/Pms/ClientAccountList.qml")
    }

    validateButton.onClicked: {
        headerNote.dateArrivee = arrivalDatePicker.value
        headerNote.dateDepart = departureDatePicker.value
        headerNote.nomNote = fullNameTextField.text
        headerNote.reservationType = groupedSwitch.checked ? "GROUPE" : "INDIV"
        headerNote.nbChambre = nbRoomSpinBox.value
        headerNote.nbPax = nbPaxSpinBox.value
        headerNote.nbEnfant = nbChildSpinBox.value
        headerNote.mmcClientId = clientAccountTextField.text
        _pmsBookingDetailViewController.validateButtonClicked(headerNote)
    }
}
