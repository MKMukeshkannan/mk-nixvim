{ ... }:
{
  extraConfigLua = ''
    vim.keymap.set("i", "<C-l>", "<Right>", {})
    vim.keymap.set("i", "<C-h>", "<Left>", {})
    vim.keymap.set("i", "<C-k>", "<Up>", {})
    vim.keymap.set("i", "<C-j>", "<Down>", {})

    vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
    vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})
  '';
  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require'harpoon':list():add() end";
    }
    {
      mode = "n";
      key = "<leader>aa";
      action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
    }
    {
      mode = "n";
      key = "<leader>j";
      action.__raw = "function() require'harpoon':list():select(1) end";
    }
    {
      mode = "n";
      key = "<leader>k";
      action.__raw = "function() require'harpoon':list():select(1) end";
    }
    {
      mode = "n";
      key = "<C-1>";
      action.__raw = "function() require'harpoon':list():select(1) end";
    }
    {
      mode = "n";
      key = "<C-2>";
      action.__raw = "function() require'harpoon':list():select(2) end";
    }
    {
      mode = "n";
      key = "<C-3>";
      action.__raw = "function() require'harpoon':list():select(3) end";
    }
    {
      mode = "n";
      key = "<C-4>";
      action.__raw = "function() require'harpoon':list():select(4) end";
    }
    {
      action = "<cmd>:!command clang -std=c99 -Wall -Werror -fsanitize=address main.c -o main -g && ./main<CR>";
      key = "<C-S>";
    }
    {
      action = "<cmd>:CowpileAndRun<CR>";
      key = "<leader>c";
    }
    {
      action = "<cmd>:CowpileAndRebuild<CR>";
      key = "<leader>cc";
    }
    {
      action = "<cmd>:CowpileAndRun<CR>";
      key = "<leader>r";
    }
    {
      action = "<cmd>:ObsidianNew<CR>";
      key = "<leader>nn";
    }
    {
      action = ":ObsidianPasteImg<CR>";
      key = "<leader>v";
    }
    {
      action = "<cmd>:Neotree toggle<CR>";
      key = "<leader>fd";
      options = {
        silent = true;
      };
    }
    {
      action = ":wincmd k<CR>";
      key = "<c-k>";
      options = {
        silent = true;
      };
    }
    {
      action = ":wincmd j<CR>";
      key = "<c-j>";
      options = {
        silent = true;
      };
    }
    {
      action = ":wincmd h<CR>";
      key = "<c-h>";
      options = {
        silent = true;
      };
    }
    {
      action = ":wincmd l<CR>";
      key = "<c-l>";
      options = {
        silent = true;
      };
    }
    {
      action = ":lua vim.lsp.buf.format({})<CR>";
      key = "<leader>fj";
      options = {
        silent = true;
      };
    }
    {
      action = ''"+y'';
      key = "<leader>y";
    }
    {
      action = ''"+y'';
      key = "<leader>y";
    }
  ];
}

# vim.keymap.set("x", "<leader>p", '"_dp')
# vim.keymap.set("n", "<leader>y", '"+y')
# vim.keymap.set("v", "<leader>y", '"+y')
# vim.keymap.set("n", "<leader>Y", '"+Y')

#vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
# nmap <silent> <c-k> :wincmd k<CR>
# nmap <silent> <c-j> :wincmd j<CR>
# nmap <silent> <c-h> :wincmd h<CR>
# nmap <silent> <c-l> :wincmd l<CR>
# vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
# vim.api.nvim_set_keymap('i', '<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
# vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
# vim.api.nvim_set_keymap('i', '<CR>', [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]], { expr = true, silent = true })
# vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
# vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
