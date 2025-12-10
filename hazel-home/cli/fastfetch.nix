{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo.source = "nixos-small";
      modules = [
        {
          type = "custom";
          format = "┌───────────────────── Hardware ─────────────────────┐";
        }
        "host"
        {
          type = "cpu";
          temp = true;
          format = "{name} ({cores-physical}/{cores-logical} @{freq-max:4}) {temperature}";
        }
        {
          type = "gpu";
          temp = true;
          format = "{vendor} {name} ({12}) {temperature}";
        }
        "memory"
        "disk"
        "battery"
        "poweradapter"
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }

        "break"

        {
          type = "custom";
          format = "┌───────────────────── Software ─────────────────────┐";
        }
        "os"
        "kernel"
        "packages"
        "shell"

        "de"
        "monitor"
        "wm"
        "wmtheme"
        "theme"
        "icons"
        "font"
        "cursor"
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌─────────────── Configuration & Info ───────────────┐";
        }
        "uptime"
        "datetime"
        "localip"
        "locale"
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        "colors"
      ];
    };
  };
}
