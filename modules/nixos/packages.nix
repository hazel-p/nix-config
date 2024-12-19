{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    neovim 
    wget
    kitty
    htop
    neofetch
    cowsay
  ];
}