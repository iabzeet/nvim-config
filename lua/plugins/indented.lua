return {
	{
    		"lukas-reineke/indent-blankline.nvim",
    		main = "ibl",
    		opts = {
			indent = {
				char = '┊',
			},
			scope = {
				show_start = false,
				show_end = false,
				show_exact_scope = false,
			},
			exclude = {
				filetypes = {
					'help',
					'startify',
					'dashboard',
					'packer',
					'neogitstatus',
					'NvimTree',
					'Trouble'
				}
			}
		},
	},

	{
    		'windwp/nvim-autopairs',
    		event = "InsertEnter",
    		config = true,
    		opts = {}
	},

	{
  		"folke/todo-comments.nvim",
		event = 'VimEnter',
  		dependencies = { "nvim-lua/plenary.nvim" },
 		opts = { signs = false },
	},

	{
		'norcalli/nvim-colorizer.lua',
		config = function ()
			require('colorizer').setup()
		end,
	},
}
