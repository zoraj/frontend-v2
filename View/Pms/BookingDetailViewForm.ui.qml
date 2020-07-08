import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

/*
Flickable {
    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded

}

*/

Column {
    id: mainColumn
    spacing: 10
    topPadding: 100
    leftPadding: mainWindow.width / 4

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
            text: "VENTILLATION"
            width: implicitWidth
        }
        TabButton {
            text: qsTr("PRICING")
            width: implicitWidth
        }
        TabButton {
            text: "COMPLEMENTARY_INFO"
            width: implicitWidth
        }
    }

    SwipeView {
       width: parent.width
       height: parent.height
       id: swipeView
       clip: true
       currentIndex: tabBar.currentIndex
       BookingDetailGeneralInformationView {

       }
       BookingDetailRoomRepartitionView {

       }
       BookingDetailPricingView {

       }
       BookingDetailComplementaryInformationView {

       }
   }
}

