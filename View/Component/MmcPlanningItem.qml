import QtQuick 2.12

Item {
    property int mainHeight: 30
    id: planningItem
    width: 300
    height: mainHeight
    property string bookingName: "value"
    property int coeff: 1
    Row {

        Canvas {
            // canvas size
            width: mainHeight; height: mainHeight
            // handler to override for drawing
            onPaint: {
                // get context to draw with
                var ctx = getContext("2d")
                // setup the stroke
                ctx.lineWidth = 1
                ctx.strokeStyle = "steelblue"
                // setup the fill
                ctx.fillStyle = "steelblue"
                // begin a new path to draw
                ctx.beginPath()
                // top-left start point
                ctx.moveTo(mainHeight,0)
                // upper line
                ctx.lineTo(0,mainHeight)
                // right line
                ctx.lineTo(30,mainHeight)
                // bottom line
                //ctx.lineTo(50,150)
                // left line through path closing
                ctx.closePath()
                // fill using fill style
                ctx.fill()
                // stroke using line width and stroke style
                ctx.stroke()
            }
        }
        Rectangle {
            id: middleTriangle
            color: "steelblue"
            width: 200 * coeff
            height: mainHeight
            Text {
                id: name
                text: bookingName
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Canvas {
            // canvas size
            width: 30; height: 30
            // handler to override for drawing
            onPaint: {
                // get context to draw with
                var ctx2 = getContext("2d")
                // setup the stroke
                ctx2.lineWidth = 1
                ctx2.strokeStyle = "steelblue"
                // setup the fill
                ctx2.fillStyle = "steelblue"
                // begin a new path to draw
                ctx2.beginPath()
                // top-left start point
                ctx2.moveTo(0,0)
                // upper line
                ctx2.lineTo(0,mainHeight)
                // right line
                ctx2.lineTo(mainHeight,0)
                // bottom line
                //ctx.lineTo(50,150)
                // left line through path closing
                ctx2.closePath()
                // fill using fill style
                ctx2.fill()
                // stroke using line width and stroke style
                ctx2.stroke()
            }
        }
    }

}
