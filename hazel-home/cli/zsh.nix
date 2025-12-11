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
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo"];
    };
    shellAliases = {
      ".." = "cd ..";
      cat = "bat --style=plain --theme=base16 --paging=never ";
      ff = "fastfetch";
      nrs-local = "sudo nixos-rebuild switch --flake ~/nix-config";
      nrs = "sudo nixos-rebuild switch --flake github:hazel-p/nix-config";
    };
    initContent = "fortune-kind";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
