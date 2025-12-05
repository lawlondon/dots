{ config, pgks, ...}:

{
  fileSystems."big-naturals" = {
    device = "/dev/disk/by-uuid/c22f14e6-d61f-455a-9959-f49473a108f4";
    mountPoint = "/home/london/drives/big-naturals";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  fileSystems."sata" = {
    device = "/dev/disk/by-uuid/4eefd4f3-2307-411e-a6c9-8b5abd789831";
    mountPoint = "/home/london/drives/sata";
    fsType = "ext4";
    options = [ "nofail" ];
  };

fileSystems."jellyfin" = {
    device = "/dev/disk/by-uuid/79055a6e-a6a2-4725-b476-6e0c091c2e79";
    mountPoint = "/home/london/drives/jellyfin";
    fsType = "ext4";
    options = [ "nofail" ];
  };
 
}
