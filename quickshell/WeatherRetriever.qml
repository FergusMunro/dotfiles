pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    property var weatherData: null

    // Fetch every 3 minutes
    Timer {
        interval: 180000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: fetchWeather()
    }

    function fetchWeather() {
        var req = new XMLHttpRequest();
        req.open("GET", "https://wttr.in/?format=j1");
        req.onreadystatechange = function () {
            if (req.readyState === XMLHttpRequest.DONE) {
                if (req.status === 200) {
                    root.weatherData = JSON.parse(req.responseText);
                } else {
                    console.log("Weather fetch failed with status:", req.status);
                }
            }
        };
        req.send();
    }
}
