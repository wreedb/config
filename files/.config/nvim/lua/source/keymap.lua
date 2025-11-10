--- source/keymap.lua:
-- wrappers for which-key and vim.keymap

---@function cmdx
---@param command string
---@return string wrapped string for keybind <cmd> + command with carriage return
function cmdx(command)
    return string.format("<cmd>%s<CR>", command)
end

---@function cmdn 
---@param command string
---@return string wrapped string for keybind <cmd> + command without carriage return
function cmdn(command)
    return string.format("<cmd>%s", command)
end

---@function leader
---@param str string
---@return string wrapped string for keybind prefixed with <leader>
function leader(str)
    return string.format("<leader>%s", str)
end
