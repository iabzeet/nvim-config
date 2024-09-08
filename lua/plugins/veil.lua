return {
    {
        "willothy/veil.nvim",
        config = function()
            require("veil").setup({
                -- You can customize options here if needed
                -- Here are some example configurations
                header = {
                    "Welcome to Neovim!", -- Example static text header
                },
                buttons = {
                    { "New File", "<cmd>enew<CR>" }, -- Example button to create a new file
                    { "Open File", "<cmd>Telescope find_files<CR>" }, -- Example button to open files with Telescope
                },
                -- Add any other options you'd like to customize
            })
        end,
    },
    -- other plugins...
}

