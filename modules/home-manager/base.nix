{
  lib,
  pkgs,
  ...
}: {
  home = {
    username = "hazel";
    homeDirectory = "/home/hazel";
    stateVersion = "24.11";
  };

  programs = {
    git = {
      enable = true;
      userName = "Hazel Pumphrey";
      userEmail = "hazel.pumphrey@proton.me";
    };
  };
}
