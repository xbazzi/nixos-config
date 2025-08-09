{ pkgs, ... }:

{
  home.packages = [ pkgs.quickshell ];

  # start it when Hyprland starts
  wayland.windowManager.hyprland.settings.exec-once = [
    "quickshell -c default"
  ];

  # write the Quickshell config
  xdg.configFile."quickshell/default/shell.qml".text = ''
    import Quickshell
    import Quickshell.Io
    import QtQuick

    // one window per screen
    Variants {
      model: Quickshell.screens
      delegate: Component {
        PanelWindow {
          required property var modelData
          screen: modelData

          // top bar, full width
          anchors.top: true
          anchors.left: true
          anchors.right: true
          implicitHeight: 30    // tweak height if yuh want

          Rectangle {
            anchors.fill: parent
            color: "#1a1a1a"
            opacity: 0.92
          }

          // center clock
          Text {
            id: clock
            anchors.centerIn: parent
            font.pixelSize: 13
            color: "#e6e6e6"
          }

          // update clock every second using `date`
          Process {
            id: dateProc
            command: [ "date", "+%a %b %d  %H:%M:%S" ]
            running: true
            stdout: StdioCollector {
              onStreamFinished: clock.text = this.text.trim()
            }
          }
          Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: dateProc.running = true
          }
        }
      }
    }
  '';
}
