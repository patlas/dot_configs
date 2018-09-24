syntax on
colorscheme desert
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
