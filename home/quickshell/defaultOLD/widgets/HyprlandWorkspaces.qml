import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io

Row {
    spacing: 1
    anchors.verticalCenter: parent.verticalCenter
    showEmpty: false
    anchors.left: parent.left
    anchors.leftMargin: 10

    Repeater {
        model: Hyprland.workspaces

        Rectangle {
            visible: modelData.id > 0 // "Magic" workspaces have IDs < 0
            width: 30
            height: 30
            color: modelData.focused ? "#ffffff" : "transparent"

            Text {
                anchors.centerIn: parent
                text: modelData.id.toString()
                color: modelData.focused ? "#000000" : "#ffffff"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: modelData.activate()
            }

        }

    }

}
