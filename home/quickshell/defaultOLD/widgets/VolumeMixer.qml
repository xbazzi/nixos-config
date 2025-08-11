import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Item {
    property bool showPopup: false
    // Get the default audio sink
    property var audioSink: Pipewire.defaultAudioSink

    implicitWidth: volumeButton.width + 20

    PwObjectTracker {
        objects: [audioSink]
    }

    // Volume icon button
    Rectangle {
        // text height + 10px padding

        id: volumeButton

        color: Pipewire.ready ? "transparent" : "red"
        width: volumeText.implicitWidth + 20
        height: volumeText.implicitHeight + 10
        anchors.centerIn: parent

        Text {
            id: volumeText

            anchors.centerIn: parent
            text: `Vol: ${Math.floor(audioSink.audio.volume * 100)}%`
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                showPopup = !showPopup;
                console.log("Volume clicked, showPopup:", showPopup);
            }
        }

    }

    // Floating volume popup window
    PanelWindow {
        id: volumePopup

        visible: showPopup
        exclusiveZone: 0
        implicitWidth: 500
        implicitHeight: 100
        anchors.right: parent.right
        anchors.top: parent.top

        Rectangle {
            anchors.fill: parent
            color: "black"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 30
                spacing: 10

                RowLayout {
                    Label {
                        Layout.fillWidth: true
                        text: `${audioSink.description}`
                        color: "white"
                        font.pixelSize: 16
                    }

                }

                RowLayout {
                    spacing: 10

                    Label {
                        text: `${Math.floor(audioSink.audio.volume * 100)}%`
                        color: "white"
                        font.pixelSize: 16
                    }

                    Slider {
                        Layout.fillWidth: true
                        value: audioSink.audio.volume
                        onValueChanged: audioSink.audio.volume = value
                    }

                }

            }

        }

    }

}
