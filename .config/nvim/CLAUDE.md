# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture

This is a modular Neovim configuration using **Lazy.nvim** as the plugin manager. The configuration follows a clean separation of concerns:

- `init.lua` → Entry point that requires the main `arosemena` module
- `lua/arosemena/` → Core configuration modules (keymaps, settings, LSP, etc.)
- `lua/plugins/` → Individual plugin configurations using Lazy.nvim spec format

## Key Components

- **Plugin Manager**: Lazy.nvim with automatic installation and lazy loading
- **LSP Setup**: Mason for tool management, custom TypeScript/Astro configurations with Prettier integration
- **Leader Key**: Space key for most custom mappings
- **Colorscheme**: Rose Pine theme

## Common Development Tasks

### Adding a New Plugin
1. Create `lua/plugins/plugin-name.lua`
2. Return a Lazy.nvim spec table with plugin configuration
3. Restart Neovim - Lazy will auto-detect and install

### Modifying Keymaps
- Global keymaps: Edit `lua/arosemena/keymaps.lua`
- Plugin-specific keymaps: Add `keys = {}` table to plugin spec

### LSP Configuration
- General LSP settings: `lua/plugins/nvim-lspconfig.lua`
- Custom LSP logic: `lua/arosemena/lsp.lua`
- Tool installation: `lua/plugins/mason.lua`

### Configuration Structure
The `lua/arosemena/init.lua` orchestrates all modules in this order:
1. `keymaps` → Key bindings
2. `lazy` → Plugin manager setup
3. `set` → Vim options
4. `lsp` → Language server configurations
5. `copilot-chat` → AI assistant
6. Sets rose-pine colorscheme

## Plugin Configuration Pattern

Each plugin file should return a spec table:
```lua
return {
  'plugin/name',
  dependencies = { ... },
  keys = { ... },           -- Lazy loading on keymap
  cmd = '...',             -- Lazy loading on command
  event = '...',           -- Lazy loading on event
  opts = { ... },          -- Plugin options
  config = function() ... end  -- Custom setup
}
```