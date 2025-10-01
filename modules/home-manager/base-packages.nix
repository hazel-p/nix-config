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
      dwarf-fortress
    ];
  };
}
