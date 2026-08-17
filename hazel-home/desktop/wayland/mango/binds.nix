{inputs, ...}: {
  wayland.windowManager.mango.settings = {
    bind = [
      "SUPER, return, spawn, kitty"
      "SUPER, F, spawn, librewolf"
      "SUPER, D, spawn, rofi -show drun"
      "SUPER, backspace, spawn, wlogout"
      "SUPER, C, killclient"
      "SUPER, G, spawn, flameshot gui --clipboard --accept-on-select"

      "SUPER, n, switch_layout"

      
      "SUPER, k, viewtoleft"
      "SUPER, h, viewtoright"
      "SUPER+SHIFT, k, tagtoleft"
      "SUPER+SHIFT, h, tagtoright"
    ];
  };
}
