{
  description = "London System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    # nixvim = {
    #  url = "github:nix-community/nixvim";
     # inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs =
    {
      self,
      nixpkgs,
      chaotic,
      #nixvim,
      ...
    }:
    {
      nixosConfigurations = {
        london = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            chaotic.nixosModules.default
	     #     nixvim.nixosModules.nixvim
          ];
        };
      };
    };
}
