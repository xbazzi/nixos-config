import QtQuick
import Quickshell
import Quickshell.Io

Item {
    SystemClock {
        id: clock

        precision: SystemClock.Seconds
    }

    Text {
        anchors.centerIn: parent
        color: "#ffffff"
        text: Qt.formatDateTime(clock.date, "ddd MMM d h:m ap")
    }

}
