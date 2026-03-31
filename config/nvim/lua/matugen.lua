local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#15181e", -- Default Background
    base01 = "#2a303c", -- Lighter Background (status bars)
    base02 = "#262b36", -- Selection Background
    base03 = "#616875", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#afb1b6", -- Dark Foreground (status bars)
    base05 = "#f2f2f3", -- Default Foreground
    base06 = "#f2f2f3", -- Light Foreground
    base07 = "#f2f2f3", -- Lightest Foreground
    -- Accent colors
    base08 = "#fd4663", -- Variables, XML Tags, Errors
    base09 = "#f1bf5a", -- Integers, Constants
    base0A = "#7c68d9", -- Classes, Search Background
    base0B = "#d3ea6c", -- Strings, Diff Inserted
    base0C = "#9ae274", -- Regex, Escape Chars
    base0D = "#b071d0", -- Functions, Methods
    base0E = "#6791e4", -- Keywords, Storage
    base0F = "#900017", -- Deprecated, Embedded Tags
  })
end
--[[
primary: #6791e4
on_primary: #181d25
primary_container: #0c378d
on_primary_container: #e1e4ea
primary_fixed: #bed0f4
primary_fixed_dim: #93b1ec
on_primary_fixed: #21242c
on_primary_fixed_variant: #2b303b

secondary: #7c68d9
on_secondary: #181d25
secondary_container: #25127d
on_secondary_container: #e3e1ea
secondary_fixed: #c7bef4
secondary_fixed_dim: #a496e9
on_secondary_fixed: #23212c
on_secondary_fixed_variant: #2e2b3b

tertiary: #b071d0
on_tertiary: #181d25
tertiary_container: #561976
on_tertiary_container: #e7e1ea
tertiary_fixed: #e1bef4
tertiary_fixed_dim: #cd96e9
on_tertiary_fixed: #28212c
on_tertiary_fixed_variant: #362b3b

error: #fd4663
on_error: #181d25
error_container: #900017
on_error_container: #fecdd4

surface: #191d24
on_surface: #f2f2f3
surface_variant: #222630
on_surface_variant: #afb1b6
surface_dim: #111318
surface_bright: #323a48
surface_container_lowest: #0d0e12
surface_container_low: #15181e
surface_container: #2a303c
surface_container_high: #262b36
surface_container_highest: #2e3542

outline: #616875
outline_variant: #606875
shadow: #191d24
scrim: #000000

inverse_surface: #e3e5e8
inverse_on_surface: #242628
inverse_primary: #335599

background: #191d24
on_background: #f2f2f3

hued: #e4cf67
invert: #986e1b
invert: #839726
invert: #4f8e2f
--]]
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
