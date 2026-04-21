{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
  outputs = { self, nixpkgs }: {
    templates = {
      default = {
        path = ./nixosConfiguration;
        description = "A very basic nixos configuration with niri and noctalia";
      };
      nixosConfiguration = {
        path = ./nixosConfiguration;
        description = "A very basic nixos configuration with niri and noctalia";
      };
    };
  };
}
