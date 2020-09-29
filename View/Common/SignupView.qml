import QtQuick 2.12
import cloud.multimicro.mmc.frontend 1.0
import "qrc:/Script/Country.js" as CountryJS


SignupViewForm {
    // Business Component Initialization
    Connections {
        target: _signupViewController
    }
    Establishment {
        id: establishment
    }

    // UI Component Initialization
    typeComboBox {
        comboBoxModel: ["Restaurant","Hotel","Restaurant et Hotel", "Lodge"]
    }
    countryComboBox {
        comboBoxModel: CountryJS.getCountries();
        role: "name"
    }

    // View Load
    Component.onCompleted: {
    }

    // Event Logic
    validateButton.onClicked: {
        if (nameTextField.text === "" || typeComboBox.currentIndex === -1 || countryComboBox.currentIndex === -1 ||
                addressTextField.text === "" || ownerFirstnameTextField.text === "" || email1TextField.text === "" || phoneTextField.text === "") {
            //popupToast.start(qsTr("Champs obligatoires non renseignés"))
        }
        else {
            establishment.name = nameTextField.text
            establishment.type = typeEstablishmentModel.get(typeComboBox.currentIndex).key
            establishment.country = countryModel.get(countryComboBox.currentIndex).key
            establishment.address = addressTextField.text
            establishment.ownerFirstName = ownerFirstnameTextField.text
            establishment.ownerLastName = ownerLastnameTextField.text
            establishment.email = email1TextField.text
            establishment.phone = phoneTextField.text
            _signupViewController.validateButtonClicked(establishment)
        }
        //mainStackView.push("/View/Common/CodeConfirmationView.qml")
    }

    activateDeviceButton.onClicked: {
        mainStackView.push("/View/Common/CodeConfirmationView.qml")
    }

    /*
    // UI Event
    activateDeviceButton.onClicked: {
        mainStackView.push("/View/Common/CodeConfirmationView.qml")
    }

    validateButton.onClicked: {
        busyIndicator.opacity = 1
        if (nameTextField.text === "" || typeComboBox.currentIndex == -1 || countryComboBox.currentIndex == -1 ||
                addressTextField.text === "" || ownerFirstnameTextField.text === "" || email1TextField.text === "" || phoneTextField.text === "") {
            //popupToast.start(qsTr("Champs obligatoires non renseignés"))
        }
        else if (email1TextField.text !== email2TextField.text) {
            //popupToast.start(qsTr("Les adresses email ne correspondent pas"))
        }
        else {
            etablissement.name = nameTextField.text
            etablissement.type = typeEstablishmentModel.get(typeComboBox.currentIndex).key
            etablissement.country = countryModel.get(countryComboBox.currentIndex).key
            etablissement.address = addressTextField.text
            etablissement.ownerFirstName = ownerFirstnameTextField.text
            etablissement.ownerLastName = ownerLastnameTextField.text
            etablissement.email = email1TextField.text
            etablissement.phone = phoneTextField.text
            busyIndicator.opacity = 1
            _signupViewController.validateButtonClicked(etablissement)
        }
    }

    typeComboBox {
        currentIndex: -1
        textRole: "value"
        model: ListModel {
            id: typeEstablishmentModel
            ListElement { value: qsTr("RESTAURANT"); key: "R"}
            ListElement { value: qsTr("HOTEL"); key: "H"}
            ListElement { value: qsTr("HOTEL_RESTAURANT"); key: "HR"}
            ListElement { value: qsTr("LODGE"); key: "L"}
        }

        onAccepted: {
            if (find(editText) === -1)
                model.append({text: editText})
        }
    }

    countryComboBox {
        currentIndex: -1
        textRole: "value"
        model: ListModel {
            id: countryModel
            ListElement { value: qsTr("FRANCE"); key: "fr" }
        }
        onAccepted: {
            if (find(editText) === -1)
                model.append({text: editText})
        }
    }*/
}
