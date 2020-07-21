import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Column {
    id: mainColumn
    spacing: 10
    topPadding: 100
    leftPadding: mainWindow.width / 4

    property alias ventillationTab: ventillationTab
    property alias pricingTab: pricingTab
    property alias complementaryTab: complementaryTab
    property alias arrhesTab: arrhesTab
    property alias bookingDetailGeneralInformationView: bookingDetailGeneralInformationView
    property alias validateButton: validateButton


    TabBar {
        id: tabBar
        width: parent.width
        height: 60
        spacing: 15

        TabButton {
            text: "RESA"
            width: implicitWidth
        }
        TabButton {
            id: ventillationTab
            text: "VENTILLATION"
            width: implicitWidth
        }
        TabButton {
            id: pricingTab
            text: qsTr("PRICING")
            width: implicitWidth
        }
        TabButton {
            id: complementaryTab
            text: "COMPLEMENTARY_INFO"
            width: implicitWidth
        }
        TabButton {
            id: arrhesTab
            text: "ARRHES_MANAGEMENT"
            width: implicitWidth
        }
    }

    SwipeView {
        width: parent.width
        height: parent.height - 300
        id: swipeView
        clip: true
        currentIndex: tabBar.currentIndex
        BookingDetailGeneralInformationView {
            id: bookingDetailGeneralInformationView
        }
        BookingDetailRoomRepartitionView {

        }
        BookingDetailPricingView {

        }
        BookingDetailComplementaryInformationView {

        }
        BookingDetailArrhesView {

        }
    }
    RowLayout {
        anchors.left: swipeView.left
        Button {
            id: validateButton
            text: qsTr("VALIDATE")
        }
        Button {
            id: cancelButton
            text: qsTr("CANCEL")
        }
    }

}

