import QtQuick 2.4

CashSaleViewForm {
    ListModel {
        id: cashSellingModel
        ListElement {
            name: "Jim Williams"
            mycolor: "red"
        }
        ListElement {
            name: "John Brown"
            mycolor: "grey"
        }
        ListElement {
            name: "Bill Smyth"
            mycolor: "yellow"
        }
        ListElement {
            name: "Sam Wise"
            mycolor: "green"
        }
    }

    cashSellingGridView {
        model: cashSellingModel
    }
}
