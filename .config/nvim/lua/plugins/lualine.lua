return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "rose-pine",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { { "filename", path = 1 } },
      lualine_c = {},
      lualine_x = { "diagnostics" },
      lualine_y = { "diff", "branch" },
      lualine_z = {},
    },
  },
}
