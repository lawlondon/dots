{config, pkgs, ...}:

{

  nixpkgs.config.allowUnfree = true;

  programs.git.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vscodium-fhs
    nixd
    nil
    nixfmt
    gh
    btop-rocm
    kitty
    jellyfin-web
    jellyfin-ffmpeg
    hyfetch
    fastfetch
    resources
    python3
    discord
    qbittorrent
    ungoogled-chromium
  ];

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "london";
  };

   programs.nixvim.enable = true;

}