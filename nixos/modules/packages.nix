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
    vesktop
    qbittorrent
    ungoogled-chromium
    bibata-cursors
    bibata-cursors-translucent
  ];

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "london";
  };

  services.ollama = {
    enable = true;
    acceleration = "rocm";
  };

   # programs.nixvim.enable = true;

}