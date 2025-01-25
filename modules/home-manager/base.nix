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
      aliases = {
        c = "commit";
        co = "checkout";
        s = "status";
        ac = "!git add -A && git commit -m ";
      };
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
        rebuild = "git pull && sudo nixos-rebuild switch --flake ~/nix-config";
        rebuild-git = "sudo nixos-rebuild switch --flake github:hzl4/nix-config"; 
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
      languages.language = [
        {
          name = "nix";
          auto-format = true;
        }
      ];
    };
  };
}
