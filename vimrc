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

"Set leader sing (eg. for nerdcommenter usage)
let mapleader = "\\"

"Set python3 support for python-mode -> plugin for python3 autocomplete
let g:pymode_python = 'python3'

"Set config for NERDcommenter
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

"VIM-AIRLINE extension for status bar (top, bottom)
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'

"set NerdTree directory root to terminal one
let g:NERDTreeChDirMode = 2

"Enable cursor on mouse
set mouse=a
"Highlight line longer than colorcolumn size
highlight ColorColumn ctermbg=NONE
highlight OverLength ctermbg=NONE cterm=bold
match OverLength /\%81v.\+/
"Auto braces completition
set autoindent
set smartindent
"inoremap { {<C-Return>}<Up><End><C-Return>
"inoremap ( ()<Left>
"inoremap [ []<Left>

"configuration for vim-rtags
let g:agsAutoLaunchRdm = 1
"let g:rtagsRcCmd='/home/patlas/Programs/rtags/bin/rc'
"let g:rtagsRdmCmd='/home/patlas/Programs/rtags/bin/rdm'
