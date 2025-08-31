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
    ./../../modules/nixos/desktop.nix
    ./../../modules/nixos/gnome.nix

    ./../../services/tailscale.nix
  ];

  nixpkgs.config.permittedInsecurePackages = ["broadcom-sta-6.30.223.271-57-6.12.44"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # AMD GPU settings
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.graphics.enable = true;
  environment.systemPackages = with pkgs; [lact];
  systemd.packages = with pkgs; [lact];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  boot.kernelParams = ["amdgpu.ppfeaturemask=0xffffffff"];

  powerManagement.enable = true;
  services.thermald.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
    users.hazel.imports = [
      ./../../modules/home-manager/base.nix
      ./../../modules/home-manager/desktop.nix
    ];
  };

  networking.hostName = "home-elitebook";
}
