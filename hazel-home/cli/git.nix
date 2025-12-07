{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Hazel Pumphrey";
      user.email = "hazel.pumphrey@proton.me";
      alias = {
        c = "commit";
        co = "checkout";
        s = "status";
        ac = "!git add -A && git commit -m ";
      };
    };
  };
}
