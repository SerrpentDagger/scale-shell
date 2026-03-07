local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#033a23", -- Default Background
    base01 = "#0f5738", -- Lighter Background (status bars)
    base02 = "#0b5033", -- Selection Background
    base03 = "#698076", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#afb6b3", -- Dark Foreground (status bars)
    base05 = "#f2f3f2", -- Default Foreground
    base06 = "#f2f3f2", -- Light Foreground
    base07 = "#f2f3f2", -- Lightest Foreground
    -- Accent colors
    base08 = "#fd4663", -- Variables, XML Tags, Errors
    base09 = "#3d8bf5", -- Integers, Constants
    base0A = "#3de7f5", -- Classes, Search Background
    base0B = "#55f6b2", -- Strings, Diff Inserted
    base0C = "#86b6f9", -- Regex, Escape Chars
    base0D = "#86f9c8", -- Functions, Methods
    base0E = "#86f0f9", -- Keywords, Storage
    base0F = "#900017", -- Deprecated, Embedded Tags
  })
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["matugen"] = nil
    require("matugen").setup()
  end)
)

return M
