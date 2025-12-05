{ config, pkgs, ... }:
{
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraPackages = with pkgs; [ gamescope ];
    gamescopeSession.enable = true;
    protontricks.enable = true;
  };

  environment.systemPackages = with pkgs; [
    lact
    mangohud
    goverlay
    lutris-unwrapped
    heroic-unwrapped
    protonup-qt
    wineWowPackages.staging
    winetricks
    mono
    geckodriver
  ];

  systemd.packages = with pkgs; [
    lact
  ];

  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}
