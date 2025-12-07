{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # Import used desktop configuration
  imports = [
    # Display Settings
    #./gnome
    ./hyprland
                #./niri

    # Additional packages for desktop & cli
    ./packages.nix
    ./../cli/extra-packages.nix
  ];

  #  home.persistence."/nix/persist/home/hazel" = {
  #directories = [
  #"Desktop"
  #"Documents"
  #"Downloads"
  #"Music"
  #"Pictures"
  #"Videos"
  #".mozilla"
  #];
  #};
}
