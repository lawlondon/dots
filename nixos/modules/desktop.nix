{ config, pkgs, ...}:

{

 services = {
    xserver.enable = true;

    xserver.xkb = {
      layout = "us";
      variant = "";
    };
   
   
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
 };

 environment.systemPackages = with pkgs; [
    kdePackages.partitionmanager
    kdePackages.kate
 ];

}
