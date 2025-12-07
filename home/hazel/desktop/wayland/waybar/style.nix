{
  outputs,
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  programs.waybar = {
    style = let
      # Gruvbox Material
      bgt = "rgba(40,40,40,0.3)"; # transparent background1
      bg1 = "#282828"; # background grey
      bg2 = "#3c3836"; # lighter background
      fg0 = "#d4be98"; # foreground
      acc = "#e78a4e"; # bright orange
    in
      /*
      css
      */
      ''
        * {
            font-family: "Fira Sans", "FiraMono Nerd Font";
            font-size: 12pt;
            padding: 0;
            margin: 0 0.4em;
          }

          window#waybar {
            padding: 10px;
            border-radius: 0.5em;
            background-color: ${bgt};
            color: ${fg0};
          }
          .modules-center {
            background-color: ${bg1};
            border-radius: 0.5em;
          }
          .modules-left {
            background-color: ${bg1};
            margin-left: -0.4em;
            border-radius: 0.5em;
          }
          .modules-right {
            background-color: ${bg1};
            margin-right: -0.4em;
            border-radius: 0.5em;
          }


          #workspaces {
            padding: 0px 0px;
          }
          #workspaces button {
            all:unset;
            padding: 0px 5px;
            color: ${fg0};
            transition: all .2s ease;
          }
          #workspaces button:hover {
            color: ${acc};
            border: none;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
            transition: all 1s ease;
          }
          #workspaces button.active {
            color: ${acc};
            border: none;
            text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
          }
          #workspaces button.empty {
          color: ${bg2};
            border: none;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
          }
          #workspaces button.empty:hover {
            color: ${acc};
            border: none;
            text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
            transition: all 1s ease;
          }
          #workspaces button.empty.active {
            color: ${acc};
            border: none;
            text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
          }

          #custom-menu {
            background-color: ${bg2};
            color: ${acc};
            padding-right: 1.5em;
            padding-left: 1em;
            margin-left: 0;
            border-radius: 0.5em;
          }
          #clock {
            background-color: ${bg1};
            color: ${fg0};
            padding-right: 0.8em;
            padding-left: 0.7em;
            margin-right: 0;
            border-radius: 0.5em;
          }

          #custom-player {
            padding-left: 0;
            margin-left: 0.1em;
            margin-right: 1em;
          }
          #custom-currentplayer {
            padding-right: 0;
            margin-left: 1em;
          }
          #tray{
            padding: 0px 5px;
            transition: all .3s ease;
            color: ${fg0};
          }
          #tray menu * {
            padding: 0px 5px;
            transition: all .3s ease;
          }
          #tray menu separator {
            padding: 0px 5px;
            transition: all .3s ease;
          }
      '';
  };
}
