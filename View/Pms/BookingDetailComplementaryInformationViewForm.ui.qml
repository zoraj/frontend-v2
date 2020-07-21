import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: mainColumn.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    Column {
        id: mainColumn
        spacing: 10
        width: parent.width
        topPadding: 100

        RowLayout {
            MmcComboBox {
                title: qsTr("CARD_TYPE")
            }
            MmcTextField {
                title: qsTr("CB_NUMBER")
            }
        }

        MmcTextField {
            title: qsTr("TITULAIRE")
        }
        MmcTextField {
            title: qsTr("CARD_EXPIRATION")
        }

        MmcComboBox {
            title: qsTr("GENDER")
        }
        RowLayout {
            MmcTextField {
                title: qsTr("LASTNAME")
            }
            MmcTextField {
                title: qsTr("FIRSTNAME")
            }
        }
        MmcTextField {
            title: qsTr("ADDRESS1")
        }
        MmcTextField {
            title: qsTr("ADDRESS2")
        }
        RowLayout {
            MmcTextField {
                title: qsTr("CP")
            }
            MmcTextField {
                title: qsTr("CITY")
            }
        }

        MmcComboBox {
            title: qsTr("COUNTRY")
        }
        RowLayout {
            MmcTextField {
                title: qsTr("PHONE")
            }
            MmcTextField {
                title: qsTr("EMAIL")
            }
        }
    }
}
