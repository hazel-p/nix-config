{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo.source = "nixos-old";
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
          format = "{name} ({cores-physical}/{cores-logical}C {freq-max:4}GHz) {temperature}";
        }
        {
          type = "gpu";
          key = "  gpu";
          keyColor = "red";
          temp = true;
          format = "{vendor} {name} - {12} {temperature}";
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
          type = "monitor";
          key = "  monitor";
          format = "{1} {2}x{3} @ {11}Hz - {6}inch";
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
          key = "  shell";
          keyColor = "yellow";
        }
        {
          type = "de";
          key = "  de";
          keyColor = "yellow";
        }
        {
          type = "wm";
          key = "  wm";
          keyColor = "yellow";
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
          key = "  current time";
          keyColor = "green";
          format = "{weekday} {day-in-month} {month-name-short} {hour-pretty}:{minute-pretty}";
        }
        {
          type = "command";
          key = "  last rebuilt";
          keyColor = "green";
          text = "stat -c %Y /run/current-system | sed 's/^/@/' | date --file=- +'%A %e %b %R'";
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
