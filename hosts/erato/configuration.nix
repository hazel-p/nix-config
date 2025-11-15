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

    ./../../nixos/base.nix
    ./../../nixos/desktop.nix
    ./../../nixos/powersave.nix
    ./../../nixos/amdgpu.nix

    ./../../services/samba-client.nix
    ./../../services/tailscale.nix
  ];

  nixpkgs.config.permittedInsecurePackages = ["broadcom-sta-6.30.223.271-59-6.12.57"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
    users.hazel.imports = [
      ./../../home/hazel/base.nix
      ./../../home/hazel/desktop.nix
    ];
  };

  networking.hostName = "erato";
}
