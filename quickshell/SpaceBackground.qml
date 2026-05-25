import Quickshell
import QtQuick

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: root
        property real mouseX: 0

        property var modelData
        property string prelude: "./images/space_images/"
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

            Rectangle {
                id: bg
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.left: parent.left

                color: "#0e1f2f"
            }

            ParallaxObject {
                path: prelude + "massive.png"
                totalmoved: 0.037
                xpos: 0.78
                ypos: 0.72
                scale: 0.40
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "comet.png"
                totalmoved: 0.008
                xpos: 0.28
                ypos: 0.53
                scale: 0.43
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "ringed.png"
                totalmoved: 0.016
                xpos: 0.5
                ypos: 0.33
                scale: 0.35
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }
            ParallaxObject {
                path: prelude + "tinymiddle.png"
                totalmoved: 0.005
                xpos: 0.45
                ypos: 0.75
                scale: 0.01
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "mediumblue.png"
                totalmoved: 0.018
                xpos: 0.41
                ypos: 0.9
                scale: 0.16
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "mediumbotomleft.png"
                totalmoved: 0.017
                xpos: 0.16
                ypos: 0.7
                scale: 0.1
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "smallbottomleft.png"
                totalmoved: 0.011
                xpos: 0.22
                ypos: 0.89
                scale: 0.034
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "tinybottomleft.png"
                totalmoved: 0.013
                xpos: 0.06
                ypos: 0.9
                scale: 0.02
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "tinyfarleft.png"
                totalmoved: 0.004
                xpos: 0.02
                ypos: 0.5
                scale: 0.015
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "tinytopmiddle.png"
                totalmoved: 0.006
                xpos: 0.45
                ypos: 0.06
                scale: 0.017
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "tinytopmiddleright.png"
                totalmoved: 0.004
                xpos: 0.6
                ypos: 0.1
                scale: 0.011
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "tinytopright.png"
                totalmoved: 0.013
                xpos: 0.75
                ypos: 0.3
                scale: 0.03
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "tinyright.png"
                totalmoved: 0.006
                xpos: 0.97
                ypos: 0.45
                scale: 0.012
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
            }

            ParallaxObject {
                path: prelude + "middletopright.png"
                totalmoved: 0.019
                xpos: 0.87
                ypos: 0.16
                scale: 0.11
                mousePos: root.mouseX

                mode: ParallaxObject.DisplacementMode.Linear
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
