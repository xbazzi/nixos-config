import "../widgets"
import "./modules"
import QtQuick
import Quickshell
import Quickshell.Io

PanelWindow {
    property int defaultMargin: 0

    implicitHeight: 40
    margins.top: defaultMargin
    margins.left: defaultMargin
    margins.right: defaultMargin
    margins.bottom: defaultMargin
    aboveWindows: true

    anchors {
        top: true
        left: true
        right: true
    }

    Rectangle {
        anchors.fill: parent
        color: "#000000"
    }

    Clock {
        anchors.centerIn: parent
    }

    // Workspaces
    HyprlandWorkspaces {
        anchors.verticalCenter: parent.verticalCenter
    }

    // Right side - Volume button
    VolumeMixer {
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

    }

}
