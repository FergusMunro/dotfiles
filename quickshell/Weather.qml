import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "#313244"
    radius: 16

    property var weatherData: WeatherRetriever.weatherData

    function getIcon(code) {
        var c = parseInt(code);
        if (c === 113)
            return "☀️";
        if (c === 116)
            return "⛅";
        if (c === 119 || c === 122)
            return "☁️";
        if (c === 143 || c === 248 || c === 260)
            return "🌫️";
        if (c >= 293 && c <= 314)
            return "🌧️";
        if (c >= 323 && c <= 338)
            return "❄️";
        if (c >= 386 && c <= 395)
            return "⛈️";
        return "🌡️";
    }

    function getDayName(dateStr, index) {
        if (index === 0)
            return "Today";
        var date = new Date(dateStr.replace(/-/g, "/"));
        var options = {
            weekday: 'long'
        };

        const weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

        return weekday[date.getDay()];
    }

    function formatTime(timeStr) {
        if (timeStr === "0")
            return "00:00";
        var padded = timeStr.padStart(4, '0');
        return padded.substring(0, 2) + ":" + padded.substring(2, 4);
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 25
        spacing: 15

        Text {
            color: "#a6adc8"
            font.bold: true
            text: "WEATHER"
        }

        // 3-Day Forecast
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 60

            Repeater {
                model: root.weatherData ? root.weatherData.weather : 0

                delegate: ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 10

                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        color: "#89b4fa"
                        font.bold: true
                        font.pixelSize: 16
                        text: root.getDayName(modelData.date, index)
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: root.getIcon(modelData.hourly[4].weatherCode)
                        font.pixelSize: 36
                    }

                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        font.pixelSize: 16
                        textFormat: Text.RichText

                        text: "<font color='white'><b>" + modelData.maxtempC + "°</b></font> " + "<font color='#585b70'>" + modelData.mintempC + "°</font>"
                    }
                }
            }
        }

        // Today's Forecast
        RowLayout {
            Layout.alignment: Qt.AlignHCenter

            Layout.fillWidth: true
            spacing: 50

            Repeater {
                model: root.weatherData ? root.weatherData.weather[0].hourly.slice(0, 8) : 0

                delegate: ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 5

                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        color: "#a6adc8"
                        text: root.formatTime(modelData.time)
                        font.pixelSize: 12
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        text: root.getIcon(modelData.weatherCode)
                        font.pixelSize: 24
                    }
                    Text {
                        Layout.alignment: Qt.AlignHCenter
                        color: "white"
                        text: modelData.tempC + "°C"
                        font.bold: true
                    }
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
