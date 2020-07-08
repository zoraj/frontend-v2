import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4

Dialog {
    id: datepickerDialog

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    parent: Overlay.overlay

    modal: true
    title: "Choix date"
    standardButtons: Dialog.Close

    property Item caller: null
    property string subtitle
    property date defautDate : new Date()

    Column {
        spacing: 20
        anchors.fill: parent
        Label {
            text: "Choix de date"
        }
        Calendar {
            id: calendarComponent
            selectedDate: defautDate
            weekNumbersVisible: true
            //frameVisible:true
            minimumDate: new Date(2020, 0, 1)
            maximumDate: new Date(2021, 0, 1)
        }
    }
    onClosed: {
        caller.text = Qt.formatDate(calendarComponent.selectedDate, "dd/MM/yyyy")
        caller.value = Qt.formatDate(calendarComponent.selectedDate, "yyyy-MM-dd")
    }
}
