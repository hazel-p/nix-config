{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      fortune
      fastfetch
      bat
      sops
      alejandra
      dwarf-fortress
    ];
  };
}
