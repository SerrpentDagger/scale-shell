local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#08192c", -- Default Background
    base01 = "#0f3257", -- Lighter Background (status bars)
    base02 = "#0d2d4f", -- Selection Background
    base03 = "#5f6974", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#afb2b6", -- Dark Foreground (status bars)
    base05 = "#f2f2f3", -- Default Foreground
    base06 = "#f2f2f3", -- Light Foreground
    base07 = "#f2f2f3", -- Lightest Foreground
    -- Accent colors
    base08 = "#fd4663", -- Variables, XML Tags, Errors
    base09 = "#f3a758", -- Integers, Constants
    base0A = "#4f4fe3", -- Classes, Search Background
    base0B = "#f5f56f", -- Strings, Diff Inserted
    base0C = "#b1f56f", -- Regex, Escape Chars
    base0D = "#9b4fe3", -- Functions, Methods
    base0E = "#65a4e6", -- Keywords, Storage
    base0F = "#900017", -- Deprecated, Embedded Tags
  })
end
--[[
primary: #65a4e6
on_primary: #101519
primary_container: #0a4b8f
on_primary_container: #d3e5f8
primary_fixed: #bdd8f4
primary_fixed_dim: #91beed
on_primary_fixed: #21262c
on_primary_fixed_variant: #2b333b

secondary: #4f4fe3
on_secondary: #181e25
secondary_container: #080878
on_secondary_container: #d3d3f8
secondary_fixed: #bdbdf4
secondary_fixed_dim: #9191ee
on_secondary_fixed: #21212c
on_secondary_fixed_variant: #2b2b3b

tertiary: #9b4fe3
on_tertiary: #181e25
tertiary_container: #410878
on_tertiary_container: #e6d3f8
tertiary_fixed: #d9bdf4
tertiary_fixed_dim: #c091ee
on_tertiary_fixed: #26212c
on_tertiary_fixed_variant: #332b3b

error: #fd4663
on_error: #181e25
error_container: #900017
on_error_container: #fecdd4

surface: #091e35
on_surface: #f2f2f3
surface_variant: #0c2846
on_surface_variant: #afb2b6
surface_dim: #061423
surface_bright: #113c69
surface_container_lowest: #040f1a
surface_container_low: #07192c
surface_container: #0f3257
surface_container_high: #0d2d4f
surface_container_highest: #11375f

outline: #5f6974
outline_variant: #5f6973
shadow: #091e35
scrim: #000000

inverse_surface: #e3e5e8
inverse_on_surface: #242628
inverse_primary: #2b64a1

background: #091e35
on_background: #f2f2f3

hued: #e6d065
invert: #9a5b19
invert: #b0b01c
invert: #64b01c
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
