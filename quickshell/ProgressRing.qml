import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes

ColumnLayout {
    id: root
    required property int percentage
    required property string title
    required property color ringcolor
    required property string extratext

    property int size: 100
    property int stroke: 8

    Layout.fillWidth: true
    spacing: 12

    Item {
        Layout.alignment: Qt.AlignHCenter
        width: root.size
        height: root.size

        Shape {
            anchors.fill: parent
            layer.enabled: true
            layer.samples: 4
            ShapePath {
                fillColor: "transparent"
                strokeColor: "#45475a"
                strokeWidth: root.stroke
                PathAngleArc {
                    centerX: root.size / 2
                    centerY: root.size / 2
                    radiusX: (root.size / 2) - (root.stroke / 2)
                    radiusY: (root.size / 2) - (root.stroke / 2)
                    startAngle: -90
                    sweepAngle: 360
                }
            }
        }

        Shape {
            anchors.fill: parent
            layer.enabled: true
            layer.samples: 4
            ShapePath {
                fillColor: "transparent"
                strokeColor: root.ringcolor
                strokeWidth: root.stroke
                PathAngleArc {
                    centerX: root.size / 2
                    centerY: root.size / 2
                    radiusX: (root.size / 2) - (root.stroke / 2)
                    radiusY: (root.size / 2) - (root.stroke / 2)
                    startAngle: -90
                    sweepAngle: isNaN(root.percentage) ? 0 : (root.percentage / 100) * 360
                }
            }
        }

        Text {
            anchors.centerIn: parent
            color: "white"
            font.bold: true
            font.pixelSize: root.size / 5
            text: (isNaN(root.percentage) ? "0" : root.percentage) + "%"
        }
    }

    Text {
        Layout.alignment: Qt.AlignHCenter
        color: "#a6adc8"
        font.pixelSize: 14
        text: root.title
    }
    Text {
        Layout.alignment: Qt.AlignHCenter
        color: "#a6adc8"
        font.pixelSize: 14
        text: root.extratext
    }
}
