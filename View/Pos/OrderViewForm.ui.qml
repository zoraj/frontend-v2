import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: orderListView.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property int mainMargin: 10

    property alias productSearchButton: productSearchButton

    Rectangle {
        id: headerRectangle
        x: mainMargin
        y: mainMargin
        height: 200
        width: 400
        Column {
            Row {
                MmcTextField {
                    title: "N° Table"
                }
                MmcTextField {
                    title: "Nb couvert"
                }
            }
            Row {
                MmcTextField {
                    title: "% Remise"
                }
                MmcTextField {
                    title: "€ Remise"
                }
            }
            Row {
                MmcTextField {
                    title: "Cpte PEC"
                }
                MmcTextField {
                    title: "N° Chambre"
                }
            }
        }
    }

    ListView {
        id: orderListView
        anchors.left: headerRectangle.left
        anchors.top: headerRectangle.bottom
        width: headerRectangle.width
        height: mainWindow.height / 2 - 50
        model: 100
        spacing: 1
        clip: true
        delegate: Rectangle {
            width: parent.width
            height: 40
            color: "white"
        }
    }
    Rectangle {
        id: totalRectangle
        width: orderListView.width
        height: 100
        anchors.left: orderListView.left
        anchors.top: orderListView.bottom
        color: "red"
        Column {
            Row {
                Label {
                    text: "TOTAL"
                }
                Label {
                    text: "130€"
                }
            }
            Row {
                Label {
                    text: "TVA"
                }
                Label {
                    text: "13"
                }
            }
            Row {
                Label {
                    text: "TVA"
                }
                Label {
                    text: "13"
                }
            }
            Row {
                Label {
                    text: "NET"
                }
                Label {
                    text: "130"
                }
            }
        }
    }

    // Action Bloc
    Rectangle {
        id: actionRectangle
        anchors.left: totalRectangle.left
        anchors.top: totalRectangle.bottom
        height: mainWindow.height - headerRectangle.height - orderListView.height - totalRectangle.height
        width: totalRectangle.width
        Grid {
            columns: 3
            spacing: 1
            Button {
                text: "Annuler"
                height: actionRectangle.height / 2
                width: actionRectangle.width  / 3
            }
            Button {
                text: "Offert"
                height: actionRectangle.height / 2
                width: actionRectangle.width  / 3
            }
            Button {
                text: "VAE"
                height: actionRectangle.height / 2
                width: actionRectangle.width  / 3
            }
            Button {
                text: "Facture"
                height: actionRectangle.height / 2
                width: actionRectangle.width  / 3
            }
            Button {
                text: "Ticket"
                height: actionRectangle.height / 2
                width: actionRectangle.width  / 3
            }
            Button {
                text: "Encaisser"
                height: actionRectangle.height / 2
                width: actionRectangle.width  / 3
                background: Rectangle {
                    implicitWidth: actionRectangle.width  / 3
                    implicitHeight: actionRectangle.height / 2
                    color: "#94c7cf"
                    border.color: "#26282a"
                    border.width: 1
                    radius: 4
                }
            }

        }
    }

    // Product GridView
    GridView {
        id: productGridView
        width: mainWindow.width - headerRectangle.width - 200
        height: headerRectangle.height + orderListView.height
        anchors.left: headerRectangle.right
        anchors.top: headerRectangle.top
        anchors.leftMargin: mainMargin
        clip: true
        model: 100
        cellHeight: 100
        cellWidth: 100
        delegate: Rectangle {
            height: 90
            width: 90
            color: "white"
        }
    }

    // Group Product ListView
    ListView {
        id: groupProductListView
        width: mainWindow.width - headerRectangle.width - productGridView.width
        height: productGridView.height
        anchors.left: productGridView.right
        anchors.top: productGridView.top
        model: 50
        spacing: 1
        clip: true
        delegate: Rectangle {
            width: parent.width
            height: 70
            color: "green"
        }
    }

    // Command bloc
    Rectangle {
        id: commandRectangle
        width: productGridView.width - 200
        height: totalRectangle.height + actionRectangle.height
        anchors.top: productGridView.bottom
        anchors.left: productGridView.left
        Grid {
            columns: 4
            spacing: 2
            anchors.fill: parent
            Button {
                id: productSearchButton
                text: "Liste prestations"
                height: commandRectangle.height / 2
                width: commandRectangle.width  / 4 - 2
            }
            Button {
                text: "Commande"
                height: commandRectangle.height / 2
                width: commandRectangle.width  / 4 - 2
            }
            Button {
                text: "Garniture"
                height: commandRectangle.height / 2
                width: commandRectangle.width  / 4 - 2
            }
            Button {
                text: " "
                height: commandRectangle.height / 2
                width: commandRectangle.width  / 4 - 2
            }
            Button {
                text: " "
                height: commandRectangle.height / 2
                width: commandRectangle.width  / 4 - 2
            }
            Button {
                text: " "
                height: commandRectangle.height / 2
                width: commandRectangle.width  / 4 - 2
            }
        }
    }

    // Calculator Rectangle
    Rectangle {
        id: calculatorRectangle
        width: 300
        height: commandRectangle.height
        anchors.top: commandRectangle.top
        //anchors.left: functionRectangle.right
        anchors.right: groupProductListView.right
        Grid {
            columns: 3
            spacing: 1
            Button {
                text: "1"
                width: 100
                height: 70
            }
            Button {
                text: "2"
                width: 100
                height: 70
            }
            Button {
                text: "3"
                width: 100
                height: 70
            }
            Button {
                text: "4"
                width: 100
                height: 70
            }
            Button {
                text: "5"
                width: 100
                height: 70
            }
            Button {
                text: "6"
                width: 100
                height: 70
            }
            Button {
                text: "7"
                width: 100
                height: 70
            }
            Button {
                text: "8"
                width: 100
                height: 70
            }
            Button {
                text: "9"
                width: 100
                height: 70
            }
            Button {
                text: "0"
                width: 100
                height: 70
            }
            Button {
                text: "."
                width: 100
                height: 70
            }
            Button {
                text: "C"
                width: 100
                height: 70
            }

        }
    }
}
