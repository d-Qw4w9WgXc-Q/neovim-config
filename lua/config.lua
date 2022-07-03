require'nvim-treesitter.configs'.setup {
        ensure_installed = {"c", "lua", "python", "haskell"},

        sync_install = false,

        ignore_install = {},

        highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
        }
}

require'cmp-config'
