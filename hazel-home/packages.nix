{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # Command line tools
      fortune
      fastfetch
      bat
      tree

      # Nix-specific tools
      sops
      alejandra
    ];
  };
}
