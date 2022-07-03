local cmp = require'cmp'

cmp.setup {
        snippet = {
                expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                end
        },
        window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
        },
        mapping = cmp.mapping.preset.insert {
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<C-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true })
        },
        sources = cmp.config.sources({
                {name = 'nvim_lsp'},
                {name = 'vsnip'}
        }, {
                {name = 'buffer'}
        })
}


-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
                { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
                { name = 'buffer' },
        })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
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
        }, {
                { name = 'cmdline' }
        })
})

local lspconfig = require 'lspconfig'

lspconfig.pyright.setup {
    on_attach=on_attach,
    capabilities=capabilities,
    -- the next 3 lines are important
    handlers = {
        ['textDocument/publishDiagnostics'] = function(...) end
    },
    settings = {
        typeCheckingMode = 'off', -- no effect here...
        python = {
            analysis = {
                typeCheckingMode = 'off', -- and here...
            },
        },
        pyright = {
            disableDiagnostics = true, -- Used to work in coc
        }
    }
}


lspconfig.sumneko_lua.setup {
        settings = {
                Lua = {
                        runtime = {
                                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                        },
                        diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = {'vim'},
                                enable = false
                        },
                        workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                                enable = false,
                        },
                },
        },
}
