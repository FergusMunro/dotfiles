import QtQuick
import QtQuick.Layouts
import Quickshell

Rectangle {
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "#313244"
    radius: 16

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 25
        spacing: 10

        Text {
            color: "#a6adc8"
            font.bold: true
            text: "TASKS DUE TODAY"
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 8
            Text {
                color: "white"
                text: "[ ] Buy groceries"
            }
            Text {
                color: "white"
                text: "[ ] Finish QML dashboard setup"
            }
            Text {
                color: "#585b70"
                text: "[x] Full system update done"
            }
        }
    }
}
