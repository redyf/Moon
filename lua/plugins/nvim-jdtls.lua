return {
	{
		"mfussenegger/nvim-jdtls",
		config = function()
			local config = {
				cmd = {
					"/run/current-system/sw/bin/jdtls",
				},
				root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

				settings = {
					java = {
						signatureHelp = { enabled = true },
						completion = true,
					},
				},
				init_options = {
					bundles = {
						"/nix/store/b9ib40q36wxjl4xs5lng263lflz1fsi7-vscode-extension-vscjava-vscode-java-debug-0.49.2023032407/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-0.44.0.jar",
						"/nix/store/j3nvmhvj2pmnykw5pbm51dn0bz4cv6j3-vscode-extension-vscjava-vscode-java-test-0.38.2023032402/share/vscode/extensions/vscjava.vscode-java-test/server/com.microsoft.java.test.plugin-0.38.2.jar",
					},
				},
			}
			require("jdtls").start_or_attach(config)
		end,
		-- cmd = {
		-- 	"java", -- or '/path/to/java17_or_newer/bin/java'
		-- 	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		-- 	"-Dosgi.bundles.defaultStartLevel=4",
		-- 	"-Declipse.product=org.eclipse.jdt.ls.core.product",
		-- 	"-Dlog.protocol=true",
		-- 	"-Dlog.level=ALL",
		-- 	"-Xmx1g",
		-- 	"--add-modules=ALL-SYSTEM",
		-- 	"--add-opens",
		-- 	"java.base/java.util=ALL-UNNAMED",
		-- 	"--add-opens",
		-- 	"java.base/java.lang=ALL-UNNAMED",
		--
		-- 	"-jar",
		-- 	"/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar",
		-- 	"-configuration",
		-- 	"/nix/store/20h2hjjm94gbskqhbwikbgxbblv1xpf2-jdt-language-server-1.31.0/bin/jdtls",
		-- 	-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- 	-- eclipse.jdt.ls installation            Depending on your system.
		-- 	"-data",
		-- 	"/path/to/unique/per/project/workspace/folder",
		-- },
		--
		-- Language server `initializationOptions`
		-- You need to extend the `bundles` with paths to jar files
		-- if you want to use additional eclipse.jdt.ls plugins.
		--
		-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
		--
		-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
		-- This bundles definition is the same as in the previous section (java-debug installation)
		-- 	-- This is the new part
		-- 	vim.list_extend(
		-- 		bundles,
		-- 		vim.split(
		-- 			vim.fn.glob(
		-- 				"/nix/store/j3nvmhvj2pmnykw5pbm51dn0bz4cv6j3-vscode-extension-vscjava-vscode-java-test-0.38.2023032402/share/vscode/extensions/vscjava.vscode-java-test/server/com.microsoft.java.test.plugin-0.38.2.jar",
		-- 				1
		-- 			),
		-- 			"\n"
		-- 		)
		-- 	)
		-- config["init_options"] =
		-- 	{
		-- 		bundles = bundles,
		-- 	},
		-- This starts a new client & server,
		-- or attaches to an existing client & server depending on the `root_dir`.
	},
}
