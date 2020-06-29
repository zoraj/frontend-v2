import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

MmcScrollablePage {
    Column {
        width: parent.width
        MmcTextField {
            id: clientAccount
        }
        MmcTextField {
            id: clientAccount1
        }
        MmcTextField {
            id: clientAccount2
        }
        MmcTextField {
            id: clientAccount3
        }
        MmcTextField {
            id: clientAccount4
        }
    }
}
