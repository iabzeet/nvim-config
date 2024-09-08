return {
    -- Mason setup to manage LSP servers
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    -- Mason LSP config to ensure LSP servers are installed
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "jdtls", "quick_lint_js" } -- Ensure desired LSP servers are installed
            })
        end
    },

    -- Setup Neovim's LSP for each language
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Set up capabilities for LSP (for completion)
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            -- Lua language server setup
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })

            -- Set up common LSP keybindings
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })

            -- Java language server setup (using jdtls)
            lspconfig.jdtls.setup({
                cmd = { "jdtls" }, -- Ensure you have `jdtls` installed
                root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
                capabilities = capabilities
            })

            -- JavaScript LSP setup (using quick_lint_js)
            lspconfig.quick_lint_js.setup({
                capabilities = capabilities
            })
        end
    }
}

