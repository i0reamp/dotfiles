return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        icons_enabled = false,
        section_separators = "",
        component_separators = "|",
      })

      -- Fix diagnostics symbols
      for _, section in pairs(opts.sections or {}) do
        for _, comp in ipairs(section) do
          if type(comp) == "table" then
            if comp[1] == "diagnostics" then
              comp.symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" }
            end
            if comp[1] == "filetype" then
              comp.icon_only = false
            end
            if comp[1] == "diff" then
              comp.symbols = { added = "+", modified = "~", removed = "-" }
            end
          end
        end
      end

      opts.sections.lualine_b = {
        { "branch", icon = "" },
      }
      opts.sections.lualine_y = {
        { "progress" },
        { "location" },
      }
      opts.sections.lualine_z = {
        function()
          return os.date("%H:%M")
        end,
      }
    end,
  },
}
