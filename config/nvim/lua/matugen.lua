local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#090a2a", -- Default Background
    base01 = "#121454", -- Lighter Background (status bars)
    base02 = "#10124c", -- Selection Background
    base03 = "#5f5f73", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#afafb6", -- Dark Foreground (status bars)
    base05 = "#f2f2f3", -- Default Foreground
    base06 = "#f2f2f3", -- Light Foreground
    base07 = "#f2f2f3", -- Lightest Foreground
    -- Accent colors
    base08 = "#fd4663", -- Variables, XML Tags, Errors
    base09 = "#f1ec5a", -- Integers, Constants
    base0A = "#e7baee", -- Classes, Search Background
    base0B = "#36d21d", -- Strings, Diff Inserted
    base0C = "#7aef75", -- Regex, Escape Chars
    base0D = "#d757db", -- Functions, Methods
    base0E = "#676be4", -- Keywords, Storage
    base0F = "#900017", -- Deprecated, Embedded Tags
  })
end
--[[
primary: #676be4
on_primary: #181925
primary_container: #0c108d
on_primary_container: #d5d6f6
primary_fixed: #bec0f4
primary_fixed_dim: #9396ec
on_primary_fixed: #21212c
on_primary_fixed_variant: #2b2c3b

secondary: #e7baee
on_secondary: #181925
secondary_container: #be1ed7
on_secondary_container: #fbf6fb
secondary_fixed: #ecbef4
secondary_fixed_dim: #de96e9
on_secondary_fixed: #2a212c
on_secondary_fixed_variant: #392b3b

tertiary: #d757db
on_tertiary: #181925
tertiary_container: #6f0d73
on_tertiary_container: #f5d5f6
tertiary_fixed: #f2bef4
tertiary_fixed_dim: #e696e9
on_tertiary_fixed: #2c212c
on_tertiary_fixed_variant: #3a2b3b

error: #fd4663
on_error: #181925
error_container: #900017
on_error_container: #fecdd4

surface: #0b0c32
on_surface: #f2f2f3
surface_variant: #0e1043
on_surface_variant: #afafb6
surface_dim: #070822
surface_bright: #161865
surface_container_lowest: #050619
surface_container_low: #090a2a
surface_container: #121454
surface_container_high: #10124c
surface_container_highest: #14165c

outline: #5f5f73
outline_variant: #5f5f73
shadow: #0b0c32
scrim: #000000

inverse_surface: #e3e4e8
inverse_on_surface: #242428
inverse_primary: #31349b

background: #0b0c32
on_background: #f2f2f3

hued: #e4cf67
invert: #98941b
invert: #184511
invert: #28a824
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
