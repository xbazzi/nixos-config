{ pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        # settings = [
        #     {
        #         main.modules-right = ["clock"];
        #         layer = "top";
        #         position = "top";
        #         modules-left = [ "hyprland/workspaces" "clock" ];
        #         modules-center = [ "window" ];
        #         modules-right = [ "battery" "pulseaudio" "network" ];
        #     }
        # ];
        # style = ''
        #     * {
        #     font-family: "JetBrainsMono Nerd Font", monospace;
        #     font-size: 12px;
        #     }
        #     #workspaces button.active {
        #     background-color: #ff5555;
        #     }
        # '';
        # settings = [ ./waybar/config.jsonc ];
        settings = [
            (builtins.fromJSON (builtins.readFile ./waybar/config.json))
        ];

        style = ./waybar/style.css;
    };
}