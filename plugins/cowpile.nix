{ pkgs, ... }:
{
    extraPlugins = [(pkgs.vimUtils.buildVimPlugin { name = "cowpile"; src = ../ennoda_plugins/cowpile.nvim; })];
    extraConfigLua = ''
        require('cowpile').setup()
    '';
}
