{
  inputs,
  pkgs,
  config,
  ...
}: {
  #Enable Hyprland
  programs.hyprland.enable = true; # enable Hyprland
  environment.systemPackages = [ pkgs.kitty ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.getty.autologinUser = "hazel";
}
