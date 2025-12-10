{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];
  programs.nvf = {
    enable = true;
    defaultEditor = true;

    settings.vim = {
      options = {
        tabstop = 2;
        shiftwidth = 2;
      };
      # Visual Theming
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
        transparent = true;
      };
      statusline.lualine = {
        enable = true;
      };
      telescope.enable = true;

      # Autocomplete using blink.cmp
      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
        #sourcePlugins.repgrep.enable = true;
      };

      clipboard.enable = true;

      lsp.enable = true;
      languages = {
        # Options
        enableTreesitter = true;
        enableFormat = true;
        enableDAP = true;

        # Languages
        nix.enable = true;
        clang.enable = true;
      };
    };
  };
}
