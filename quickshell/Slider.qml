import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Slider {
    id: control

    property color accentColor: "#cba6f7"

    Layout.fillWidth: true
    height: 24

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 200
        implicitHeight: 12
        width: control.availableWidth
        height: implicitHeight
        radius: height / 2
        color: "#1e1e2e"

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            color: control.accentColor
            radius: height / 2
        }
    }

    handle: Rectangle {
        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 20
        implicitHeight: 20
        radius: 10
        color: control.pressed ? Qt.lighter(control.accentColor, 1.2) : control.accentColor
        border.color: "#11111b"
        border.width: 2
    }
}
