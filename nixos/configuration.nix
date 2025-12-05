{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/desktop.nix
    ./modules/users.nix
    ./modules.packages.nix
    ./modules/gaming.nix
    ./modules/drives.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Swap on zram
  zramSwap.enable = true;

  # NTFS support
  boot.supportedFilesystems = [ "ntfs" ];

  # Graphics drivers
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ rocmPackages.clr.icd ];
  };

  hardware.amdgpu.opencl.enable = true;
  hardware.amdgpu.overdrive.enable = true;

  services.xserver.videoDrivers = [ "amdgpu" ];

  # CPU
  services.thermald.enable = true;

  # Networking
  networking.hostName = "london";
  networking.networkmanager.enable = true;

  # Time and locales
  time.timeZone = "Australia/Perth";
  i18n.defaultLocale = "en_AU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Printing
  services.printing.enable = true;

  # fonts
  fonts.fontconfig.antialias = true;
  fonts.fontconfig.subpixel.rgba = "rgb";

  fonts.packages = with pkgs; [
    nerd-fonts.adwaita-mono
    nerd-fonts.code-new-roman
    nerd-fonts.cousine
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    nerd-fonts.sauce-code-pro
    nerd-fonts.roboto-mono
    nerd-fonts.terminess-ttf
    nerd-fonts.ubuntu
    nerd-fonts.zed-mono
    corefonts
    vista-fonts
    liberation_ttf
    noto-fonts
    texlivePackages.collection-fontsrecommended
    winePackages.fonts
    texlivePackages.collection-fontsextra
    open-sans
  ];

  system.stateVersion = "25.11"; # Don't touch this line

}
