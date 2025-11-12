{config, pkgs, ...}:

{

  nixpkgs.config.allowUnfree = true;

  programs.git.enable = true;
  programs.nixvim.enable = true;
  services.flatpak.enable = true;
  programs.firefox.enable = true;
  programs.fish.enable = true;
  services.fwupd.enable = true;

  environment.systemPackages = with pkgs; [
    btop-rocm
  ];

  users.users.london = {
    isNormalUser = true;
    description = "london";
    extraGroups = [ "networkmanager" "wheel" "gamemode" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      gh
      zip
      unzip
      python3
      nil
      nixd
      alacritty
      kitty
      blender-hip
      jellyfin-web
      jellyfin-ffmpeg
      hyfetch
      fastfetch
      ripgrep
      apple-cursor
      resources
    ];
  };

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "london";
  };
}
