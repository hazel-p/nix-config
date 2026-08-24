{
  outputs,
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  services.flameshot = {
  enable = true;
  settings = {
    General = {
      disabledTrayIcon = true;
      showStartupLaunchMessage = false;
      saveAsFileExtension = ".png";
      showDesktopNotification = true;
      showAbortNotification = false;
      showSidePanelButton = true;

      # Color Customization
      uiColor = "#740096";
      contrastUiColor = "#270032";
      drawColor = "#ff0000";

      useGrimAdapter = true;
      disabledGrimWarning = true;
    };
  };
};
}
