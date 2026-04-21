{ ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
hide_window_decorations yes
foreground	#E5E5E5
background	#0A0A0D

background_opacity 0.75
'';
  };
}
