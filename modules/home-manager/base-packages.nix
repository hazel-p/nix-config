{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      btop
      fortune
      fastfetch
      bat
      sops
      alejandra
      dwarf-fortress
    ];
  };
}
