import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: orderListView.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property int mainMargin: 10

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
    Rectangle {
        id: actionRectangle
        anchors.left: totalRectangle.left
        anchors.top: totalRectangle.bottom
        height: mainWindow.height - headerRectangle.height - orderListView.height - totalRectangle.height
        width: totalRectangle.width
        color: "yellow"
        Grid {
            columns: 3
            spacing: 1
            Button {
                text: "Offert"
            }
            Button {
                text: "VAE"
            }
            Button {
                text: "Encaisser"
            }
            Button {
                text: "Facture"
            }
            Button {
                text: "Ticket"
            }
            Button {
                text: "Encaisser"
            }

        }
    }

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
    ListView {
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
    Rectangle {
        id: functionRectangle
        width: actionRectangle.width
        height: totalRectangle.height + actionRectangle.height
        anchors.top: productGridView.bottom
        anchors.left: productGridView.left
    }
    Rectangle {
        id: calculatorRectangle
        width: mainWindow.width - totalRectangle.width - functionRectangle.width
        height: functionRectangle.height
        anchors.top: functionRectangle.top
        anchors.left: functionRectangle.right
        color: "brown"
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
