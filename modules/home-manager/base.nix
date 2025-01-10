{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./base-packages.nix
  ];

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
    
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ".." = "cd ..";
        cat = "bat --style=plain --theme=base16 --paging=never ";
        neofetch = "fastfetch";
        v = "nvim ";
      };
      initExtra = "fortune";
    };

    nvf = {
      enable = true;
      settings.vim = {
        
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        
        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
        };

      };
    };
  };
}
