return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main", 
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                auto_install = true, 
                highlight = {
                    enable = true,
                },
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "*" },
                callback = function(args)
                    local bufnr = args.buf
                    local ft = vim.bo[bufnr].filetype
                    
                    local lang = vim.treesitter.language.get_lang(ft) or ft

                    if pcall(vim.treesitter.start, bufnr, lang) then
                        vim.wo.foldmethod = "expr"
                        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    end
                end,
            })
        end,
    },
}
