import QtQuick
import Quickshell.Hyprland

Text {
    id: root

    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    color: "#cdd6f4"
    text: "CPU: " + SystemStatistics.cpuPercent + "% MEM: " + SystemStatistics.memPercent + "% BAT: " + SystemStatistics.batPercent + "%"
    font.bold: true
}
