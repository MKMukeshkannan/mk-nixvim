{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins."hologram-nvim" ];
  extraConfigLua = ''
    require('hologram').setup{
      auto_display = true -- WIP automatic markdown image display, may be prone to breaking
    }
  '';
}
