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
        {
          type = "host";
          key = "  host";
          keyColor = "red";
        }
        {
          type = "cpu";
          key = "  cpu";
          keyColor = "red";
          temp = true;
          format = "{name} ({cores-physical}/{cores-logical} @{freq-max:4}) {temperature}";
        }
        {
          type = "gpu";
          key = "  gpu";
          keyColor = "red";
          temp = true;
          format = "{vendor} {name} ({12}) {temperature}";
        }
        {
          type = "memory";
          key = "  mem";
          keyColor = "red";
        }
        {
          type = "disk";
          key = "  disk [/{name}]";
          keyColor = "red";
        }
        {
          type = "battery";
          key = "  battery";
          keyColor = "red";
        }
        {
          type = "poweradapter";
          key = "  power";
          keyColor = "red";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }

        {
          type = "custom";
          format = "┌───────────────────── Software ─────────────────────┐";
        }
        {
          type = "os";
          key = "  os";
          keyColor = "yellow";
        }
        {
          type = "kernel";
          key = "  kernel";
          keyColor = "yellow";
        }
        {
          type = "packages";
          key = "  packages";
          keyColor = "yellow";
        }
        {
          type = "shell";
          key =  "  shell";
          keyColor = "yellow";
        }
        {
          type = "de";
          key = "  de";
          keyColor = "blue";
        }
        {
          type = "monitor";
          key = "  monitor";
          keyColor = "blue";
        }
        {
          type = "wm";
          key = "  wm";
          keyColor = "blue";
        }
        {
          type = "wmtheme";
          key = "  wmtheme";
          keyColor = "blue";
        }
        {
          type = "theme";
          key = "  theme";
          keyColor = "blue";
        }
        {
          type = "icons";
          key = "  icons";
          keyColor = "blue";
        }
        {
          type = "font";
          key = "  font";
          keyColor = "blue";
        }
        {
          type = "cursor";
          key = "  cursor";
          keyColor = "blue";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }

        {
          type = "custom";
          format = "┌─────────────── Configuration & Info ───────────────┐";
        }
        {
          type = "uptime";
          key = "  uptime";
          keyColor = "green";
        }
        {
          type = "datetime";
          key = "  date & time";
          keyColor = "green";
        }
        {
          type = "localip";
          key = "  local ip";
          keyColor = "green";
        }
        {
          type = "locale";
          key = "  locale";
          keyColor = "green";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }

        {
          type = "colors";
          symbol = "circle";
          paddingLeft = 19;
        }
      ];
    };
  };
}
