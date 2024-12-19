return {
  {
    'ThePrimeagen/refactoring.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    keys = {
      {
        '<leader>rs',
        mode = 'v',
        desc = 'Refactor',
      },
      {
        '<leader>rf',
        function()
          require('refactoring').refactor 'Extract Function'
        end,
        mode = 'x',
        desc = 'Extract Function',
      },
      {
        '<leader>rF',
        function()
          require('refactoring').refactor 'Extract Function To File'
        end,
        mode = 'x',
        desc = 'Extract Function To File',
      },
      {
        '<leader>rI',
        function()
          require('refactoring').refactor 'Inline Function'
        end,
        mode = 'x',
        desc = 'Inline Function',
      },
      {
        '<leader>rv',
        function()
          require('refactoring').refactor 'Extract Variable'
        end,
        mode = 'v',
        desc = 'Extract Variable',
      },
      {
        '<leader>ri',
        function()
          require('refactoring').refactor 'Inline Variable'
        end,
        mode = { 'n', 'x' },
        desc = 'Inline Variable',
      },
      {
        '<leader>rb',
        function()
          require('refactoring').refactor 'Extract Block'
        end,
        desc = 'Extract Block',
      },
      {
        '<leader>rB',
        function()
          require('refactoring').refactor 'Extract Block To File'
        end,
        desc = 'Extract Block To File',
      },
      {
        '<leader>rP',
        function()
          require('refactoring').debug.printf { below = false }
        end,
        desc = 'Debug Print',
      },
      {
        '<leader>rp',
        function()
          require('refactoring').debug.print_var { normal = true }
        end,
        desc = 'Debug Print Variable',
      },
      {
        '<leader>rc',
        function()
          require('refactoring').debug.cleanup {}
        end,
        desc = 'Debug Cleanup',
      },
      {
        '<leader>rp',
        function()
          require('refactoring').debug.print_var()
        end,
        mode = 'v',
        desc = 'Debug Print Variable',
      },
    },
    opts = {
      prompt_func_return_type = {
        go = false,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      prompt_func_param_type = {
        go = false,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      printf_statements = {},
      print_var_statements = {},
      show_success_message = true, -- shows a message with information about the refactor on success
      -- i.e. [Refactor] Inlined 3 variable occurrences
    },
    config = function(_, opts)
      require('refactoring').setup(opts)
      require('telescope').load_extension 'refactoring'
    end,
  },
}
