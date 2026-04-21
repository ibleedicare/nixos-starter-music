{ inputs, config, pkgs, username, ... }:
{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";

  imports = [
    inputs.noctalia.homeModules.default
    ./modules/noctalia/noctalia.nix
    ./modules/kitty/kitty.nix
  ];

  programs.home-manager.enable = true;
}
