{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./packages.nix
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

    # Z Shell
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ".." = "cd ..";
        cat = "bat --style=plain --theme=base16 --paging=never ";
        nf = "fastfetch";
        nv = "nvim";
        nrs-local = "sudo nixos-rebuild switch --flake ~/nix-config";
        nrs = "sudo nixos-rebuild switch --flake github:hazel-p/nix-config";
      };
      initContent = "fortune";
    };

    # Kitty - Terminal Emulator
    kitty = {
      enable = true;
      settings = {
        confirm_os_window_close = 0;
        dynamic_background_opacity = true;
        enable_audio_bell = false;
        mouse_hide_wait = "-1.0";
        window_padding_width = 10;
        background_opacity = "0.9";
        background_blur = 10;
        hide_window_decorations = true;
      };
    };

    # Fuzzy Finder
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    # Helix Text Editor
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

    # NeoVim Text Editor
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

        lsp.enable = true;
        languages = {
          enableTreesitter = true;
          nix.enable = true;
          clang.enable = true;
        };
      };
    };

    # btop Resource Monitor
    btop = {
      enable = true;
      package = pkgs.btop-rocm; #Built with ROCM for AMD GPU compatibility
      #settings.color_theme = "gruvbox_dark";
      #settings.theme_background = false;
    };
  };
}
