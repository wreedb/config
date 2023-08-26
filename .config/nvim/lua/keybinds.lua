-- vim:ft=lua:fileencoding=utf-8

local m = require 'mapx'.setup { global = true, whichkey = true }

nnoremap('<leader>s', ':%s/', 'search/replace')
nnoremap('<leader>o', ':e ~/',   'open file')
nnoremap('<leader>o.', ':e ~/.', 'open [dot]file')

nnoremap('<leader>\\', ':Dashboard<cr>', 'open dashboard')


m.nname('<leader>c',     'CLIPBOARD')
m.nname('<leader>r',     'RESIZE')
m.nname('<leader>w',     'WINDOW')
m.nname('<leader>f',     'FILE')
m.nname('<leader>g',     'GOTO')
m.nname('<leader><tab>', 'TAB')
m.nname('<leader>x',     'OFF')
m.nname('<leader>b',     'ON')

-- resize
nnoremap('<leader>r<Left>',  ':vertical resize +4<Cr>',   'RESIZE: left')
nnoremap('<leader>r<Right>', ':vertical resize -4<Cr>',   'RESIZE: right')

nnoremap('<leader>r<Up>',    ':horizontal resize -4<Cr>', 'RESIZE: up')
nnoremap('<leader>r<Down>',  ':horizontal resize +4<Cr>', 'RESIZE: down')

-- goto
nnoremap('<leader>g<Up>',   'gg', 'GOTO: document start')
nnoremap('<leader>g<Down>', 'G',  'GOTO: document end')

-- files
nnoremap('<leader>fm', ':NvimTreeToggle<Cr>', 'FILE: manager')
nnoremap('<leader>fr', ':e #<1<Cr>',    'FILE: open most recent')

-- off
nnoremap('<leader>xl',  ':LspStop<Cr>',                   'OFF: LSP')
nnoremap('<leader>xx',  ':ColorizerDetachFromBuffer<Cr>', 'OFF: Colorizer')

-- on
nnoremap('<leader>bl',  ':LspStart<Cr>',                'ON: LSP')
nnoremap('<leader>bc',  ':CoqNow<Cr>',                  'ON: Coq')
nnoremap('<leader>bx',  ':ColorizerAttachToBuffer<Cr>', 'ON: Colorizer')

-- windows
nnoremap('<leader>wv', ':vsplit<Cr>', 'WINDOW: v-split')
nnoremap('<leader>wh', ':split<Cr>',  'WINDOW: h-split')
nnoremap('<leader>wq', ':q<Cr>',      'WINDOW: close')
nnoremap('<leader>wx', ':x<Cr>',      'WINDOW: write+close')

-- windows: focus
nnoremap('<leader>w<Left>',  ':wincmd h<Cr>', 'WINDOW: focus left')
nnoremap('<leader>w<Down>',  ':wincmd j<Cr>', 'WINDOW: focus down')
nnoremap('<leader>w<Up>',    ':wincmd k<Cr>', 'WINDOW: focus up')
nnoremap('<leader>w<Right>', ':wincmd l<Cr>', 'WINDOW: focus right')

-- tabs
nnoremap('<leader><tab>n',       ':tabnew<Cr>',  'TAB: new')
nnoremap('<leader><tab><Right>', ':tabnext<Cr>', 'TAB: next')
nnoremap('<leader><tab><Left>',  ':tabprev<Cr>', 'TAB: previous')

-- clipboard
nnoremap('<leader>cc', '"+y',  'CLIPBOARD: copy')
nnoremap('<leader>cp', '"+p',  'CLIPBOARD: paste')
