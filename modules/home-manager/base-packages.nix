{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      fortune
      fastfetch
      bat
      sops
      alejandra
      krita
      zathura
      amberol
      audacity
      dwarf-fortress
    ];
  };
}
