{ pkgs, ... }:
let
  makurai = (
    pkgs.vimUtils.buildVimPlugin {
      name = "makurai";
      src = pkgs.fetchFromGitHub {
        owner = "Skardyy";
        repo = "makurai-nvim";
        rev = "a273b061d7300c3e10d6202dd65c6152136f9ae0";
        hash = "sha256-JNpMx2nUHtUlKnHaV20L+wsnr62ZHo6LzpIKdSASMJg=";
      };
    }
  );
in
{

  extraPlugins = [ makurai ];

  extraConfigLua = ''

    require "makurai".setup({
        transparent = true
    })

    vim.cmd.colorscheme("makurai_healer")
    vim.api.nvim_set_hl(0, "Cursor", {fg = "#f0f0f0", bg = "#ff00ff"})
  '';
}
