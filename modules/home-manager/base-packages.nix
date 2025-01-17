{
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs;
      [
        btop
        fortune
        kitty
        foot
        htop
        alejandra
        fastfetch
        bat
        memtester
    ];
  };
}
