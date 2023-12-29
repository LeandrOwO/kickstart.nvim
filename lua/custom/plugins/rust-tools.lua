return {
  'simrat39/rust-tools.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
  },
  opts = {
    server = {
      on_attach = function(_, bufnr)

        local rt = require("rust-tools")
        -- Hover actions
        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
      ['rust-analyzer'] = {
        diagnostics = { enable = true },
        inlayHints = {
          typeHints = { enable = true },
          --expressionAdjustmentHints = { enable = "always" },
          renderColons = { enable = true },
          lifetimeElisionHints = {
            enable = "always",
            useParameterNames = true,
            mode = "prefer_postfix"
          },
          check = {
            command = "clippy"
          },
          checkOnSave = {
            enable = true,
            command = "clippy",
          }
        },
      },
      cmd = { 'rust-analyzer' },
      filetypes = { 'rust' },
    },
  }
}
