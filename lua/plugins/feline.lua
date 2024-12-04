return {
	{
		"feline-nvim/feline.nvim",
		event = "VeryLazy",
		enabled = false,
		config = function()
			local ctp_feline = require("catppuccin.groups.integrations.feline")

			ctp_feline.setup()

			require("feline").setup({
				components = ctp_feline.get(),
				disable = {
					filetypes = {
						"^help$",
						"^alpha$",
						"^NvimTree$",
						"^Trouble$",
					},
				},
			})
		end,
	},
}
