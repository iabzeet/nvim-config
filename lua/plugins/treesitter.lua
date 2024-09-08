-- Treesitter for improved syntax highlighting
  return {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require'nvim-treesitter.configs'.setup {
                auto_isntall = true,  -- Install Java and JavaScript parsers
                highlight = {
                    enable = true, -- Enable syntax highlighting
                },
                indent = { enable = true },
                -- Additional Treesitter configurations can be added here
            }
        end
    }
