import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtCharts 2.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Accelerometer graph")
    color: "black"

    property bool started: false

    toolBar: PToolbar {
        id: toolBar

        buttonStartStop.onClicked: {

            if (started) {
                console.log('on stop')
                toolBar.buttonStartStop.text = "Start"
                plotter.timer.stop()
                started = false
            } else {
                console.log('on started')
                toolBar.buttonStartStop.text = "Stop"
                plotter.timer.start()
                started = true
            }
        }

        buttonExit.onClicked: {
            console.log('on exit')
            Qt.quit()
        }
    }

    Plotter {
        id: plotter
        anchors.fill: parent
        timer.interval: 100
    }
}
