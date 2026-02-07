{
  pkgs,
  config,
  inputs,
  ...
}: {
  environment.systemPackages = [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ]; 
  home.file."~/.config/hypr/hyprland.conf".text = ''
    env = HYPRCURSOR_THEME,rose-pine-hyprcursor
  '';
}
