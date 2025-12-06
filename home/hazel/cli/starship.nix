{
  inputs,
  lib,
  pkgs,
  ...
}: let
  colour_bg1 = "cyan";
  colour_bg2 = "green";
  colour_bg3 = "yellow";
  colour_text_dark = "black";
in {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "[](fg:${colour_bg1})$username$hostname[](fg:${colour_bg1} bg:${colour_bg2})$directory$custom$symbol($git_branch[](fg:${colour_bg3}))$symbol( $git_commit$git_status$git_metrics$git_state)$fill$cmd_duration$nix_shell$all$character";

      # Inside coloured boxes
      username = {
        show_always = true;
        format = "[$user](bold bg:${colour_bg1} fg:${colour_text_dark})";
        disabled = false;
      };
      hostname = {
        ssh_only = false;
        format = "[@$hostname ](bold bg:${colour_bg1} fg:${colour_text_dark})";
      };
      directory = {
        format = "[ $path ](bold bg:${colour_bg2} fg:${colour_text_dark})";
        truncate_to_repo = true;
        truncation_length = 4;
        truncation_symbol = "…/";
      };
      git_branch = {
        symbol = "branch:"; #Use actual symbol later!
        format = "[ $symbol$branch(:$remote_branch) ](bold bg:${colour_bg3} fg:${colour_text_dark})";
      };

      # Post-box git metrics
      git_metrics = {
        disabled = false;
      };

      #Custom seperators for when in git vs not in git
      custom.directory_git = {
        format = "[](fg:${colour_bg2} bg:${colour_bg3})";
        when = "git rev-parse --is-inside-work-tree >/dev/null 2>&1";
      };
      custom.directory_end = {
        format = "[](fg:${colour_bg2})";
        when = "! git rev-parse --is-inside-work-tree >/dev/null 2>&1";
      };
    };
  };
}
