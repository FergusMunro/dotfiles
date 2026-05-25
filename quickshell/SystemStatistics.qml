pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Io
import Quickshell.Services.UPower

Singleton {
    id: root

    property string cpuPercent
    property string memPercent
    property string memAmount

    property string batPercent: UPower.displayDevice.percentage * 100

    function formatTime(seconds) {
        let h = Math.floor(seconds / 3600);
        let m = Math.floor((seconds % 3600) / 60);
        return (h > 0 ? h + "h " : "") + m + "m";
    }

    property string batteryTimeString: {
        let ttf = UPower.displayDevice.timeToFull;
        let tte = UPower.displayDevice.timeToEmpty;

        if (ttf > 0) {
            return formatTime(ttf) + " until fully charged";
        } else if (tte > 0) {
            return formatTime(tte) + " remaining";
        } else {
            return "Fully charged";
        }
    }

    Process {
        id: get_cpu_percent

        command: ["/home/fergus/.config/quickshell/scripts/cpu"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                onStreamFinished: root.cpuPercent = this.text.trim();
            }
        }
    }

    Process {
        id: get_mem_percent

        command: ["/home/fergus/.config/quickshell/scripts/mem_percent"]

        running: true

        stdout: StdioCollector {
            onStreamFinished: root.memPercent = this.text.trim()
        }
    }
    Process {
        id: get_mem_total

        command: ["/home/fergus/.config/quickshell/scripts/memory"]

        running: true

        stdout: StdioCollector {
            onStreamFinished: root.memAmount = this.text.trim()
        }
    }

    Timer {
        interval: 3000
        running: true
        repeat: true
        onTriggered: {
            get_cpu_percent.running = true;
            get_mem_percent.running = true;
            get_mem_total.running = true;
        }
    }
}
