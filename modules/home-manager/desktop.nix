{pkgs, ...}: {
  programs.firefox.enable = true;
  home.packages = with pkgs;
    [
      spotify
      discord
      stremio
      prismlauncher
      remmina
      freerdp
    ];
}

