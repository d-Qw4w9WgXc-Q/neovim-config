-- need to install tree-sitter-cli for this
local languages = {'c', 'cpp', 'python', 'javascript'};
require'nvim-treesitter'.install(languages);

vim.api.nvim_create_autocmd('FileType', {
        pattern = languages,
        callback = function()
                vim.treesitter.start()
        end,
})

require('bufferline').setup{
        options = {
                separator_style = 'slope'
        }
}

require'nvim-treesitter-textobjects'.setup()

vim.keymap.set({ "x", "o" }, "af", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "as", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "textobjects")
end)


local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
        snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                        
                        -- For `mini.snippets` users:
                        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                        -- insert({ body = args.body }) -- Insert at cursor
                        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                        -- require("cmp.config").set_onetime({ sources = {} })
                end,
        },
        window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                -- other mappings
                ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_next_item()
                        else
                                fallback()
                        end
                end, { "i" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                                cmp.select_prev_item()
                        else
                                fallback()
                        end
                end, { "i" }),
        }),
        sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                -- { name = 'vsnip' }, -- For vsnip users.
                { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
                { name = 'buffer' },
                { name = 'path' }
        }),
        formatting = {
                fields = {'abbr', 'icon', 'kind', 'menu'},
                format = lspkind.cmp_format({
                        maxwidth = {
                                menu = 50,
                                abbr = 50
                        },
                        ellipsis_char = '...',
                        show_labelDetails = true,
                })
        }
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
                { name = 'buffer' }
        }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
                { name = 'path' }
        },
        {
                { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
})



require("luasnip.loaders.from_vscode").lazy_load()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require'nvim-tree'.setup()

-- lsp setups

vim.lsp.config('clangd', {
        cmd = {'clangd', '--completion-style=detailed'}
})
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('hls')
vim.lsp.enable('cssls')
vim.lsp.enable('html')
vim.lsp.config('asm_lsp', {
        filetypes = {"asm", "vmasm"}
})
vim.lsp.enable('asm_lsp')

vim.lsp.enable('lua_ls') -- these do not work with 0.12 for me
vim.lsp.enable('ts_ls')
