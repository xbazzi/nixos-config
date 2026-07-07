{
  config,
  inputs,
  pkgs,
  ...
}:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        no_fade_in = false;
        disable_loading_bar = true;
        ignore_empty_input = true;
        fractional_scaling = 0;
      };

      shape = [
        # User box
        {
          monitor = "";
          size = "300, 50";
          color = "rgba(102, 92, 84, 0.33)";
          rounding = 10;
          border_color = "rgba(255, 255, 255, 0)";
          position = "0, 281";
          halign = "center";
          valign = "bottom";
        }
      ];

      label = [
        # Time
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +'%k:%M')"'';
          color = "rgba(235, 219, 178, 0.9)";
          font_size = 115;
          font_family = "Maple Mono Bold";
          shadow_passes = 3;
          position = "0, 281";
          halign = "center";
          valign = "top";
        }
        # Date
        {
          monitor = "";
          text = ''cmd[update:1000] echo "- $(date +'%A, %B %d') -" '';
          color = "rgba(235, 219, 178, 0.9)";
          font_size = 18;
          font_family = "Maple Mono";
          shadow_passes = 3;
          position = "0, 281";
          halign = "center";
          valign = "top";
        }
        # Username
        {
          monitor = "";
          text = "  $USER";
          color = "rgba(235, 219, 178, 1)";
          font_size = 15;
          font_family = "Maple Mono Bold";
          position = "0, 281";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
