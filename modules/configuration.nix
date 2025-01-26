{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
    efi.efiSysMountPoint = "/boot";
    efi.canTouchEfiVariables = true;
  };
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  fonts.packages = with pkgs; [nerd-fonts.fira-code];

  time.timeZone = "Africa/Dar_es_Salaam";
  time.hardwareClockInLocalTime = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.pipewire = {
    enable = true;

    pulse.enable = true;

    alsa = {
      enable = true;

      support32Bit = true;
    };
  };

  services.libinput.enable = true;
  environment.variables = {
    DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/docker.sock";
  };

  users.users.ns = {
    createHome = true;
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "video" "docker"];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMbEwFo57Gt61dPRsLRgn4rTPlrKz2eZsGueLHnO6F0z ndosho1@gmail.com"
    ];
    packages = with pkgs; [
      curl
      brave
      alejandra
      git
      kitty
    ];
  };

  environment.sessionVariables = {FLAKE = "/home/ns/.config/homemanager/";};

  programs.hyprland.enable = true;
  #programs.waybar.enable = true;
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
    wl-clipboard
    pavucontrol
    playerctl
  ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      package = pkgs.docker;
    };
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  system.stateVersion = "24.11";
}
