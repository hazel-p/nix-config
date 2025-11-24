{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "[](fg:blue)$os[](bg:blue fg:red)$username[](bg:red fg:green)$directory[ ](fg:green)$git_branch$git_status$all$character";
      username = {
        show_always = true;
        format = "[$user ](bg:red fg:black)";
        disabled = false;
      };
      directory = {
        format = "[$path](bg:green fg:black)";
        truncation_length = 2;
      };
    };
  };
}
