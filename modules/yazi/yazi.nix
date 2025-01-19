{pkgs, ...}: {
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
  ];
}
