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
        "awww img ~/Pictures/hyprland-wallpapers/cactus.jpg"
        "swaynotificationcenter"
        "clipse -listen"
        "udiskie"
      ];
      monitorrule = "name:MAG241C, refresh:143.85";
      xkb_rules_layout = "gb";
    };
  };
}
