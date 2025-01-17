{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.systemd-boot.windows."10".efiDeviceHandle = "HD0,gpt2";

  networking.hostName = "nixos";
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  fonts.packages = with pkgs; [nerd-fonts.fira-code];

  time.timeZone = "Africa/Dar_es_Salaam";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.pulseaudio.enable = false;

  services.libinput.enable = true;

  users.users.ns = {
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "video"];
    shell = pkgs.fish;
    packages = with pkgs; [
      curl
      brave
      alejandra
      git
      kitty
    ];
  };

  environment.sessionVariables = {FLAKE = "/home/ns/.config/home-manager/";};

  programs.waybar.enable = true;
  programs.hyprland.enable = true;
  programs.nh.enable = true;
  programs.fish.enable = true;
  security.doas = {
    enable = true;
    wheelNeedsPassword = false;
    extraRules = [
      {
        groups = ["wheel"];
        persist = true;
        keepEnv = true;
      }
    ];
  };

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    nvd
    nix-output-monitor
  ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  system.stateVersion = "24.11";
}
