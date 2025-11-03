{
  inputs,
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix

    ./../../modules/nixos/base.nix

    # Services
    ./../../services/minecraft_server.nix
    ./../../services/immich.nix
    ./../../services/tailscale.nix
    #./../../services/seafile.nix
    #./../../services/nextcloud.nix
    ./../../services/samba-server.nix
    ./../../services/blocky.nix
    ./../../services/jellyfin.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      hazel = {
        imports = [
          ./../../modules/home-manager/base.nix
        ];
      };
    };
  };

  networking.hostName = "home-server-1";
}
