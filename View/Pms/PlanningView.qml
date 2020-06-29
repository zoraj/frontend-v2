import QtQuick 2.12
import QtQuick.Controls 2.12
import "qrc:/View/Component"

MmcScrollablePage {
    Column {
        Text {
            text: qsTr("PLANNING")
        }
        Button {
            text: qsTr("NEW BOOKING")
            onClicked: {
                //mainLoader.source = "/View/Pms/BookingDetailView.qml"
                mainStackView.push("/View/Pms/BookingDetailView.qml")
            }
        }

        /*
        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: "Button presents a push-button that can be pushed or clicked by the user. "
                + "Buttons are normally used to perform an action, or to answer a question."
        }
        */
    }
}

