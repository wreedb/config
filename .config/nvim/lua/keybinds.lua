-- vim:ft=lua:fileencoding=utf-8

local m = require 'mapx'.setup { global = true, whichkey = true }

nnoremap('<leader>s', ':%s/', 'search/replace')
nnoremap('<leader>o', ':e ~/', 'open file')


m.nname('<leader>c',     'clipboard')
m.nname('<leader>r',     'resize')
m.nname('<leader>w',     'window')
m.nname('<leader>f',     'file')
m.nname('<leader>g',     'goto')
m.nname('<leader><tab>', 'tab')
m.nname('<leader>x',     'off')
m.nname('<leader>X',     'on')

-- resize
nnoremap('<leader>r<Left>',  ':vertical resize +4<Cr>',   'resize: left')
nnoremap('<leader>r<Right>', ':vertical resize -4<Cr>',   'resize: right')

nnoremap('<leader>r<Up>',    ':horizontal resize -4<Cr>', 'resize: up')
nnoremap('<leader>r<Down>',  ':horizontal resize +4<Cr>', 'resize: down')

-- goto
nnoremap('<leader>g<Up>',   'gg', 'goto: document start')
nnoremap('<leader>g<Down>', 'G',  'goto: document end')

-- files
nnoremap('<leader>fm', ':CHADopen<Cr>', 'file: manager')
nnoremap('<leader>fr', ':e #<1<Cr>',    'file: open most recent')

-- off
nnoremap('<leader>xl',  ':LspStop<Cr>',                   'off: LSP')
nnoremap('<leader>xc',  ':CocDisable<Cr>',                'off: COC')
nnoremap('<leader>xx',  ':ColorizerDetachFromBuffer<Cr>', 'off: Colorizer')

-- on
nnoremap('<leader>bl',  ':LspStart<Cr>',                'on: LSP')
nnoremap('<leader>bc',  ':CocEnable<Cr>',               'on: COC')
nnoremap('<leader>bx',  ':ColorizerAttachToBuffer<Cr>', 'on: Colorizer')

-- windows
nnoremap('<leader>wv', ':vsplit<Cr>', 'window: v-split')
nnoremap('<leader>wh', ':split<Cr>',  'window: h-split')
nnoremap('<leader>wq', ':q<Cr>',      'window: close')
nnoremap('<leader>wx', ':x<Cr>',      'window: write+close')

-- windows: focus
nnoremap('<leader>w<Left>',  ':wincmd h<Cr>', 'window: focus left')
nnoremap('<leader>w<Down>',  ':wincmd j<Cr>', 'window: focus down')
nnoremap('<leader>w<Up>',    ':wincmd k<Cr>', 'window: focus up')
nnoremap('<leader>w<Right>', ':wincmd l<Cr>', 'window: focus right')

-- tabs
nnoremap('<leader><tab>n',       ':tabnew<Cr>',  'tab: new')
nnoremap('<leader><tab><Right>', ':tabnext<Cr>', 'tab: next')
nnoremap('<leader><tab><Left>',  ':tabprev<Cr>', 'tab: previous')

-- clipboard
nnoremap('<leader>cc', '"+y',  'clipboard: copy')
nnoremap('<leader>cp', '"+p',  'clipboard: paste')
