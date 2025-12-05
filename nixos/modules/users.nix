{config, pkgs, ...}:

{
  programs.fish.enable = true;

  users.users.london = {
    isNormalUser = true;
    description = "london";
    extraGroups = [ "networkmanager" "wheel" "gamemode" ];
    shell = pkgs.fish;
  };

}
