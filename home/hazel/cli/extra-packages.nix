{pkgs, ...}: {
  # Non-essential or bulky packages
  # Intended to be imported with ./desktop, but can run headless
  home = {
    packages = with pkgs; [
      # LaTeX Tools
      hunspell
      texlive.combined.scheme-full
      pandoc

      # Games
      dwarf-fortress

      # Utility
      ttyper
    ];
  };
}
