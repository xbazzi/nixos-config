/*
  This file is for configuring all the normal things
  you would need in a desktop environment that
  hyprland doesn't come with by default
  such as:
  - A file manager
  - An image viewer
  - Video player
*/
{
  pkgs,
  ...
}:
# Complete Desktop Applications Suite for Home Manager
{
  # Media Viewers
  home.packages = with pkgs; [
    # *** File Manager ***
    xfce.thunar
    xfce.thunar-volman # Removable drive support
    xfce.thunar-media-tags-plugin
    # Essential thumbnail generators
    xfce.tumbler # Thunar's thumbnail service
    ffmpegthumbnailer # Video thumbnails
    libgsf # Office document thumbnails
    poppler # PDF thumbnails
    # ********************

    # Image Viewers
    kdePackages.gwenview # KDE image viewer - integrates well with Dolphin
    # feh             # Lightweight alternative

    # Video Players
    mpv

    # Audio Players
    kdePackages.elisa # KDE music player

    # Document Viewers
    kdePackages.okular # KDE PDF/document viewer

    # Archive Managers
    kdePackages.ark # KDE archive manager

    # Text Editors
    kdePackages.kate # KDE advanced text editor
    # kwrite # KDE simple text editor
    # gedit           # GNOME text editor alternative

    # Office & Productivity
    # libreoffice     # Full office suite
    # onlyoffice-bin  # Alternative office suite
  ];

  # XDG MIME associations for seamless integration
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Image files
      "image/jpeg" = "org.kde.gwenview.desktop";
      "image/png" = "org.kde.gwenview.desktop";
      "image/gif" = "org.kde.gwenview.desktop";
      "image/bmp" = "org.kde.gwenview.desktop";
      "image/tiff" = "org.kde.gwenview.desktop";
      "image/webp" = "org.kde.gwenview.desktop";
      "image/svg+xml" = "org.kde.gwenview.desktop";

      # Video files
      "video/mp4" = "mpv.desktop";
      "video/mpeg" = "mpv.desktop";
      "video/quicktime" = "mpv.desktop";
      "video/x-msvideo" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/webm" = "mpv.desktop";

      # Audio files
      "audio/mpeg" = "org.kde.elisa.desktop";
      "audio/flac" = "org.kde.elisa.desktop";
      "audio/x-wav" = "org.kde.elisa.desktop";
      "audio/ogg" = "org.kde.elisa.desktop";
      "audio/mp4" = "org.kde.elisa.desktop";

      # Document files
      "application/pdf" = "org.kde.okular.desktop";
      "application/postscript" = "org.kde.okular.desktop";
      "application/epub+zip" = "org.kde.okular.desktop";

      # Text files
      "text/plain" = "org.kde.kate.desktop";
      "text/markdown" = "org.kde.kate.desktop";
      "application/x-shellscript" = "org.kde.kate.desktop";

      # Archive files
      "application/zip" = "org.kde.ark.desktop";
      "application/x-tar" = "org.kde.ark.desktop";
      "application/x-compressed-tar" = "org.kde.ark.desktop";
      "application/x-7z-compressed" = "org.kde.ark.desktop";
      "application/x-rar" = "org.kde.ark.desktop";

      # Directory
      "inode/directory" = "org.kde.dolphin.desktop";
    };
  };

  # Configure specific programs
  programs = {
    # Configure mpv for advanced video playback
    mpv = {
      enable = true;
      config = {
        # Hardware acceleration
        hwdec = "auto";
        vo = "gpu";

        # UI improvements
        osc = true;
        border = false;

        # Subtitle settings
        sub-auto = "fuzzy";
        sub-file-paths = "ass:srt:sub:subs:subtitles";

        # Audio settings
        volume = 100;
        volume-max = 200;
      };
    };
  };

  # Optional: Create custom desktop entries for specific workflows
  xdg.desktopEntries = {
    # Open terminal in current directory (for Dolphin integration)
    "terminal-here" = {
      name = "Terminal Here";
      comment = "Open terminal in current location";
      exec = "kitty --workdir %u";
      icon = "utilities-terminal";
      mimeType = [ "inode/directory" ];
      noDisplay = true;
    };
  };
}
