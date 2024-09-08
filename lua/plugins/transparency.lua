return {
    -- Transparency configuration
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({
                groups = {
                    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                    'EndOfBuffer',
                },
                extra_groups = { "NormalFloat", "NvimTreeNormal" }, -- add other groups as needed
                exclude_groups = {}, -- groups you don't want to clear
                on_clear = function() end, -- code to be executed after highlight groups are cleared
            })
        end,
    }
}
