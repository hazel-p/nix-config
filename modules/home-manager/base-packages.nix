{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      btop
      fortune
      fastfetch
      bat
      sops
      alexandra
      dwarf-fortress
    ];
  };
}
