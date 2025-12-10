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
        "break"

        "os"
        "kernel"
        "packages"

        "break"

        "uptime"
        "datetime"
        "localip"
        "locale"

        "break"

        "host"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "battery"
        "poweradapter"

        "break"

        "monitor"
        "de"
        "wm"
        "wmtheme"
        "theme"
        "icons"
        "font"
        "cursor"
        "break"

        "terminal"
        "terminalfont"
        "shell"
        "editor"
        "colors"
      ];
    };
  };
}
