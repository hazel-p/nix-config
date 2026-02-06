{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./binds.nix
  ];
  # Initial inspiration from github.com/weatflac505/hyprland-config-with-home-manager
  # Functional inspiration from github.com/Misterio77/nix-config

  home.packages = with pkgs; [
    hyprpicker # color picker from your screen
    hypridle # idle management  daemon
    hyprlock # screen locker
    xdg-desktop-portal-hyprland # lets other applications communicate with the compositor through D-Bus
    hyprsunset # blue light filter, undetected in screenshots
    hyprpolkitagent # polkit authentication daemon, allows GUI applications for elevated permissions
    hyprsysteminfo # GUI application that displays system information
    hyprland-qt-support # provides QML style for hypr*qt6 apps
    hyprcursor # new cursor theme format
    hyprutils # library providing shared implementations of commonly used types across the hypr* ecosystem
    hyprlang # library provides parsing of the hypr configuration language
    hyprwayland-scanner # hw-s,is a utility to generate sources and headers for wayalnd protocol specifications (generates c++ implementations)
    aquamarine # lightweight linux rendering backend library
    hyprgraphics # library providing shared implementations of utilities related to graphics and resources, like loading images or color calculations
    hyprland-qtutils # small bunch of utility applications that hyprland might invoke (stuffs like dialogs and popups)
  ];

  # Enable Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      exec-once = [
        "swww img ~/Pictures/hyprland-wallpapers/cactus.jpg"
        "hypridle"
        "systemctl --user start hyprpolkitagent"
        "swaynotificationcenter"
        "clipse -listen"
        "udiskie"
        "hyprpm reload -n"
        "waybar"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        no_focus_fallback = true;
        resize_on_border = true;
        allow_tearing = true;
        # Gruvbox Material
        "col.inactive_border" = "0xff282828";
        "col.active_border" = "0xffd4be98";
      };

      decoration = {
        rounding = "6";
        rounding_power = "4.0";
        active_opacity = "1.0";
        inactive_opacity = "0.9";
        blur = {
          size = 10;
          passes = 2;
        };
      };

      input = {
        kb_layout = "gb";
        sensitivity = "0.0";
        accel_profile = "";
        follow_mouse = "2";
        touchpad.clickfinger_behavior = true;
      };

      misc = {
        disable_hyprland_logo = true;
        font_family = "iosevka";
        vrr = "3";
        render_unfocused_fps = "10";
        anr_missed_pings = "1";
      };

      cursor = {
        sync_gsettings_theme = true;
        inactive_timeout = "5.0";
        warp_on_change_workspace = "1";
        enable_hyprcursor = false;
      };

      workspace = [
        "1, persistent:true"
        "2, persistent:true"
        "3, persistent:true"
        "4, persistent:true"
      ];
      ecosystem.no_donation_nag = true;

      env = [
        "NIXOS_OZONE_WL, 1"
        #"GTK_THEME, Dark-Gruvbox" # required for Nautilus to apply current theme
        #"COLOR_SCHEME, prefer-dark"
        "XDG_SESSION_DESKTOP, Hyprland"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_DESKTOP_DIR, $HOME/Desktop"
        "XDG_DOWNLOAD_DIR, $HOME/Downloads"
        "XDG_TEMPLATES_DIR, $HOME/Templates"
        "XDG_PUBLICSHARE_DIR, $HOME/Public"
        "XDG_DOCUMENTS_DIR, $HOME/Documents"
        "XDG_MUSIC_DIR, $HOME/Music"
        "XDG_PICTURES_DIR, $HOME/Pictures"
        "XDG_VIDEOS_DIR, $HOME/Videos"
        "HYPRSHOT_DIR, $HOME/Pictures/Screenshots"
      ];

      #monitor = "DP-1, 1920x1080@143.85";
      monitor = let
        wayb = let
          inherit (config.wayland.windowManager.hyprland.settings.general) gaps_in gaps_out;
          inherit (config.programs.waybar.settings.primary) position height width;
          gap = gaps_out - gaps_in;
        in {
          top =
            if (position == "top")
            then height + gap
            else 0;
          bottom =
            if (position == "bottom")
            then height + gap
            else 0;
          left =
            if (position == "left")
            then width + gap
            else 0;
          right =
            if (position == "right")
            then width + gap
            else 0;
        };
      in [
        ",highrr,0x0,1" # Main monitor
        ",addreserved,${toString wayb.top},${toString wayb.bottom},${toString wayb.left},${toString wayb.right}"
      ];
    };
  };
}
