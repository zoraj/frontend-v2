import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.1

Popup {
    property alias calendar: calendar
    property Item caller: null
    property string formatout : "yyyy-MM-dd"
    property date defautDate : new Date()
    property int implWidth: calendarComponent.width
    property int implHeight: 50
    property int implHeightDayOfWeek: 20
    property int ordY: 100
    property int absX: 100
    property int buttonSpacing: 20
    property int buttonTopMargin: 8

    id: calendar
    width: rectangle.width*1.1
    height: (calendarComponent.height + row.height)*1.3
    property alias mouseArea: mouseArea
    modal: true
    focus:true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    //background: "white"

    Rectangle {
        id: rectangle
        width: calendarComponent.width
        anchors.bottom: calendarComponent.top
        anchors.horizontalCenter: calendarComponent.horizontalCenter
        height: name.height*1.8
        color: "#44bed3"
        border.width: 0
        Text {
            id: name
            text: qsTr("CALENDAR")
            //anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter
            anchors.left:parent.left
            anchors.leftMargin: 12
            color: "White"
            font.pointSize: 11
            font.bold: true
        }
    }

    Calendar {
        id: calendarComponent
        visibleMonth: 5
        activeFocusOnTab: false
        dayOfWeekFormat: 7
        navigationBarVisible: true
        clip: true
        opacity: 1
        visible: true
        anchors.centerIn: parent
        weekNumbersVisible: true
        frameVisible:true
        selectedDate: defautDate

        onVisibleChanged: {

            if(visible == true)
            {
                selectedDate = defautDate
            }
        }

        style: CalendarStyle {
        navigationBar: Rectangle {
                                implicitWidth: implWidth //calendarComponent.width
                                implicitHeight: implHeight//50

                                Text {
                                    anchors.centerIn: parent
                                    font.family: "Arial"
                                    font.pixelSize: 12
                                    font.letterSpacing: -1
                                    color: "#4A4646"
                                    text: styleData.title
                                }

                                Item {
                                    anchors.left: parent.left
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom
                                    width: height

                                    Image {
                                        anchors.centerIn: parent
                                        source: "qrc:/images/prevMonth.png"
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: calendarComponent.showPreviousMonth()
                                    }
                                }

                                Item {
                                    anchors.right: parent.right
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom
                                    width: height

                                    Image {
                                        anchors.centerIn: parent
                                        source: "qrc:/images/nextMonth.png"
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: calendarComponent.showNextMonth()
                                    }
                                }
                            }


        dayOfWeekDelegate: Item {
                                 implicitHeight: implHeightDayOfWeek //20
                                 implicitWidth: calendar.width / 7

                                 Text {
                                     anchors.verticalCenter: parent.verticalCenter
                                     elide: Text.ElideRight
                                     font.family: "Helvetica"
                                     font.pixelSize: 11
                                     font.letterSpacing: -1
                                     color: "#535353"
                                     text: {
                                         var locale = Qt.locale()
                                         return locale.dayName(styleData.dayOfWeek, Locale.ShortFormat)
                                     }
                                 }
                             }

                     }
            }

    Row{
        id:row
        anchors.top: calendarComponent.bottom
        anchors.topMargin: buttonTopMargin // 20
        anchors.right: calendarComponent.right
        anchors.rightMargin: 10
        spacing: buttonSpacing // 20

        Text {
            id: cancelButton
            text: qsTr("CANCEL")
            color: "#44bed3"
            font.pointSize: 11
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    close()
                }
            }

        }

        Text {
            id: validateButton
            text: qsTr("OK")
            color: "#44bed3"
            font.pointSize: 11
            MouseArea{
                id: mouseArea
                antialiasing: false
                anchors.fill: parent
                onClicked: {
                    caller.text = Qt.formatDate(calendarComponent.selectedDate, formatout)
                    close()
                }
            }
        }
    }

    /*Button {
        id: cancelButton
        anchors.top: calendarComponent.bottom
        anchors.left: calendarComponent.left
        anchors.topMargin: 10
        text: qsTr("Annuler")
        onClicked: {
            close()
        }
    }*/

    /*Button {
        id: validateButton
        anchors.top: calendarComponent.bottom
        anchors.right: calendarComponent.right
        anchors.topMargin: 10
        text: qsTr("OK")
        onClicked: {
            caller.text = Qt.formatDate(calendarComponent.selectedDate,"yyyy-MM-dd")
            close()
        }
    }*/
}
