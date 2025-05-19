{
  inputs,
  config,
  pkgs,
  ...
}: {
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = false;

  services.udev.packages = with pkgs; [gnome-settings-daemon];
}
