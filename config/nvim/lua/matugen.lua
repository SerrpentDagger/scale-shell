local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#08182a", -- Default Background
    base01 = "#113055", -- Lighter Background (status bars)
    base02 = "#0f2b4d", -- Selection Background
    base03 = "#5f6873", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#afb2b6", -- Dark Foreground (status bars)
    base05 = "#f2f2f3", -- Default Foreground
    base06 = "#f2f2f3", -- Light Foreground
    base07 = "#f2f2f3", -- Lightest Foreground
    -- Accent colors
    base08 = "#fd4663", -- Variables, XML Tags, Errors
    base09 = "#f1ac5a", -- Integers, Constants
    base0A = "#5955dd", -- Classes, Search Background
    base0B = "#edf174", -- Strings, Diff Inserted
    base0C = "#adf174", -- Regex, Escape Chars
    base0D = "#9f55dd", -- Functions, Methods
    base0E = "#67a0e4", -- Keywords, Storage
    base0F = "#900017", -- Deprecated, Embedded Tags
  })
end
--[[
primary: #67a0e4
on_primary: #0d1014
primary_container: #0c478d
on_primary_container: #d4e4f7
primary_fixed: #bed6f4
primary_fixed_dim: #93bbec
on_primary_fixed: #21262c
on_primary_fixed_variant: #2b323b

secondary: #5955dd
on_secondary: #181e25
secondary_container: #0f0c74
on_secondary_container: #d6d4f7
secondary_fixed: #c0bef4
secondary_fixed_dim: #9795ea
on_secondary_fixed: #21212c
on_secondary_fixed_variant: #2c2b3b

tertiary: #9f55dd
on_tertiary: #181e25
tertiary_container: #440c74
on_tertiary_container: #e7d4f7
tertiary_fixed: #dbbef4
tertiary_fixed_dim: #c395ea
on_tertiary_fixed: #27212c
on_tertiary_fixed_variant: #342b3b

error: #fd4663
on_error: #181e25
error_container: #900017
on_error_container: #fecdd4

surface: #0a1d33
on_surface: #f2f2f3
surface_variant: #0d2644
on_surface_variant: #afb2b6
surface_dim: #071322
surface_bright: #143a66
surface_container_lowest: #050e1a
surface_container_low: #08182b
surface_container: #113055
surface_container_high: #0f2b4d
surface_container_highest: #12355e

outline: #5f6873
outline_variant: #5f6873
shadow: #0a1d33
scrim: #000000

inverse_surface: #e3e5e8
inverse_on_surface: #242628
inverse_primary: #2f619d

background: #0a1d33
on_background: #f2f2f3

hued: #e4cf67
invert: #985f1b
invert: #a6aa22
invert: #60aa22
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
