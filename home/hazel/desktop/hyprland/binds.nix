{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    # Keybindings
    "$mod" = "SUPER";
    bind = [
      "$mod, return, exec, kitty"
      "$mod, F, exec, firefox"
      "$mod, C, killactive,"
      "$mod, backspace, exit,"
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
      "$mod, N, movefocus, d"
      "$mod, E, movefocus, u"

      # Switch workspaces with mainMod + [0-9]
      "$mod, K, workspace, 1"
      "$mod, H, workspace, 2"
      "$mod, comma, workspace, 3"
      "$mod, period, workspace, 4"
      "$mod, code:47, workspace, 5"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mod SHIFT, K, movetoworkspace, 1"
      "$mod SHIFT, H, movetoworkspace, 2"
      "$mod SHIFT, comma, movetoworkspace, 3"
      "$mod SHIFT, period, movetoworkspace, 4"
      "$mod SHIFT, code:47, movetoworkspace, 5"
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
}
