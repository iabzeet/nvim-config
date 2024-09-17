return {
    -- Completion source for LSP and cmdline
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/cmp-cmdline",
    },

    -- Snippet engine and related plugins
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
            "rafamadriz/friendly-snippets", -- Predefined snippets
        },
    },

    -- Main nvim-cmp completion plugin
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(), -- Add borders to completion window
                    documentation = cmp.config.window.bordered(), -- Add borders to documentation window
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
                    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll documentation down
                    ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
                    ["<C-e>"] = cmp.mapping.abort(), -- Abort completion
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' }, -- Enable LSP completions
                    { name = 'luasnip' }, -- Enable LuaSnip completions
                }, {
                    { name = "buffer" }, -- Enable buffer completions
                }),
            })

            -- Command line completion
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }, -- Enable path completions
                }, {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = {'Man', '!'}, -- Ignore certain commands
                        },
                    },
                }),
            })
        end,
    },
}

