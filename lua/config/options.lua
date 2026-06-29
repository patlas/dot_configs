-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Ogólne ustawienia wyglądu i zachowania
vim.opt.background = "dark"
vim.opt.hidden = true
vim.opt.cmdheight = 2
-- vim.opt.updatetime = 1000
vim.opt.shortmess:append("c")
vim.opt.number = true
vim.opt.relativenumber = false -- Zakomentowane zgodnie z oryginałem
vim.opt.clipboard = "unnamedplus"

-- Tabulacje i wcięcia
vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Bezpieczeństwo i pliki zewnętrzne
vim.opt.exrc = true
vim.opt.secure = true

-- Zawijanie tekstu i wyszukiwanie
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Pliki tymczasowe, kopie i historia (Undo)
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

-- Interfejs i kursor
vim.opt.scrolloff = 1
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.mouse = "a"

-- Opcje trybu Diff (ignorowanie spacji i wielkości liter)
vim.opt.diffopt:append({ "iwhite", "icase" })

-- Podświetlenie linii kursora (Odpowiednik polecenia :highlight)
vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = "darkgray", cterm = {} })

vim.g.autoformat = false
vim.b.autoformat = false -- buffer-local
