-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local M = {}

function M.termux_battery_object()
  local bat_lvl = vim.fn.system('termux-battery-status')
  local Decoded_bat_lvl = vim.fn.json_decode(bat_lvl)
  if Decoded_bat_lvl ~= nil
    then return Decoded_bat_lvl -- {
--      percentage = Decoded_bat_lvl.percentage,
--      plugged = Decoded_bat_lvl.plugged,
--      status = Decoded_bat_lvl.status,
--      whole_table = Decoded_bat_lvl
 --   }
  else do return {} end
  end
end

function M.termux_battery_percentage()
  local bat_lvl = vim.fn.system('termux-battery-status')
  local Decoded_bat_lvl = vim.fn.json_decode(bat_lvl)
  if Decoded_bat_lvl ~= nil then
    return tostring(Decoded_bat_lvl.percentage)
  else do return {} end
  end
end

return M
