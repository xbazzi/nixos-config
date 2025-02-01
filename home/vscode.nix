{ inputs, pkgs, lib, config, ...  }:

{
  programs.vscode = {
    enable = true;
    #package = pkgs.vscode.fhs;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = true;

    # VSCode installation and extensions
    extensions = (with pkgs.vscode-extensions; [
      golang.go
      ms-vscode.cpptools
      ms-vsliveshare.vsliveshare
      bbenoist.nix
      ms-python.python
      laravel.vscode-laravel
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
      vscodevim.vim
      enkia.tokyo-night

    ]);

    # Settings
    userSettings = {
      # General
      "editor.fontSize" = 13;
      #"editor.fontFamily" = "'Jetbrains Mono', 'monospace', monospace";
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace', monospace";
      "window.zoomLevel" = 1;
      "editor.multiCursorModifier" = "ctrlCmd";
      "workbench.startupEditor" = "none";
      "explorer.compactFolders" = false;
      # Whitespace
      "files.trimTrailingWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.insertFinalNewline" = true;
      "diffEditor.ignoreTrimWhitespace" = false;
      # Git
      "git.enableCommitSigning" = true;
      "git-graph.repository.sign.commits" = true;
      "git-graph.repository.sign.tags" = true;
      "git-graph.repository.commits.showSignatureStatus" = true;
      # Styling
      "window.autoDetectColorScheme" = true;
      "workbench.preferredDarkColorTheme" = "Default Dark Modern";
      "workbench.preferredLightColorTheme" = "Default Light Modern";
      "workbench.iconTheme" = "material-icon-theme";
      "material-icon-theme.activeIconPack" = "none";
      "material-icon-theme.folders.theme" = "classic";
      # Other
      "telemetry.telemetryLevel" = "off";
      "update.showReleaseNotes" = false;
     # # Gitmoji
     # "gitmoji.onlyUseCustomEmoji" = true;
     # "gitmoji.addCustomEmoji" = [
     #   {
     #     "emoji" = "📦 NEW:";
     #     "code" = ":package: NEW:";
     #     "description" = "... Add new code/feature";
     #   }
     #   {
     #     "emoji" = "👌 IMPROVE:";
     #     "code" = ":ok_hand: IMPROVE:";
     #     "description" = "... Improve existing code/feature";
     #   }
     #   {
     #     "emoji" = "❌ REMOVE:";
     #     "code" = ":x: REMOVE:";
     #     "description" = "... Remove existing code/feature";
     #   }
     #   {
     #     "emoji" = "🐛 FIX:";
     #     "code" = ":bug: FIX:";
     #     "description" = "... Fix a bug";
     #   }
     #   {
     #     "emoji" = "📑 DOC:";
     #     "code" = ":bookmark_tabs: DOC:";
     #     "description" = "... Anything related to documentation";
     #   }
     #   {
     #     "emoji" = "🤖 TEST:";
     #     "code" = ":robot: TEST:";
     #     "description" = "... Anything realted to tests";
     #   }
     # ];
    };
          # #vscode-extensions.hikarin522.glassit
        # ]
        # ++ pkgs.vscode-utils.extensionsfromvscodemarketplace [
          # {
            # name = "remote-ssh-edit";
            # publisher = "ms-vscode-remote";
            # version = "0.47.2";
            # sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
          # } 
          # {
            # name = "vsliveshare";
            # publisher = "ms-vsliveshare";
            # version = "1.0.5948"; # replace with the latest version
            # sha256 = "kou9zf5l6mtlu8z/l4xbwrl2x3uie15yghezjrkshgy="; # replace with the calculated hash
          # }
          # {
            # name = "glassit";
            # publisher = "s-nlf-fh";
            # version = "0.2.6";
            # sha256 = "lcaomgk91hnjwqaw4i0fagtowr8kwv7zhvgcgkokkuy=";
          # }
        # ];
  };
}
