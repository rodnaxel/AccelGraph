import QtQuick 2.0
import QtCharts 2.0

ChartView {
    id: chartView
    title: "My Graph"
    anchors.fill: parent
    antialiasing: true
    animationOptions: ChartView.NoAnimation
    theme: ChartView.ChartThemeDark

    ValueAxis {
        id: axisX
        min: 0
        max: 30
        minorTickCount: 1
        tickCount: 10
    }

    ValueAxis {
        id: axisY
        min: 0
        max: 30
        minorTickCount: 1
        tickCount: 5
    }

    SplineSeries {
        id: series
        name: "SplineSeries"
        axisX: axisX
        axisY: axisY

        //XYPoint { x: 0; y: 0 }

        onHovered: {
            console.log(point);
            console.log(point.x);
            console.log(point.y);
            console.log(state);
        }
    }

    property double count: 0.0
    property int time: 0
    property alias timer: timer1

    Timer {
        id: timer1
        interval: 100
        repeat: true
        onTriggered: {
            console.log("on triggeres timer1")
            if (count === axisY.max + 1) {
                axisY.min = count
                axisY.max += 30
            }
            if (time === axisX.max + 1) {
                axisX.min = time
                axisX.max += 30
            }
            series.append(count++, time++)
        }
    }
}
