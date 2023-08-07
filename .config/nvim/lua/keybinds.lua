-- vim:ft=lua:fileencoding=utf-8

local m = require 'mapx'.setup { global = true, whichkey = true }

nnoremap("<leader>s", ':%s/', "search/replace")

-- Also supports setting WhichKey group names
m.nname("<leader>f", "file")
m.nname("<leader><tab>", 'tabs')
nnoremap('<leader><tab>n', ':tabnew<Cr>', 'tabs: new')
nnoremap('<leader><tab><Right>', ':tabnext<Cr>', 'tabs: next')
nnoremap('<leader><tab><Left>', ':tabprev<Cr>', 'tabs: previous')
nnoremap('<leader>\\', ':FloatermToggle<Cr>', "terminal")
m.nname("<leader>w", "window")
