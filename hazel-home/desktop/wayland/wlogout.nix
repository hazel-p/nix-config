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
    style = ''
      * {
      	background-image: none;
      	box-shadow: none;
      }

      window {
      	background-color: rgba(30, 30, 30, 0.6);
      }

      button {
        border-radius: 0;
        border-color: black;
      	text-decoration-color: #FFFFFF;
        color: #FFFFFF;
      	background-color: #282828;
      	border-style: solid;
      	border-width: 5px;
      	background-repeat: no-repeat;
      	background-position: center;
      	background-size: 25%;
      }

      button:focus, button:active, button:hover {
      	background-color: #3c3836;
      	outline-style: none;
      }
    '';
  };
}
