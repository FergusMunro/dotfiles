import QtQuick
import QtQuick.Layouts
import Quickshell

ShellRoot {
    Variants {
        model: Quickshell.screens

        Scope {
            id: monitorScope

            required property var modelData

            property var screenData: modelData
            property bool dashboardOpen: false

            PanelWindow {
                id: topBar
                screen: monitorScope.screenData
                anchors {
                    top: true
                    left: true
                    right: true
                }
                implicitHeight: 40
                color: "#1e1e2e"
                exclusiveZone: 40

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: monitorScope.dashboardOpen = !monitorScope.dashboardOpen
                }
                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15
                    spacing: 0

                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        DateWidget {}
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        WorkspaceWidget {
                            screen: monitorScope.screenData
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        SysSummaryWidget {}
                    }
                }
            }

            PanelWindow {
                id: dashboardWindow
                anchors {
                    top: true
                    bottom: true
                    left: true
                    right: true
                }
                color: "transparent"
                mask: Region {
                    item: monitorScope.dashboardOpen ? dashContent : null
                }

                Rectangle {
                    id: dashContent
                    width: parent.width
                    height: parent.height
                    color: "#11111b"

                    y: monitorScope.dashboardOpen ? 0 : -height
                    Behavior on y {
                        NumberAnimation {
                            duration: 450
                            easing.type: Easing.OutExpo
                        }
                    }
                    opacity: monitorScope.dashboardOpen ? 0.98 : 0
                    Behavior on opacity {
                        NumberAnimation {
                            duration: 300
                        }
                    }

                    RowLayout {
                        anchors.fill: parent
                        anchors.topMargin: 80
                        anchors.bottomMargin: 80
                        anchors.leftMargin: 140
                        anchors.rightMargin: 140
                        spacing: 45

                        ColumnLayout {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Layout.preferredWidth: parent.width * 0.45
                            spacing: 45

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
                                        text: "LAUNCHER"
                                    }

                                    RowLayout {
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.leftMargin: 15
                                        Layout.rightMargin: 15
                                        spacing: 0

                                        Item {
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true

                                            Image {
                                                source: "./images/launcher_icons/terminal.png"
                                                sourceSize.width: 100
                                                sourceSize.height: 100
                                                Layout.preferredWidth: 100
                                                Layout.preferredHeight: 100
                                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                                                MouseArea {
                                                    anchors.fill: parent
                                                    onClicked: {
                                                        Quickshell.execDetached(["kitty", "--directory", "~"]);
                                                        monitorScope.dashboardOpen = !monitorScope.dashboardOpen;
                                                    }
                                                }
                                            }
                                        }

                                        Item {
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            Image {
                                                source: "./images/launcher_icons/firefox.png"

                                                sourceSize.width: 100
                                                sourceSize.height: 100
                                                Layout.preferredWidth: 100
                                                Layout.preferredHeight: 100
                                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                                                MouseArea {
                                                    anchors.fill: parent
                                                    onClicked: {
                                                        Quickshell.execDetached(["firefox", "--directory", "~"]);
                                                        monitorScope.dashboardOpen = !monitorScope.dashboardOpen;
                                                    }
                                                }
                                            }
                                        }

                                        Item {
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true

                                            Image {
                                                source: "./images/launcher_icons/steam.png"

                                                sourceSize.width: 100
                                                sourceSize.height: 100
                                                Layout.preferredWidth: 100
                                                Layout.preferredHeight: 100
                                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                                                MouseArea {
                                                    anchors.fill: parent
                                                    onClicked: {
                                                        Quickshell.execDetached(["steam"]);
                                                        monitorScope.dashboardOpen = !monitorScope.dashboardOpen;
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    RowLayout {
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.leftMargin: 15
                                        Layout.rightMargin: 15
                                        spacing: 0

                                        Item {
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true

                                            Image {
                                                source: "./images/launcher_icons/obsidian.png"

                                                sourceSize.width: 100
                                                sourceSize.height: 100
                                                Layout.preferredWidth: 100
                                                Layout.preferredHeight: 100
                                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                                                MouseArea {
                                                    anchors.fill: parent
                                                    onClicked: {
                                                        Quickshell.execDetached(["kitty", "nvim", "-c", "Obsidian today", "/home/fergus/Documents/Personal/"]);
                                                        monitorScope.dashboardOpen = !monitorScope.dashboardOpen;
                                                    }
                                                }
                                            }
                                        }

                                        Item {
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true

                                            Image {
                                                source: "./images/launcher_icons/terminal.png"

                                                sourceSize.width: 100
                                                sourceSize.height: 100
                                                Layout.preferredWidth: 100
                                                Layout.preferredHeight: 100
                                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                                                MouseArea {
                                                    anchors.fill: parent
                                                    onClicked: {
                                                        // todo
                                                    }
                                                }
                                            }
                                        }

                                        Item {
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true

                                            Image {
                                                source: "./images/launcher_icons/rofi.png"

                                                sourceSize.width: 70
                                                sourceSize.height: 70
                                                Layout.preferredWidth: 70
                                                Layout.preferredHeight: 70
                                                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                                                MouseArea {
                                                    anchors.fill: parent
                                                    onClicked: {
                                                        Quickshell.execDetached(["sh", "-c", "bash ~/.config/rofi/launcher.sh"]);
                                                        monitorScope.dashboardOpen = !monitorScope.dashboardOpen;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Tasks {}
                        }

                        ColumnLayout {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Layout.preferredWidth: parent.width * 0.55
                            spacing: 45

                            Weather {}

                            SysDataWidget {}

                            Settings {}
                        }
                    }
                }
            }
        }
    }
}
