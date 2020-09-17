import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.0
import QtQuick.Controls.Styles 1.4
import "qrc:/View/Common"
import "qrc:/View/Component"

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: qsTr("MMC - Frontend")
    property int module: 1 // POS = 0, PMS-RECEP  = 1, PMS-RESA = 2, PMS-HOUSEKEEPING = 3

    property int moduleIndex: 0
    color: "#eeeeee"

    // Rectangle background during signin and signup
    Rectangle
    {
        id: prettyRectangle
        anchors.fill: parent
        gradient: Gradient
        {
            GradientStop {position: 0.000;color: "#a1c4fd";}
            GradientStop {position: 1.000;color: "#c2e9fb";}
        }
    }

    // Model for PMS-RECEP menu
    ListModel {
        id: pmsRecepTabBarModel
        ListElement { title: "PLANNING"; type: "separator"; source: "qrc:/View/Pms/Recep/PlanningView.qml" }
        ListElement { title: "RECHERCHER"; source: "qrc:/View/Pms/BookingSearchView.qml" }
        ListElement { title: "NOTE EN ATTENTE"; source: "qrc:/View/Pms/PendingNoteView.qml" }
        ListElement { title: "NOTIFICATION"; source: "qrc:/View/Pms/NotificationView.qml" }
    }
    ListModel {
        id: pmsRecepDrawerModel
        ListElement { title: "VENTE COMPTANT"; source: "qrc:/View/Pms/CashSaleView.qml" }
        ListElement { title: "TRANSFERT NOTE"; source: "qrc:/View/Pms/DeferralNoteView.qml" }
        ListElement { title: "---"; source: "" }
        ListElement { title: "DECONNECTER"; source: "qrc:/View/Common/LoginView.qml" }
    }
    // Model for PMS-RESA menu
    ListModel {
        id: pmsResaTabBarModel
        ListElement { title: "PLANNING"; type: "separator"; source: "qrc:/View/Pms/PlanningChoiceView.qml" }
        ListElement { title: "RECHERCHER"; source: "qrc:/View/Pms/BookingSearchView.qml" }
        ListElement { title: "PREAFFECTATION"; source: "qrc:/View/Pms/PendingNoteView.qml" }
        ListElement { title: "NOTIFICATION"; source: "qrc:/View/Pms/NotificationView.qml" }
    }
    ListModel {
        id: pmsResaDrawerModel
        ListElement { title: "---"; source: "" }
        ListElement { title: "DECONNECTER"; source: "qrc:/View/Common/LoginView.qml" }
    }
    // Model for PMS-HOUSEKEEPING menu
    ListModel {
        id: pmsHousekeepingTabBarModel
        ListElement { title: "CALENDRIER"; type: "separator"; source: "qrc:/View/Pms/PlanningChoiceView.qml" }
        ListElement { title: "ETAT DES CHAMBRES"; source: "qrc:/View/Pms/BookingSearchView.qml" }
        ListElement { title: "COMPTE RENDU"; source: "qrc:/View/Pms/NotificationView.qml" }
    }

    // Model for POS menu
    ListModel {
        id: posDrawerModel
        ListElement { title: "Plan de table"; source: "qrc:/View/Pos/" }
        ListElement { title: "Notes ouvertes"; source: "qrc:/View/Pos/" }
        ListElement { title: "Notification"; source: "qrc:/View/Pos/" }
    }


    // UI Logic
    // ***************************************** ACTION *******************************************************
    Action {
        id: navigateBackAction
        icon.name: mainStackView.depth > 1 ? "back" : "drawer"
        onTriggered: {
            if (mainStackView.depth > 1) {
                mainStackView.pop()
                //listView.currentIndex = -1
            } else {
                drawer.open()
            }
        }
    }
    Action {
        id: optionsMenuAction
        icon.name: "menu"
        onTriggered: optionsMenu.open()
    }

    // ********************************************** HEADER ***************************************************
    header: ToolBar {
        Material.foreground: "white"
        id: toolBar
        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                action: navigateBackAction
            }

            Label {
                id: titleLabel
                text: "Gallery" //listView.currentItem ? listView.currentItem.text : "Gallery"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                action: optionsMenuAction

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight
                    Action {
                        text: "Récéption"
                        onTriggered: {
                            module = 1
                        }
                    }

                    Action {
                        text: "Réservation"
                        onTriggered: {
                            module = 2
                        }
                    }
                    Action {
                        text: "Gouvernante"
                        onTriggered: {
                            module = 3
                        }
                    }
                }
            }
        }
    }

    // Drawer, seulement pour le module PMS (Recep, Resa, )
    Drawer {
        id: drawer
        //width: Math.min(mainWindow.width, mainWindow.height) / 3
        width: 300
        height: mainWindow.height
        /*interactive: stackView.depth === 1*/

        ListView {
            id: menuListView
            focus: true
            currentIndex: -1
            anchors.fill: parent
            model: {
                if (module === 0)
                    return posDrawerModel
                else if (module === 1)
                    return pmsRecepDrawerModel
                else if (module === 2)
                    return pmsResaDrawerModel
            }

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    menuListView.currentIndex = index
                    mainStackView.replace(null, model.source, StackView.Immediate)
                    drawer.close()
                }
            }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    // ********************************************** BODY ***************************************************
    StackView {
        id: mainStackView
        anchors.fill: parent
        initialItem: SplashView {}

        Component.onCompleted: {
            // No header/footer during first loading
            toolBar.visible = false
            tabBar.visible = false
        }
    }

    // ********************************************** FOOTER **************************************************
    footer: tabBar

    TabBar {
        id: tabBar
        width: parent.width
        Repeater {
            model: {
                if (module === 1) {
                    return pmsRecepTabBarModel
                }
                else if(module === 2) {
                    return pmsResaTabBarModel
                }
                else if(module === 3) {
                    return pmsHousekeepingTabBarModel
                }
            }
            TabButton {
                text: title
                onClicked: {
                    mainStackView.replace(null, source, StackView.Immediate)
                    moduleIndex = index
                }
            }
        }
    }

    MmcDatePickerDialog {
        id: datepickerDialog
    }
}
