-- Neo-tree configuration
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup {
            position = "left", -- Set the default position to left
            enable_git_status = true,
            enable_diagnostics = true,
            default_component_configs = {
                icon = {
                    folder_closed = "󰉖", -- Example icons
                    folder_open = "󰉗",
                    default = "󰈚",
                },
            },
            -- Additional Neo-tree configuration options here
        }

        -- Set keymap for Ctrl+n to toggle Neo-tree
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
    end,
}

