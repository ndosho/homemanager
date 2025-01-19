{pkgs, ...}: {
  home.file.".config/fish/functions/fish_prompt.fish".source = ./fish_prompt.fish;
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
