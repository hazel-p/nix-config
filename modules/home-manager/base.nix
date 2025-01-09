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
      enable = true;i
      userName = "Hazel Pumphrey";
      userEmail = "hazel.pumphrey@proton.me";
      aliases = {
        ci = "commit";
        co = "checkout";
        s = "status";
        ac = "!git add -A && git commit -m ";
      };
    }
    fastfetch.enable = true;
  };
}
