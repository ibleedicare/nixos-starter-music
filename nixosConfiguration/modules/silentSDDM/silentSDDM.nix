{ config, pkgs, ... }:
let
  animeGreeter = pkgs.fetchurl {
    name = "anime.mp4";
    url = "https://www.desktophut.com/files/1773918867.mp4";
    sha256 = "1589vxpzg6k55j115330z2zzdnnn37j1nf1plb4c4lwvlnc544js"; 
  };

  animeGreeterMP4H264 = pkgs.stdenv.mkDerivation {
    pname = "anime-h264";
    version = "1.0";
    unpackPhase = ":";
    src = animeGreeter;
    buildInputs = [ pkgs.ffmpeg ];
    installPhase = ''
      mkdir -p $out
      ffmpeg -i $src -c:v libx264 -preset slow -crf 23 -c:a aac $out/anime.mp4
    '';
  };
in
{
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
  };

  programs.silentSDDM = {
    enable = true;
    theme = "default";
    backgrounds = {
      anime = "${animeGreeterMP4H264}/anime.mp4";
    };
    settings = {
      "LoginScreen" = {
        background = "anime.mp4";
      };
      "LockScreen" = {
        background = "anime.mp4";
      };
    };
  };
}
