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
      aliases = {
        ci = "commit";
        co = "checkout";
        s = "status";
        ac = "!git add -A && git commit -m ";
      };
    };

    nvf = {
      enable = true
      vim.theme = {
        enable = true;
	name = "gruvbox"
	style = "dark"
      };
    };
  };
}
