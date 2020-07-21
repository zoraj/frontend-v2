import QtQuick 2.12
import cloud.multimicro.mmc.frontend 1.0

BookingDetailViewForm {
    Connections {
        target: _pmsBookingDetailViewController

        onValidateButtonFinished: {
            if (result) {
                ventillationTab.visible = true
                pricingTab.visible = true
                complementaryTab.visible = true
                arrhesTab.visible = true
            }
            else {
                console.log("Error submitting")
            }
        }
        onSigRefreshUI: {
            bookingDetailGeneralInformationView.clientAccountTextField.value = currentHeader.mmcClientName
        }
    }


    Component.onCompleted: {
        ventillationTab.visible = false
        pricingTab.visible = false
        complementaryTab.visible = false
        arrhesTab.visible = false
        _pmsBookingDetailViewController.componentUILoaded();

        bookingDetailGeneralInformationView
    }

    PmsNoteEnteteModel {
        id: headerNote;
    }

    validateButton.onClicked: {
        headerNote.dateArrivee = bookingDetailGeneralInformationView.arrivalDatePicker.value
        headerNote.dateDepart = bookingDetailGeneralInformationView.departureDatePicker.value
        headerNote.nomNote = bookingDetailGeneralInformationView.fullNameTextField.text
        headerNote.reservationType = bookingDetailGeneralInformationView.groupedSwitch.checked ? "GROUPE" : "INDIV"
        headerNote.nbChambre = bookingDetailGeneralInformationView.nbRoomSpinBox.value
        headerNote.nbPax = bookingDetailGeneralInformationView.nbPaxSpinBox.value
        headerNote.nbEnfant = bookingDetailGeneralInformationView.nbChildSpinBox.value
        _pmsBookingDetailViewController.validateButtonClicked(headerNote)
    }
}
