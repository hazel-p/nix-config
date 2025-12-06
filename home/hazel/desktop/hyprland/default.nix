{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./../wayland-wm
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
        "swww img ~/Pictures/hyprland-wallpapers/berries.jpg"
        "waybar"
        "hypridle"
        "systemctl --user start hyprpolkitagent"
        "swaynotificationcenter"
        "clipse -listen"
        "udiskie"
        "hyprpm reload -n"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        no_focus_fallback = true;
        resize_on_border = true;
        allow_tearing = true;
      };

      decoration = {
        rounding = "6";
        rounding_power = "4.0";
        active_opacity = "1.0";
        inactive_opacity = "0.9";
        blur = {
          size = 15;
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
        enable_hyprcursor = true;
      };

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

      monitor = let
        waybarSpace = let
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
        ",addreserved,${toString waybarSpace.top},${toString waybarSpace.bottom},${toString waybarSpace.left},${toString waybarSpace.right}"
      ];

      # Keybindings
      "$mod" = "SUPER";
      bind = [
        "$mod, return, exec, kitty"
        "$mod, F, exec, firefox"
        "$mod, C, killactive,"
        "$mod, M, exit,"
        "$mod, TAB, exec, nautilus"
        "$mod, space, togglefloating,"
        "$mod, D, exec, rofi -show drun"
        "$mod, P, pseudo"
        "$mod, B, togglesplit,"
        "$mod, V, exec, kitty --class clipse -e clipse"
        "$mod, mouse_down, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 1.1}')" # for zooming
        "$mod, mouse_up, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 0.9}')" # for zooming
        "$mod SHIFT, mouse_up, exec, hyprctl -q keyword cursor:zoom_factor 1" # for zooming
        "$mod SHIFT, mouse_down, exec, hyprctl -q keyword cursor:zoom_factor 1" # for zooming
        "$mod SHIFT, minus, exec, hyprctl -q keyword cursor:zoom_factor 1" # for zooming
        "$mod SHIFT, KP_SUBTRACT, exec, hyprctl -q keyword cursor:zoom_factor 1" # for zooming
        "$mod SHIFT, 0, exec, hyprctl -q keyword cursor:zoom_factor 1" # for zooming

        # Move focus with mainMod + arrow keys
        "$mod, M, movefocus, l"
        "$mod, I, movefocus, r"
        "$mod, N, movefocus, u"
        "$mod, E, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mod, K, workspace, 1"
        "$mod, H, workspace, 2"
        "$mod, comma, workspace, 3"
        "$mod, period, workspace, 4"
        "$mod, code:47, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindel = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        # Requires playerctl
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # For further zooming options

      binde = [
        "$mod, equal, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 1.1}')"
        "$mod, minus, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 0.9}')"
        "$mod, KP_ADD, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 1.1}')"
        "$mod, KP_SUBTRACT, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor | awk '/^float.*/ {print $2 * 0.9}')"
      ];
    };
  };
}
