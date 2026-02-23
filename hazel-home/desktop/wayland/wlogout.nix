{
  outputs,
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # Rofi Configuration
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "suspend";
        action = "systemctl pause && systemctl suspend && hyprlock";
        text = "suspend";
        keybind = "u";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "hibernate";
        keybind = "h";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "shut down";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "reboot";
        keybind = "r";
      }
    ];
    style = ''
      * {
        background-image: none;
        box-shadow: none;
      }

      window {
        background-color: rgba(30, 30, 30, 0.2);
      }

      button {
        margin: 8px;
        border-width: 2px;
        border-radius: 50;
        border-color: rgba(255, 255, 255, 0.5);
        color: #FF0000;
        background-color: rgba(255, 255, 255, 0.7);
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        transition: all 100ms ease-in;
        box-shadow: 0px 0px 0px black;
        opacity: 1;
      }

      button:focus,
      button:active,
      button:hover {
        /* 20% Overlay 2, 80% mantle
        background-color: rgb(48, 50, 66);
        outline-style: none; */
        background-color: #ffffff; /*#b9b1e2;*/
        outline-style: none;
        border-color: rgba(0, 0, 0, 0.2);
      }
    '';
  };
}
