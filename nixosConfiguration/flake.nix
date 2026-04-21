{
  description = "Dawnix an opiononated Nixos configuration for artist";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, silentSDDM, noctalia, home-manager }: 
  let
    username = "nixos";
  in
  {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs username;};
      modules = [
        ./configuration.nix
	silentSDDM.nixosModules.default
	home-manager.nixosModules.home-manager
	{
          home-manager.useGlobalPkgs = true;
	 home-manager.useUserPackages = true;
	 home-manager.users."${username}" = ./home.nix;
	 home-manager.extraSpecialArgs = { inherit inputs username; };
	}
        { nixpkgs.hostPlatform = "x86_64-linux"; }
      ];
    };
  };
}
