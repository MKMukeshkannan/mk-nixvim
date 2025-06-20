{ pkgs, ... }:
{
  extraPlugins = [
    pkgs.vimPlugins."nvim-dap"
  ];

    plugins.dap-ui = {
      enable = true;
      settings = {
        icons = {
          expanded = "▾";
          collapsed = "▸";
          current_frame = "*";
        };

        controls = {
          icons = {
            pause = "⏸";
            play = "▶";
            step_into = "⏎";
            step_over = "⏭";
            step_out = "⏮";
            step_back = "b";
            run_last = "▶▶";
            terminate = "⏹";
            disconnect = "⏏";
          };
        };
      };
    };


  extraConfigLua = ''
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end


    dap.adapters.codelldb = {
      type = 'server',
      port = "$\{port\}",
      executable = {
        command = "/Users/mukeshkannan/mk-nixvim/plugins/lsp/dap/codelldb/extension/adapter/codelldb", 
        args = {"--port", "$\{port\}"},
      }
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        host = "arm64",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
        cwd = '\$\{workspaceFolder\}',
        stopOnEntry = false,
      },
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

    vim.keymap.set('n', '<Leader>dt', function() dap.toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>db', function() dap.set_breakpoint() end)
    vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)

    vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
    vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
    vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
    vim.fn.sign_define('DapBreakpoint', { text='B', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
    vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
    vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })
  '';
 # plugins.dap-lldb.enable = true;
 # plugins.dap-lldb.settings.codelldb_path = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
}
