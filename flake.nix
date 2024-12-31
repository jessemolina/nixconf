{
  description = "A NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, nixos-hardware }: 
  let 
    lib = nixpkgs.lib;
    osLib = import ./lib/default.nix { inherit lib; }; 
  in with osLib;
  {
    nixosConfigurations = {
      personal = mkSystem {
        system = "x86_64-linux";
	configuration = ./profiles/personal/configuration.nix;
      };

      dev = mkSystem {
        system = "x86_64-linux";
	configuration = ./profiles/dev/configuration.nix;
        hardware = nixos-hardware.nixosModules.lenovo-thinkpad-x1-extreme-gen2;
      };

    };
  };
}
