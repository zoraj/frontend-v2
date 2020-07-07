import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.12

ColumnLayout {
    property string title
    property bool isMandatory: false
    property bool isPassword: false
    property int textWidth: 200
    property string text: textField.text

    implicitHeight: 200
    implicitWidth: 200
    //https://www3.sra.co.jp/qt/relation/doc-snapshot/qtdoc/qtdoc-tutorials-alarms-example.html#
    Label {
        text: title
        color: "#06a8c4"
    }
    TextField {
        id: textField
        echoMode: isPassword ? TextInput.Password : TextInput.Normal
        Layout.preferredWidth: textWidth
        /*
        onActiveFocusChanged: {
            if (activeFocus) {
                confirmationDialog.open()
                parent.activeFocus
            }
        }*/
    }
    /*
    Dialog {
        id: confirmationDialog

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        parent: Overlay.overlay

        modal: true
        title: "Choix date"
        standardButtons: Dialog.Close

        Column {
            spacing: 20
            anchors.fill: parent
            Label {
                text: "The document has been modified.\nDo you want to save your changes?"
            }
            Calendar {
                minimumDate: new Date(2020, 0, 1)
                maximumDate: new Date(2021, 0, 1)
            }
        }
    }*/
}

