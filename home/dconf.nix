{ inputs, pkgs, lib, config, ...  }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false; # enables user extensions
        enabled-extensions = [
          # Put UUIDs of extensions that you want to enable here.
          # If the extension you want to enable is packaged in nixpkgs,
          # you can easily get its UUID by accessing its extensionUuid
          # field (look at the following example).
          pkgs.gnomeExtensions.gsconnect.extensionUuid
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
          pkgs.gnomeExtensions.pop-shell.extensionUuid
          pkgs.gnomeExtensions.tactile.extensionUuid
          pkgs.gnomeExtensions.pop-shell.extensionUuid
          pkgs.gnomeExtensions.space-bar.extensionUuid
          pkgs.gnomeExtensions.undecorate.extensionUuid
          pkgs.gnomeExtensions.pastafarian-holy-days.extensionUuid
          pkgs.gnomeExtensions.just-perfection.extensionUuid

        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };

      # Configure individual extensions
      "org/gnome/shell/extensions/blur-my-shell" = {
        brightness = 0.75;
        noise-amount = 0;
      };
    };
  };
}
