{ config, pkgs, ...}:

{

 services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
 };

 # programs.hyprland = {
   # enable = true;
   # withUWSM = true;
   # xwayland.enable = true;
 # };

 # xdg.portal = {
     # enable = true;
     # extraPortals = with pkgs; [xdg-desktop-portal-hyprland xdg-desktop-portal-gtk];
 # };

 # xdg.menus.enable = true;
 # xdg.mime.enable = true;

 # security.polkit.enable = true;

 environment.systemPackages = with pkgs; [
    kdePackages.discover
    kdePackages.ksystemlog
    kdePackages.partitionmanager
    # nwg-look
    # kdePackages.qt6ct
    # kdePackages.breeze
    # kdePackages.breeze-gtk
    # kdePackages.breeze-icons
    # dunst
    # hyprpolkitagent
    # libsForQt5.qt5.qtwayland
    # fuzzel
    # kdePackages.dolphin
    # kdePackages.kio
    # kdePackages.kdf
    # kdePackages.kio-fuse
    # kdePackages.kio-extras
    # kdePackages.kio-admin
    # kdePackages.qtwayland
    # kdePackages.plasma-integration
    # kdePackages.kdegraphics-thumbnailers
    # kdePackages.qtsvg
    # shared-mime-info
    # kdePackages.ark
    # waybar
    # hyprpaper
    # kdePackages.kservice
    # kdePackages.plasma-workspace
 # ];

 # environment.sessionVariables.NIXOS_OZONE_WL = "1";

 # qt.style = "breeze";

 # environment.etc."/xdg/menus/applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

}
