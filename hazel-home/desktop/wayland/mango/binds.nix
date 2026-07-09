{inputs, ...}: {
  wayland.windowManager.mango.settings = {
    bind = [
      "SUPER, return, spawn, kitty"
      "SUPER, F, spawn, librewolf"
      "SUPER, D, spawn, rofi -show drun"
      "SUPER, backspace, spawn, wlogout"
      "SUPER, C, killclient"
      "SUPER, G, spawn, grimblast"

      "SUPER, n, switch_layout"

      
      "SUPER, k, view, 1"
      "SUPER, h, view, 2"
      "SUPER+SHIFT, k, tag, 1"
      "SUPER+SHIFT, h, tag, 2"
    ];
  };
}
