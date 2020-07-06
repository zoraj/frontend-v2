import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import Qt.labs.settings 1.0
import "qrc:/View/Common"

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 800
    height: 600
    title: qsTr("MMC - Frontend")
    property int module: 1 // POS = 0, PMS = 1
    property int moduleIndex: 0

    // Model for PMS menu
    ListModel {
        id: pmsModel
        ListElement { title: "PLANNING"; type: "separator"; source: "qrc:/View/Pms/PlanningView.qml" }
        ListElement { title: "RECHERCHE"; source: "qrc:/View/Pms/SearchView.qml" }
        ListElement { title: "PREAFFECTATION"; source: "qrc:/View/Pms/PreaffectationView.qml" }
        ListElement { title: "VENTE AU COMPTANT"; source: "qrc:/View/Pms/CashSellingView.qml" }
        ListElement { title: "TRANSFERT NOTE"; source: "qrc:/View/Pms/DeferralNoteView.qml" }
        ListElement { title: "NOTIFICATION"; source: "qrc:/View/Pms/NotificationView.qml" }
    }

    // Model for POS menu
    ListModel {
        id: posModel
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
                        text: "Settings"
                        //onTriggered: settingsDialog.open()
                    }
                    Action {
                        text: "About"
                        //onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }

    Drawer {
        id: drawer
        width: Math.min(mainWindow.width, mainWindow.height) / 3 * 2
        height: mainWindow.height
        /*interactive: stackView.depth === 1*/

        ListView {
            id: menuListView
            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
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
/*
        Component {
            id: component
            Loader {
                id: loader
                onLoaded: {

                }
            }
        }
*/
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
            model: module === 1 ? pmsModel : posModel
            TabButton {
                text: title
                onClicked: {
                    mainLoader.source = source
                    moduleIndex = index
                }
            }
        }
    }
}
