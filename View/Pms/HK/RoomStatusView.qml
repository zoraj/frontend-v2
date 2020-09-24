import QtQuick 2.4

RoomStatusViewForm {
    ListModel {
        id: roomsModel
        ListElement {
            type: "Single"
            num: "101"
            status: "DIRTY"
            floor: "1"
        }
        ListElement {
            type: "Single"
            num: "102"
            status: "DIRTY"
            floor: "1"
        }
        ListElement {
            type: "Twin"
            num: "103"
            status: "OUT"
            floor: "1"
        }
        ListElement {
            type: "Single"
            num: "201"
            status: "OUT"
            floor: "2"
        }
        ListElement {
            type: "Single"
            num: "202"
            status: "BUSY"
            floor: "2"
        }
        ListElement {
            type: "Single"
            num: "301"
            status: "BUSY"
            floor: "3"
        }
        ListElement {
            type: "LUXE"
            num: "302"
            status: "BUSY"
            floor: "3"
        }
        ListElement {
            type: "Single"
            num: "101"
            status: "BUSY"
            floor: "1"
        }
        ListElement {
            type: "Single"
            num: "101"
            status: "CLEAN"
            floor: "1"
        }
    }
    Component {
        id: sectionHeading
        Rectangle {
            width: 500
            height: 100
            color: "lightsteelblue"

            Text {
                text: parent.section
                font.bold: true
                font.pixelSize: 20
            }
        }
    }

    function getRoomsByFloor(floor) {

    }
}
