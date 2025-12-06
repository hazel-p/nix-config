{
  pkgs,
  config,
  inputs,
  ...
}: let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  hyprland-sessions = "${pkgs.hyprland}/share/wayland-sessions";
  niri-command = "niri-session";
  gnome-sessions = "${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
in {
  # Huge thanks to these two:
  # https://github.com/sjcobb2022/nixos-config/blob/main/hosts/common/optional/greetd.nix
  # https://ryjelsum.me/homelab/greetd-session-choose/

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --time --remember --remember-user-session --cmd ${niri-command} --sessions ${hyprland-sessions}:${gnome-sessions}";
        user = "greeter";
      };
    };
  };
  security.pam.services.greetd.enableGnomeKeyring = true;

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
