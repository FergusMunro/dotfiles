import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire

Rectangle {
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "#313244"
    radius: 16

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 25
        spacing: 15

        Text {
            color: "#a6adc8"
            font.bold: true
            text: "SETTINGS"
        }

        Item {
            Layout.fillHeight: true
        }

        // volume
        RowLayout {
            Layout.fillWidth: true
            spacing: 15

            Text {
                color: "#a6adc8"
                font.pixelSize: 14
                font.bold: true
                text: "VOL"
                Layout.minimumWidth: 35
            }

            Slider {
                id: volSlider
                Layout.fillWidth: true
                accentColor: "#cba6f7"
            }
        }

        // microphone
        RowLayout {
            Layout.fillWidth: true
            spacing: 15

            Text {
                color: "#a6adc8"
                font.pixelSize: 14
                font.bold: true
                text: "MIC"
                Layout.minimumWidth: 35
            }

            Slider {
                id: micSlider
                Layout.fillWidth: true
                accentColor: "#f38ba8"
            }
        }

        // brightness
        RowLayout {
            Layout.fillWidth: true
            spacing: 15

            Text {
                color: "#a6adc8"
                font.pixelSize: 14
                font.bold: true
                text: "BRI"
                Layout.minimumWidth: 35
            }

            Slider {
                Layout.fillWidth: true
                accentColor: "#f9e2af"
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
