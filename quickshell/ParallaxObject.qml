import QtQuick

Image {
    id: root

    required property string path

    required property real xpos
    required property real ypos

    required property real mousePos
    required property real totalmoved

    required property real scale

    enum DisplacementMode {
        Linear,
        LeftSide,
        RightSide
    }

    property int mode: ParallaxObject.DisplacementMode.Linear
    fillMode: Image.Stretch

    width: parent.width * scale
    height: width * (implicitHeight / implicitWidth) // Maintains proportions

    function findCenterPoint(containerSize, percentMoved, size) {
        return containerSize * percentMoved - (size / 2);
    }

    function applyFn(mousePos) {
        switch (root.mode) {
        case ParallaxObject.Linear:
            return mousePos;
        case ParallaxObject.LeftSide:
            return Math.pow(mousePos, 0.6);
        case ParallaxObject.RightSide:
            return 1 - Math.pow(1 - mousePos, 0.4);
        }
    }

    function mouseDisplacement(mousePos, totalmoved) {
        let scaling = parent.width;
        return -applyFn(mousePos) * totalmoved * scaling;
    }

    x: findCenterPoint(parent.width, xpos, this.width) + mouseDisplacement(mousePos, totalmoved)
    y: findCenterPoint(parent.height, ypos, this.height)

    Behavior on x {
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutCubic
        }
    }
    source: path
}
