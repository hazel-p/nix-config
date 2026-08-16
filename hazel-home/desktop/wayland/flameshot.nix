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
      savePath = "/home/user/Screenshots";
      disabledTrayIcon = true;
      showStartupLaunchMessage = false;
      saveAsFileExtension = ".png";
      showDesktopNotification = true;
      showAbortNotification = false;
      showHelp = true;
      showSidePanelButton = true;
      useX11LegacyScreenshot = true;
      captureActiveMonitor = true;

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
