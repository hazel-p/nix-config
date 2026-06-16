{inputs, ...}: {
  wayland.windowManager.mango.settings = {
    bind = [
      "SUPER, return, spawn, kitty"
      "SUPER, F, spawn, librewolf"
      "SUPER, D, spawn, rofi -show drun"
      "SUPER, backspace, spawn, wlogout"
      "SUPER, C, killclient"
    ];
  };
}
