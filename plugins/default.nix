{ ... }:
{
  imports = [
    ./lsp
    ./cowpile.nix
    ./options.nix
    ./neotree.nix
    ./keymaps.nix
    ./markdown.nix
    ./dashboard.nix
    ./telescope.nix
    ./treesitter.nix
    ./lsp/none-ls.nix
    ./nvim-surrond.nix
    ./tmux-navigator.nix
    ./indent-blankline.nix
    ./align.nix
    ./harpoon.nix
    ./lualine.nix
    ./hologram.nix
    # ./typr.nix
  ];

  extraConfigLua = ''vim.opt.conceallevel = 1'';

}
