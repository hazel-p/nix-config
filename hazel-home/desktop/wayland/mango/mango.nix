{inputs, ...}: {
  imports = [
    inputs.mangowm.hmModules.mango
    ./binds.nix
    ./looks.nix
    ./layouts.nix
  ];

  wayland.windowManager.mango = {
    enable = true;
    settings = {
      exec-once = [
        "swaynotificationcenter"
        "clipse -listen"
        "udiskie"
        "awww-daemon"
        "awww img ~/Pictures/hyprland-wallpapers/cactus.jpg"
        "noctalia"
      ];
      monitorrule = "name:^DP-3$, width:1920, height:1080, refresh:143.854996, x:0, y:0, scale:1.000000, rr:0";
      allow_tearing = 1;
      xkb_rules_layout = "gb";
    };
  };
}
