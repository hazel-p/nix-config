{
  pkgs,
  config,
  inputs,
  ...
}: let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  hyprland-sessions = "${pkgs.hyprland}/share/wayland-sessions";
  gnome-sessions = "${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
in {
  # Huge thanks to these two:
  # https://github.com/sjcobb2022/nixos-config/blob/main/hosts/common/optional/greetd.nix 
  # https://ryjelsum.me/homelab/greetd-session-choose/

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --sessions ${hyprland-sessions}:${gnome-sessions} --remember --remember-user-session";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
