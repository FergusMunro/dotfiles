pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    property string time: Qt.formatDateTime(new Date(), "ddd MMM d  HH:mm")

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            root.time = Qt.formatDateTime(new Date(), "ddd MMM d  HH:mm");
        }
    }
}
