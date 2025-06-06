return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      mappings = {
        submit_prompt = {
          normal = '<Leader>s',
          insert = '<CR>'
        }
      }
    },
  },
}
