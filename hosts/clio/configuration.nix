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
    ./../../system/persistence.nix

    ./../../system
    ./../../system/hardware/powersave.nix
    #./../../system/hardware/intelgpu.nix

    # Services
    ./../../system/services/minecraft_server.nix
    ./../../system/services/immich.nix
    #./../../system/services/samba-server.nix
    ./../../system/services/blocky.nix
    ./../../system/services/jellyfin.nix
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
          ./../../hazel-home
        ];
      };
    };
  };

  networking.hostName = "clio";
}
