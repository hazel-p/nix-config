{
  inputs,
  pkgs,
  config,
  ...
}: {
  #Enable KDE
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
