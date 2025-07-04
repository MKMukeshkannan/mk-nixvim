{
  plugins.lsp = {
    enable = true;
    capabilities = "offsetEncoding = 'utf-16'";
    servers = {
      clangd.enable = true;
      ts_ls.enable = true;
      tailwindcss.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      cmake.enable = true;
      nixd.enable = true;
      nil_ls.enable = true;
      pyright.enable = true;
    };
    # snippet = {
    #   expand = "function(args) require('luasnip').lsp_expand(args.body) end";
    # };
    keymaps = {
      silent = true;
      lspBuf = {
        gd = {
          action = "definition";
          desc = "Goto Definition";
        };
        gr = {
          action = "references";
          desc = "Goto References";
        };
        gD = {
          action = "declaration";
          desc = "Goto Declaration";
        };
        gI = {
          action = "implementation";
          desc = "Goto Implementation";
        };
        gT = {
          action = "type_definition";
          desc = "Type Definition";
        };
        K = {
          action = "hover";
          desc = "Hover";
        };
        "<leader>cw" = {
          action = "workspace_symbol";
          desc = "Workspace Symbol";
        };
        "<leader>cr" = {
          action = "rename";
          desc = "Rename";
        };
        "<leader>ca" = {
          action = "code_action";
          desc = "Code Action";
        };
        "<C-k>" = {
          action = "signature_help";
          desc = "Signature Help";
        };
      };
      diagnostic = {
        "<leader>cd" = {
          action = "open_float";
          desc = "Line Diagnostics";
        };
        "[d" = {
          action = "goto_next";
          desc = "Next Diagnostic";
        };
        "]d" = {
          action = "goto_prev";
          desc = "Previous Diagnostic";
        };
      };
    };
    onAttach = ''
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(false)
          end
          vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        end,
      })
    '';
  };
  plugins.clangd-extensions.enable = true;
  plugins.cmp-nvim-lsp.enable = true;
}
