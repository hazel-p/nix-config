{
  outputs,
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  programs.ashell = {
    enable = true;
    appearance = {
      background_color = {
        base = "#282828";
        strong = "#1D2021";
        weak = "#3C3836";
        text = "#D4BE98";
      };
      primary_color.base = "#E78A4E";
      secondary_color.base = "#A9B665";
      success_color.base = "#89B482";
      danger_color.base = "#EA6962";
      danger_color.weak = "#D8A657";
      text_color.base = "#000000";
    };
  };
}
