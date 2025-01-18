{pkgs, ...}: {
  imports = [./modules/default.nix];

  home.username = "ns";
  home.homeDirectory = "/home/ns";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    yazi
    ffmpeg
    p7zip
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    imagemagick
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

  programs.git = {
    enable = true;
    userName = "ndosho";
    userEmail = "ndosho1@gmail.com";
    aliases = {
      co = "commit";
      ch = "checkout";
      st = "status";
    };
    extraConfig = {
      push = {autoSetupRemote = true;};
    };
  };

  programs.home-manager.enable = true;
  programs.fish = {
    enable = true;
    shellAliases = {
      y = "yazi";
    };
    loginShellInit = ''
      set -Ux fish_greeting
    '';
  };
}
