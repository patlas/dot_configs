call plug#begin('~/.config/nvim/autoload/plugged')
	Plug 'scrooloose/NERDTree'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'iCyMind/NeoSolarized'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	"Plug 'altercation/vim-colors-solarized', {'branch': 'master'}
call plug#end()

set termguicolors
" normal low high
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 0
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0
let g:neosolarized_termBoldAsBright = 1
set background=dark
colorscheme NeoSolarized

set number
set clipboard=unnamedplus
set tabstop=8
set softtabstop=0
set expandtab 
set shiftwidth=4 
set smarttab
set exrc
set secure

" set colorcolumn=120 
highlight darkgray ctermbg=darkgray
highlight Normal ctermfg=gray

"Highlight cursor line
set cursorline
highlight CursorLine cterm=NONE ctermbg=darkgray

"VIM-AIRLINE extension for status bar (top, bottom)
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'

"set NerdTree directory root to terminal one
let g:NERDTreeChDirMode = 2

"Set config for NERDcommenter
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

"Enable cursor on mouse
set mouse=a
""Highlight line longer than colorcolumn size
highlight ColorColumn ctermbg=NONE
highlight OverLength ctermbg=NONE cterm=bold
match OverLength /\%81v.\+/
"Auto braces completition
set autoindent
set smartindent
