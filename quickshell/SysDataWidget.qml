import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes

Rectangle {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "#313244"
    radius: 16

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 25
        spacing: 20

        Text {
            color: "#a6adc8"
            font.bold: true
            text: "SYSTEM STATUS"
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter

            spacing: 100

            ProgressRing {
                percentage: parseInt(SystemStatistics.cpuPercent)
                title: "CPU"
                ringcolor: "#0000ff"
                extratext: ""
            }
            ProgressRing {
                percentage: parseInt(SystemStatistics.memPercent)
                title: "RAM"
                ringcolor: "#ff0000"
                extratext: SystemStatistics.memAmount + " used"
            }
            ProgressRing {
                percentage: parseInt(SystemStatistics.batPercent)
                title: "BATTERY"
                ringcolor: "#00ff00"
                extratext: SystemStatistics.batteryTimeString
            }
        }
    }
}
