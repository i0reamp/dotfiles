return {
  { "OXY2DEV/markview.nvim", enabled = false },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "markdown",
    opts = {
      heading = {
        icons = { "H1 ", "H2 ", "H3 ", "H4 ", "H5 ", "H6 " },
        width = "block",
      },
      pipe_table = {
        style = "normal",
      },
      code = {
        style = "full",
        border = "thin",
      },
    },
    init = function()
      vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "BufWinEnter" }, {
        pattern = { "markdown", "*.md" },
        callback = function()
          vim.opt_local.spell = false
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
        end,
      })
    end,
  },
}
