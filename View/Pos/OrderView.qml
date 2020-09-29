import QtQuick 2.4

OrderViewForm {

    ProductSearchDialog {
        id: productSearchDialog
    }

    productSearchButton {
        onClicked: {
            productSearchDialog.open()
        }
    }
}
