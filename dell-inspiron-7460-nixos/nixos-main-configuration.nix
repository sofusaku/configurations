{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 0;
  };

  networking = {
    hostName = "mfr-dell-nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Jakarta";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "id_ID.UTF-8";
      LC_IDENTIFICATION = "id_ID.UTF-8";
      LC_MEASUREMENT = "id_ID.UTF-8";
      LC_MONETARY = "id_ID.UTF-8";
      LC_NAME = "id_ID.UTF-8";
      LC_NUMERIC = "id_ID.UTF-8";
      LC_PAPER = "id_ID.UTF-8";
      LC_TELEPHONE = "id_ID.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      layout = "us";
      xkbVariant = "";
    };
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
  };

  sound.enable = true;

  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;

  users.users.comfyte = {
    isNormalUser = true;
    description = "Farrel R";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      google-chrome
      spotify
      vscode
      neofetch
      transmission
      yt-dlp
      obs-studio
      zoom-us
      vlc
    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment = {
    systemPackages = with pkgs; [
      vim
      wget
      git
      cinnamon.nemo
    ];
    gnome.excludePackages = with pkgs.gnome; [ nautilus ];
  };

  system.stateVersion = "23.11";

  # FARREL'S ADDITIONS BELOW

  # Enable Waydroid support.
  virtualisation.waydroid.enable = true;
}
