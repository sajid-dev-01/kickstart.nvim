return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      tsserver_max_memory = 'auto',
      expose_as_code_action = 'all',
      jsx_close_tag = {
        enable = true,
        filetypes = { 'javascriptreact', 'typescriptreact' },
      },
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
        includeCompletionsForModuleExports = true,
        -- includeInlayFunctionParameterTypeHints = true,
        -- includeInlayVariableTypeHints = true,
        -- includeInlayFunctionLikeReturnTypeHints = true,
        -- includeInlayPropertyDeclarationTypeHints = true,
        quotePreference = 'double',
      },
      tsserver_format_options = {
        tabSize = 2,
        indentSize = 2,
        indentStyle = 'Smart',
        convertTabsToSpace = true,
        trimTrailingWhitespace = true,
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = false,
      },
    },
  },
  init = function()
    local map = function(mode, keys, func, desc)
      vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
    end

    map('n', '<leader>cf', '<cmd>TSToolsFixAll <cr>', '[f]ix all')
    map('n', '<leader>cR', '<cmd>TSToolsRemoveUnused <cr>', '[R]emove unused')
    map('n', '<leader>rF', '<cmd>TSToolsRenameFile <cr>', '[F]ile rename')

    -- import keymaps
    map('n', '<leader>ci', '', '[c]ode [i]mport')
    map('n', '<leader>cia', '<cmd>TSToolsAddMissingImports <cr>', '[a]dd missing import')
    map('n', '<leader>cio', '<cmd>TSToolsOrganizeImports <cr>', '[o]rganize import')
    map('n', '<leader>cis', '<cmd>TSToolsSortImport <cr>', '[s]ort import')
    map('n', '<leader>cir', '<cmd>TSToolsRemoveUnusedImports <cr>', '[r]emove unused import')
  end,
}
