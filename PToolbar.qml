import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

ToolBar {
        id: toolBar

        // ToolBar buttons
        property alias buttonStartStop: buttonStartStop
        property alias buttonExit: buttonExit

        style: ToolBarStyle {
            background: Rectangle {
                color: "lightgrey"
            }
        }

        Component {
            id: toolbuttonStyle
            ButtonStyle {

            background: Rectangle {
                implicitWidth: 50
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                }
            }

        }
        }

        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: buttonStartStop
                text: "Start"
                style: toolbuttonStyle
            }


            ComboBox {
                id: portBox
                currentIndex: 0
                model: ListModel {
                    id: portItems
                    ListElement { text: "Com 0" }
                    ListElement { text: "Com 1" }
                    ListElement { text: "Com 2" }
                }
            }

            ComboBox {
                id: baudrateBox
                model: [4800, 9600, 19200, 38400, 115200]
            }

            ComboBox {
                id: intervalBox
            }

            ToolButton {
                id: buttonExit
                text: "Exit"
                style: toolbuttonStyle

            }

        }
    }
