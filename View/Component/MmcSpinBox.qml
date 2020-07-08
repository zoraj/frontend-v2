import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property string title
    property int startValue
    property int value: spinBox.value

    Label {
        text: title
        color: "#06a8c4"
    }
    SpinBox {
        id: spinBox
        value: startValue
        editable: true
    }
}
