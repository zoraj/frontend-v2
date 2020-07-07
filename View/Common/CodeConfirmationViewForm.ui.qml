import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded

    property alias t0: t0
    property alias t1: t1
    property alias t2: t2
    property alias t3: t3
    property alias t4: t4
    property alias t5: t5
    property alias resultText: resultText

    Column {
        id: mainColumn
        spacing: 20
        anchors.centerIn: parent
        topPadding: mainWindow.height / 4

        Image {
            source: "qrc:/Asset/Images/verouillage_caisse@4x.png"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 96
            height: 96
        }
        Text {
            id: name
            text: qsTr("ACTIVATION_CODE")
            font.pointSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            text: qsTr("En vous connectant sur le backend en utilisant les informations envoyées par email\nvous pourrez declarer les postes.\nVeuiller saisir le code d'activation du poste reçu par email.")
            font.pointSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            TextField {
                id: t0
                width: 80
                height: 80
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 32
                validator: IntValidator {
                    bottom: 0
                    top: 9
                }
            }
            TextField {
                id: t1
                width: 80
                height: 80
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 32
                validator: IntValidator {
                    bottom: 0
                    top: 9
                }
            }
            TextField {
                id: t2
                width: 80
                height: 80
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 32
                validator: IntValidator {
                    bottom: 0
                    top: 9
                }
            }
            TextField {
                id: t3
                width: 80
                height: 80
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 32
                validator: IntValidator {
                    bottom: 0
                    top: 9
                }
            }
            TextField {
                id: t4
                width: 80
                height: 80
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 32
                validator: IntValidator {
                    bottom: 0
                    top: 9
                }
            }
            TextField {
                id: t5
                width: 80
                height: 80
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 32
                validator: IntValidator {
                    bottom: 0
                    top: 9
                }
            }
            Text {
                id: resultText
                width: 80
                height: 80
                opacity: 0
                text: "✓"
                font.pointSize: 40
                color: "#06a8c4"
            }
        }
    }
}
