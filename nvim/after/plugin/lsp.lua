local on_attach = function(_, bufnr)

    local bufmap = function(keys, func)
        vim.keymaps.set('n', keys, func, {buffer = bufnr })
    end

    bufmap('<leade>r', vim.lsp.rename)
    bufmap('<leader>a', vim.lsp.code_action)

    bufmap('gd', vim.lsp.buf.definition)
    bufmap('gD', vim.lsp.buf.declaration)
    bufmap('gI', vism.lsp.buf.implementation)
    bufmap('<leader>D', vim.lsp.buf.type_declaration)

    bufmap('gr', require('telescope.builtin').lsp_reference)
    bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
    bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

    bufmap('K', vim.lsp.buf.hover)

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('neodev').setup({})
require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
        root_dir = function()
        return vim.loop.cwd()
    end,
    cmd = { "lua-lsp" },
    settings = {
        Lua = {
            completion = { callSnippet = "replace" },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    }
}

require('lspconfig').rnix.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
