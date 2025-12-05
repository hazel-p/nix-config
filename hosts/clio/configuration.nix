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
    ./../../nixos/persistence.nix

    ./../../nixos/base.nix
    ./../../nixos/powersave.nix
    #./../../nixos/intelgpu.nix

    # Services
    ./../../services/minecraft_server.nix
    ./../../services/immich.nix
    #./../../services/samba-server.nix
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
          ./../../home/hazel
        ];
      };
    };
  };

  networking.hostName = "clio";
}
