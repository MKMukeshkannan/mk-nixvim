{ pkgs, ... }:
let
  black-metal = (
    pkgs.vimUtils.buildVimPlugin {
      name = "black-metal";
      src = pkgs.fetchFromGitHub {
        owner = "metalelf0";
        repo = "black-metal-theme-neovim";
        tag = "2.0";
        hash = "sha256-z+qJfvCIV5WEAvKIkttDKpfBDt1xDBkTYLk2EoZbnj8=";
      };
    }
  );
in
{

  extraPlugins = [ black-metal ];

  extraConfigLua = ''
    require("black-metal").setup({
      theme = "khold",
      variant = "light",
      transparent = "true"
    })
    require("black-metal").load()
  '';
}
