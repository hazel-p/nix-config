{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ".." = "cd ..";
      cat = "bat --style=plain --theme=base16 --paging=never ";
      nf = "fastfetch";
      nv = "nvim";
      nrs-local = "sudo nixos-rebuild switch --flake ~/nix-config &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)";
      nrs = "sudo nixos-rebuild switch --flake github:hazel-p/nix-config &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)";
    };
    initContent = "fortune";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.persistence."/home-persist" = {
    files = [
      ".zsh_history"
    ];
  };
}
