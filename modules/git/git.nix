{pkgs, ...}: {
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
}
