{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Hazel Pumphrey";
    userEmail = "hazel.pumphrey@proton.me";
    aliases = {
      c = "commit";
      co = "checkout";
      s = "status";
      ac = "!git add -A && git commit -m ";
    };
  };
}
