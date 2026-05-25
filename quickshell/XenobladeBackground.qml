import Quickshell
import Quickshell.Io
import QtQuick

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: root
        property real mouseX: 0

        property string timeOfDay: calculateTimeOfDay()
        readonly property string prelude: "./images/xc2bg/" + timeOfDay + "/"

        function calculateTimeOfDay() {
            const hour = new Date().getHours();

            if (hour >= 5 && hour < 17) {
                return "day";
            } else if (hour >= 17 && hour < 21) {
                return "evening";
            } else {
                return "night";
            }
        }

        Timer {
            interval: 60000
            running: true
            repeat: true
            onTriggered: {
                let newTime = calculateTimeOfDay();
                if (root.timeOfDay !== newTime) {
                    root.timeOfDay = newTime;
                    console.log("Time changed to: " + newTime);
                }
            }
        }

        property var modelData
        screen: modelData

        aboveWindows: false
        color: "transparent"
        anchors {
            top: true
            left: true
            bottom: true
            right: true
        }

        Item {
            anchors.fill: parent

            Image {
                id: bg
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.left: parent.left
                source: prelude + "background.png"
            }

            ParallaxObject {
                path: prelude + "cloud.png"
                totalmoved: 0.0001
                xpos: 0.5
                ypos: 0.93
                scale: 1
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.LeftSide
            }

            ParallaxObject {
                path: prelude + "gramps.png"
                totalmoved: 0.15
                xpos: 0.17
                ypos: 0.712
                scale: 0.4
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.LeftSide
            }

            ParallaxObject {
                path: prelude + "argentum.png"
                totalmoved: 0.03
                xpos: 0.3
                ypos: 0.7
                scale: 0.2
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "indol.png"
                totalmoved: 0.025
                xpos: 0.2
                ypos: 0.2
                scale: 0.24
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "tree.png"
                totalmoved: 0.005
                xpos: 0.5
                ypos: 0.3
                scale: 0.24
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "uraya.png"
                totalmoved: 0.024
                xpos: 0.45
                ypos: 0.4
                scale: 0.4
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "genbu.png"
                totalmoved: 0.034
                xpos: 0.62
                ypos: 0.84
                scale: 0.35
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "leftheria.png"
                totalmoved: 0.01
                xpos: 0.65
                ypos: 0.64
                scale: 0.15
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "morardain.png"
                totalmoved: 0.023
                xpos: 0.78
                ypos: 0.66
                scale: 0.13
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "gormott.png"
                totalmoved: 0.053
                xpos: 1.02
                ypos: 0.56
                scale: 0.4
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.RightSide
            }

            MouseArea {
                id: mousearea
                anchors.fill: parent
                hoverEnabled: true

                onPositionChanged: mouse => {
                    root.mouseX = (mouse.x / width);
                }

                onExited: {
                    root.mouseX = 0.5;
                }
            }
        }
    }
}
