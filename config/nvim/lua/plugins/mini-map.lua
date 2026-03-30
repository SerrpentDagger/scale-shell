return {
  "nvim-mini/mini.map",
  event = "VeryLazy",
  version = false,
  keys = {
    { "<leader>mc", "<cmd>lua MiniMap.close()<CR>", desc = "Close" },
    { "<leader>mo", "<cmd>lua MiniMap.open()<CR>", desc = "Open" },
    { "<leader>mm", "<cmd>lua MiniMap.toggle()<CR>", desc = "Toggle" },
    { "<leader>mf", "<cmd>lua MiniMap.toggle_focus()<CR>", desc = "Focus" },
    { "<leader>mr", "<cmd>lua MiniMap.refresh()<CR>", desc = "Refresh" },
    { "<leader>ms", "<cmd>lua MiniMap.toggle_side()<CR>", desc = "Toggle Side" },
  },
  dependencies = {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>m", group = "minimap" },
      },
    },
  },
  opts = function(_, _)
    local mini_map = require("mini.map")
    return {
      integrations = {
        mini_map.gen_integration.builtin_search(),
        mini_map.gen_integration.diff(),
        mini_map.gen_integration.diagnostic(),
      },
      symbols = {
        encode = mini_map.gen_encode_symbols.dot("4x2"),
      },
    }
  end,
  config = function(_, opts)
    local mini_map = require("mini.map")
    mini_map.setup(opts)
    -- mini_map.open()
  end,
}
