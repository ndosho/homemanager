{
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };
    options = {
      tabstop = 2;
      shiftwidth = 2;
      swapfile = false;
      backup = false;
      termguicolors = true;
      foldmethod = "marker";
      foldmarker = "{,}";
    };
    languages = {
      nix.enable = true;
      bash.enable = true;
      python.enable = true;
      rust.enable = true;
      enableTreesitter = true;
      enableLSP = true;
      enableFormat = true;
    };
    lsp = {
      enable = true;
      formatOnSave = true;
      mappings.codeAction = "<leader>ca";
    };

    dashboard.alpha.enable = true;
    filetree.neo-tree.enable = true;

    debugger.nvim-dap = {
      enable = true;
      ui.enable = true;
      mappings = {
        toggleBreakpoint = "<F8>";
        continue = "<F9>";
        stepInto = "<F10>";
        stepOut = "<F11>";
      };
    };

    autopairs.nvim-autopairs.enable = true;

    keymaps = [
      {
        key = "jk";
        mode = ["n" "v" "i"];
        silent = true;
        action = "<Esc>";
      }

      {
        key = "<F12>";
        mode = ["n" "v"];
        silent = true;
        action = ":w<CR>";
      }
    ];
    useSystemClipboard = true;
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
  };
}
