vim.g.copilot_proxy_strict_ssl = 0
vim.g.copilot_filetypes = { ['copilot-chat'] = false }

-- Copilot chat
local chat = require('CopilotChat')
local actions = require('CopilotChat.actions')
local select = require('CopilotChat.select')
local integration = require('CopilotChat.integrations.telescope')

local function read_prompt(name)
  local config_dir = vim.fn.stdpath('config')
  local prompt_file = config_dir .. '/lua/prompts/' .. name .. '.md'
  local f = io.open(prompt_file, 'r')
  local prompts = ""
  if f then
    local content = f:read('*all')
    prompts = content
    f:close()
  else
    prompts = ""
  end
  return prompts
end

local prompts = {
  Improve = {
    system_prompt = read_prompt('reviewer_system_prompt'),
    prompt = read_prompt('reviewer_initial_prompt'),
  },
  PRReviewer = {
    system_prompt = read_prompt('reviewer_system_prompt'),
    prompt = '#branchdiff \n\n' .. read_prompt('reviewer_initial_prompt'),
  },
}

chat.setup({
  model = 'claude-3.5-sonnet',
  show_help = false,
  show_folds = false,
  question_header = '   󰙃    ',
  answer_header = '       ',
  error_header = '       ',
  selection = select.visual,
  sticky = { '#files' },
  mappings = {
    show_diff = {
      full_diff = true,
    }
  },
  prompts = prompts,
  contexts = {
    branchdiff = {
      resolve = function()
        local handle = io.popen("git diff main")
        if not handle then return {} end
        local diff = handle:read("*a")
        handle:close()

        return { {
          content = diff,
          filename = "git_diff_main",
          filetype = "diff"
        } }
      end
    }
  },
})

vim.keymap.set('n', '<C-a>', chat.toggle)
vim.keymap.set('v', '<C-a>', chat.open)
vim.keymap.set('n', '<leader>ax', chat.reset)
vim.keymap.set('n', '<leader>as', chat.stop)
vim.keymap.set('n', '<leader>am', chat.select_model)
vim.keymap.set({'n', 'v'}, '<leader>ap', function()
  local result = actions.prompt_actions()
  if result then
    local filtered = {}
    for name, action in pairs(result.actions) do
      if prompts[name] then filtered[name] = action end
    end
    result.actions = filtered
    integration.pick(result)
  end
end, { desc = 'AI Prompts' })

vim.keymap.set({'n', 'v'}, '<leader>aq', function()
  vim.ui.input({ prompt = 'For Mr  ', }, function(input)
    if input and input ~= '' then
      chat.reset()
      chat.ask(input)
      vim.cmd('wincmd =')
    end
  end)
end, { desc = 'AI Question' })
