return {
	{
		"nvim-java/nvim-java",
		event = "VeryLazy",
		config = function()
			require("java").setup({
				jdtls = {
					version = "v1.43.0",
				},
				jdk = {
					auto_install = false,
					version = "17.0.2",
				},
				java_debug_adapter = {
					enable = true,
					version = "0.58.1",
				},
				notifications = {
					-- enable 'Configuring DAP' & 'DAP configured' messages on start up
					dap = true,
				},
			})
			require("lspconfig").jdtls.setup({})
		end,
	},
}
