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
    # Git
    git = {
      enable = true;
      userName = "Hazel Pumphrey";
      userEmail = "hazel.pumphrey@proton.me";
    };
    
    # Shell
    zsh = { # Z Shell
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
    fzf = { # Fuzzy Finder
      enable = true;
      enableZshIntegration = true;
    };
    tealdeer = { # Improved TLDR
      enable = true;
      settings.updates.auto_update = true;
    };

    # Editors
    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "gruvbox";
      };
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
