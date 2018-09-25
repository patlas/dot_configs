set encoding=utf-8

syntax on
colorscheme desert

execute pathogen#infect()
filetype plugin indent on

"set system grep
set grepprg=/bin/grep

set number
set background=dark
set clipboard=unnamedplus
set tabstop=8 
set softtabstop=0 
set expandtab 
set shiftwidth=4 
set smarttab
set exrc
set secure
set colorcolumn=120 
highlight darkgray ctermbg=darkgray
highlight Normal ctermfg=gray
"Highlight cursor line
set cursorline
highlight CursorLine cterm=NONE ctermbg=darkgray
"Set shortcut for CtrlP plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"Enable cursor on mouse
set mouse=a
"Highlight line longer than colorcolumn size
highlight ColorColumn ctermbg=NONE
highlight OverLength ctermbg=NONE cterm=bold
match OverLength /\%81v.\+/
"Auto braces completition
set autoindent
set smartindent
inoremap { {<C-Return>}<Up><End><C-Return>
inoremap ( ()<Left>
inoremap [ []<Left>

"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
