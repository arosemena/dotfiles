return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  ft = "rust",
  opts = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>ca", function()
          vim.cmd.RustLsp("codeAction")
        end, { buffer = bufnr, desc = "Rust code action" })
        vim.keymap.set("n", "<leader>rd", function()
          vim.cmd.RustLsp("debuggables")
        end, { buffer = bufnr, desc = "Rust debuggables" })
        vim.keymap.set("n", "<leader>rr", function()
          vim.cmd.RustLsp("runnables")
        end, { buffer = bufnr, desc = "Rust runnables" })
        vim.keymap.set("n", "<leader>rt", function()
          vim.cmd.RustLsp("testables")
        end, { buffer = bufnr, desc = "Rust testables" })
        vim.keymap.set("n", "K", function()
          vim.cmd.RustLsp({ "hover", "actions" })
        end, { buffer = bufnr, desc = "Rust hover" })
      end,
      default_settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = { command = "clippy" },
        },
      },
    },
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
  end,
}
