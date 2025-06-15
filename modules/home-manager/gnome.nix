{pkgs, ...}: {
  home.packages = with pkgs; [
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.just-perfection
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        favorite-apps = [
          "firefox.desktop"
          "kitty.desktop"
          "spotify.desktop"
          "steam.desktop"
          "stremio.desktop"
          "discord.desktop"
          "obsidian.desktop"
          "prismlauncher.desktop"
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/mutter" = {
        experimental-features = ["scale-monitor-framebuffer"];
      };
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/blobs-d.svg";
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "AlphabeticalAppGrid@stuarthayhurst"
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
          "clipboard-indicator@tudmotu.com"
          "just-perfection-desktop@just-perfection"
        ];
      };
      "org/gnome/desktop/interface" = {
        clock-show-seconds = true;
      };
    };
  };
}
