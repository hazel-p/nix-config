{pkgs, ...}: {
  # Initial inspiration from github.com/weatflac505/hyprland-config-with-home-manager
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

    swaynotificationcenter # must have notification daemon for smooth hyprland experience (includes pipewire, XDG desktop portal, Authentication agent, Qt wayland support)
    waybar # wayland native panel
    eww # compositor independent to create widgets (alternative:fabric) , I prefer over waybar
    wofi # launcher
    clipse # clipboard manager, stores both text and images, can display in a box (alternative:cliphist)
    wl-clip-persist # solves the problem of copied data getting deleted from clipboard upon closing of applications
    wl-clipboard # required for clipboards in wayland , cli utility for wayland
    udiskie # mounts mass storage devices automatically
    overskride # powerful bluetoothclient in gtk4
    ashell # minimal alternative to nm-applet(wayland native), simple independent window popup, doesn't require a tray
    playerctl # cli tool to control media players
    wldash # a wayland native launcher
    wlogout # manages logout options, exists independently of hyprlock
    fira-code # font to be used
    nwg-look # GTK settings editor, designed to work properly in wlroots-based Wayland environment
  ];

  # Enable Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      exec-once = [
        "systemctl --user enable --now hyprpaper.service"
        "hypridle"
        "systemctl --user start hyprpolkitagent"
        "swaynotificationcenter"
        "waybar"
        "clipse -listen"
        "udiskie"
        "hyprpm reload -n"
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
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
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

        # Example special workspace (scratchpad)
        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
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
      general = {
        gaps_in = "10, 10, 10, 10";
        gaps_out = "10, 10, 10, 10";
        col.inactive_border = "#E94057";
        col.active_border = "#3b8d99";
        col.nogroup_border = "#240b36";
        col.nogroup_border_active = "#93291E";
        no_focus_fallback = true;
        resize_on_border = true;
        allow_tearing = true;
      };

      decoration = {
        rounding = "6";
        rounding_power = "4.0";
        active_opacity = "0.95";
        inactive_opacity = "0.9";
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
    };
  };

  # Environment Variables
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XCURSOR_SIZE = "24";
  };

  # ========================================================= App configurations ================================================================================

  # For hypridle (uses listner) along with hyprlock
  #  general = {
  #      lock_cmd = pidof hyprlock || hyprlock;                            # avoid starting multiple hyprlock instances.
  #      before_sleep_cmd = loginctl lock-session;                         # lock before suspend.
  #      after_sleep_cmd = hyprctl dispatch dpms on;                       # to avoid having to press a key twice to turn on the display.
  #  };

  #  listener = {
  #      timeout = "150";                                                  # 2.5min.
  #      on-timeout = brightnessctl -s set 10;                             # set monitor backlight to minimum, avoid 0 on OLED monitor.
  #      on-resume = brightnessctl -r;                                     # monitor backlight restore.
  #      on-timeout = brightnessctl -sd rgb:kbd_backlight set 0;           # turn off keyboard backlight.
  #     on-resume = brightnessctl -rd rgb:kbd_backlight;                  # turn on keyboard backlight.
  #  };

  #  listener = {
  #      timeout = "300";                                                  # 5min
  #      on-timeout = loginctl lock-session;                               # lock screen when timeout has passed
  #  };

  #  listener = {
  #      timeout = "330";                                                  # 5.5min
  #      on-timeout = hyprctl dispatch dpms off;                           # screen off when timeout has passed
  #      on-resume = hyprctl dispatch dpms on && brightnessctl -r;         # screen on when activity is detected after timeout has fired.
  #  };

  #  listener = {
  #      timeout = "1800";                                                 # 30min
  #      on-timeout = systemctl suspend;                                   # suspend pc
  #  };

  #------------------------------------------------------------------------------------------------------------------------------------------------------------------
  # for hyprland-qt-support                                              # out of (1-3)
  # roundness = "2";
  # border_width = "1";
  # reduce_motion = true;                                                 # reduce motion of elements (transitions, hover effects, etc)
  #------------------------------------------------------------------------------------------------------------------------------------------------------------------

  # Rofi Configuration
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "${pkgs.rofi}/share/rofi/themes/material.rasi";
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
    };
  };
        #/*
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = true;
      splash = false;
      preload = ["/home/hazel/Pictures/hyprland-wallpapers/dreamscape.png"];
      wallpaper = [",/home/hazel/Pictures/hyprland-wallpapers/dreamscape.png"];
    };
  };
#*/
}
