{
  inputs,
  lib,
  pkgs,
  ...
}: let
  colour_bg1 = "green";
  colour_bg2 = "red";
  colour_bg3 = "blue";
  colour_text_dark = "black";
  colour_text_light = "white";
in {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "[](fg:${colour_bg1})$username$hostname[](bg:${colour_bg1} fg:${colour_bg2})$directory$custom$symbol($git_branch[](fg:${colour_bg3}))$symbol( $git_commit$git_status$git_metrics$git_state)$fill$cmd_duration$nix_shell$all$character";

      username = {
        show_always = true;
        format = "[$user](bg:${colour_bg1} fg:${colour_text_dark})";
        disabled = false;
      };
      hostname = {
        format = "[@$hostname ](bg:${colour_bg1} fg:${colour_text_dark})";
      };
      directory = {
        format = "[ $path ](bg:${colour_bg2} fg:${colour_text_dark})";
        truncate_to_repo = true;
        truncation_length = 4;
        truncation_symbol = "…/";
      };
      git_branch = {
        symbol = "branch:"; #Use actual symbol later!
        format = "[ $symbol$branch(:$remote_branch) ](bg:${colour_bg3} fg:${colour_text_dark})";
      };

      git_metrics = {
        disabled = false;
      };
      nix_shell = {
          format = "[$symbol$state( ($name))]($style) ";
          disabled = false;
          impure_msg = "[impure](bold red)";
          pure_msg = "[pure](bold green)";
          style = "bold blue";
          symbol = " ";
      };

      #Custom Seperators
      custom.directory_git = {
        description = "Seperator style for when in git repo";
        command = "";
        format = "[](fg:${colour_bg2} bg:${colour_bg3})";
        when = "git rev-parse --is-inside-work-tree >/dev/null 2>&1";
      };
      custom.directory_end = {
        description = "Seperator style for when not in git repo";
        command = "";
        format = "[](fg:${colour_bg2})";
        when = "! git rev-parse --is-inside-work-tree >/dev/null 2>&1";
      };
    };
  };
}
