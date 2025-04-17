{
  inputs,
  config,
  pkgs,
  ...
}: {
  services.onedrive.enable = true;
  environment.systemPackages = with pkgs; [
    libreoffice-qt
    hunspell
    texstudio
    texlive.combined.scheme-full
    pandoc
  ];
}
