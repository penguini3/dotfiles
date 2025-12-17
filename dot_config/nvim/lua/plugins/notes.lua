return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    "nvim-neorg/neorg",
    lazy = false,
    dependencies = { "hrsh7th/nvim-cmp" },
    version = "*",
    config = true,
  },
}
