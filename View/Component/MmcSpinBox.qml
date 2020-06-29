import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ColumnLayout {
    property string title
    property int startValue
    Label {
        text: title
    }
    SpinBox {
        value: startValue
        editable: true
    }
}
