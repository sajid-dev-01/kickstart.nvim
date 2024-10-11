return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
    opts = {
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
    opts = {
      flavour = 'mocha',
      transparent_background = true,
      color_overrides = {
        mocha = {
          -- base = '#101015',
        },
      },
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.overlay0 },
          Folded = { bg = colors.surface1 },
          -- TabLineFill = { bg = colors.base },
        }
      end,
    },
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    init = function()
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
    opts = {
      styles = {
        transparency = true,
      },
    },
  },
}
