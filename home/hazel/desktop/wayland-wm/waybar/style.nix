{
  outputs,
  config,
  lib,
  pkgs,
  inputs,
  ...
}:{
  programs.waybar = {
    style = let
      tra = "rgba(40,40,40,0.3)"; # transparent bg1
      bg0 = "#1d2021"; # black
      bg1 = "#282828"; # background grey
      bg2 = "#3c3836"; # lighter background
      fg0 = "#ebdbb2"; # light grey
      acc = "#fb4934"; # bright red
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
          padding: 0;
          border-radius: 0.5em;
          background-color: ${tra};
          color: ${bg1};
        }
        .modules-left {
          background-color: ${tra};
          margin-left: 0;
          border-radius: 0.5em;
          border-right: solid 0.4em ${bg1};
        }

        #workspaces button {
          color: ${bg1};
          padding-left: 0.2em;
          padding-right: 0.2em;
          margin-top: 0.15em;
          margin-bottom: 0.15em;
          margin-left: 0.1em;
          margin-right: 0.1em;
        }
        #workspaces button.hidden {
          background-color: ${bg1};
          color: ${fg0};
        }
        #workspaces button.focused,
        #workspaces button.active {
          background-color: ${bg1};
          color: ${acc};
        }

        #custom-menu {
          background-color: ${bg1};
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
          margin-left: 0;
          margin-right: 1em;
        }
        #custom-currentplayer {
          padding-right: 0;
          margin-left: 1em;
        }
        #tray {
          color: ${bg1};
        }
      '';
  };
}
