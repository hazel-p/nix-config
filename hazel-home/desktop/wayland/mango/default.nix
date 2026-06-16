{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./mango.nix
  ];

  home.packages = with pkgs; [
  ];
}
