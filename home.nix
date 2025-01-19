{pkgs, ...}: {
  imports = [./modules/default.nix];

  home.username = "ns";
  home.homeDirectory = "/home/ns";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    localsend
    sddm
    wofi
    dolphin
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
