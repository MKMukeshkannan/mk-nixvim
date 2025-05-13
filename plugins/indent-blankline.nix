{
  plugins.indent-blankline.enable = false;
  plugins.indent-blankline.settings = {
    exclude = {
      buftypes = [
        "terminal"
        "quickfix"
      ];
      filetypes = [
        ""
        "checkhealth"
        "help"
        "lspinfo"
        "TelescopePrompt"
        "TelescopeResults"
        "yaml"
      ];
    };
  };
}
