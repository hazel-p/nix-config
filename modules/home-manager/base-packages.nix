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
        htop
        alejandra
        neofetch
    ];
  };
}
