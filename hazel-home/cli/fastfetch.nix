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
        "title"
        {
          type = "custom";
          format = "┌───────────────────── Hardware ─────────────────────┐";
        }
        "host"
        "cpu"
        "gpu"
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

        "monitor"
        "de"
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
