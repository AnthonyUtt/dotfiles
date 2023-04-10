local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local base_opts = {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.bashls.setup(base_opts)
lspconfig.cssls.setup(base_opts)
lspconfig.cssmodules_ls.setup(base_opts)
lspconfig.docker_compose_language_service.setup(base_opts)
lspconfig.dockerls.setup(base_opts)
lspconfig.dotls.setup(base_opts)
lspconfig.emmet_ls.setup(base_opts)

lspconfig.eslint.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
    on_attach(client, bufnr)
  end,
})

lspconfig.gdscript.setup(base_opts)
lspconfig.html.setup(base_opts)
lspconfig.jsonls.setup(base_opts)

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
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
})

-- lspconfig.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"rust"},
--   root_dir = lspconfig.util.root_pattern("Cargo.toml"),
--   settings = {
--     ["rust-analyzer"] = {
--       checkOnSave = {
--         enable = true,
--         command = 'check',
--         extraArgs = {
--           "--target-dir", "/home/anthony/.rust-analyzer",
--         }
--       }
--     }
--   },
-- })

lspconfig.solargraph.setup(base_opts)
lspconfig.sqlls.setup(base_opts)
lspconfig.tsserver.setup(base_opts)
