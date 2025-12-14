return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "mason-lspconfig.nvim",
  },
  config = function()
    vim.diagnostic.config({
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●" },
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = " ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
    })

    -- Shared capabilities with nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
      capabilities = vim.tbl_deep_extend("force", capabilities, cmp_lsp.default_capabilities())
    end

    -- TypeScript organize imports command
    local function organize_imports()
      vim.lsp.buf.execute_command({
        command = "_typescript.organizeImports",
        arguments = { vim.fn.expand("%:p") },
      })
    end

    -- Shared on_attach for format on save
    local function on_attach(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
      -- TypeScript specific
      if client.name == "ts_ls" then
        vim.keymap.set("n", "<leader>o", organize_imports, { buffer = bufnr, desc = "Organize imports" })
      end
    end

    -- Lua
    vim.lsp.config.lua_ls = {
      capabilities = capabilities,
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    -- TypeScript
    vim.lsp.config.ts_ls = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- ESLint
    vim.lsp.config.eslint = {
      capabilities = capabilities,
    }

    -- Tailwind
    vim.lsp.config.tailwindcss = {
      capabilities = capabilities,
    }

    -- Astro
    vim.lsp.config.astro = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- Enable the configured LSPs
    vim.lsp.enable({ "lua_ls", "ts_ls", "eslint", "tailwindcss", "astro" })

    -- Rust is handled by rustaceanvim, not here
  end,
}
