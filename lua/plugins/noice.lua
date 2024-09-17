-- lazy.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function()
    require("noice").setup({
      messages = {
        enabled = false, -- disables the Noice messages UI
      },
      lsp = {
        progress = {
          enabled = false, -- disable LSP progress messages
        },
        message = {
          enabled = false, -- disable messages shown by LSP servers
        },
      },
      notify = {
        enabled = false, -- disable notifications
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}

