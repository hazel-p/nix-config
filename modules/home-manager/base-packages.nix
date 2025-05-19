{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      btop
      fortune
      htop
      alejandra
      fastfetch
      bat
      memtester
      sops
      obsidian
    ];
  };
}
