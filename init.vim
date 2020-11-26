call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'scrooloose/NERDTree'
    Plug 'preservim/nerdcommenter'
    Plug 'neoclide/coc.nvim', ", {'branch': 'release'}
    Plug 'neoclide/coc-highlight',
    Plug 'clangd/coc-clangd', {'do': 'npm install'}
    Plug 'neoclide/coc-python', {'do': 'npm install'}
    Plug 'neoclide/coc-json', {'do': 'npm install'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'iCyMind/NeoSolarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'mbbill/undotree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'iamcco/coc-project', {'do': 'npm install'}
    Plug 'prabirshrestha/async.vim'
    Plug 'morhetz/gruvbox'
    Plug 'jackguo380/vim-lsp-cxx-highlight'
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
set t_Co=256

let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_invert_selection = "0"
colorscheme gruvbox
"colorscheme NeoSolarized

" Additional option in cale in system is too old version of node -> link
" manualy recompile one
" let g:coc_node_path = "/home/p.las2/TOOLS/node-v10.12.0/out/Release/node"

set background=dark
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set number
set clipboard=unnamedplus
set tabstop=8
set softtabstop=0
set expandtab 
set shiftwidth=4 
set smarttab
set exrc
set secure
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set signcolumn=yes

"Auto braces completition
set autoindent
set smartindent

"Highlight cursor line
set cursorline
highlight CursorLine cterm=NONE ctermbg=darkgray
"Enable cursor on mouse
set mouse=a
" set auto change directory to current buffer
" set autochdir

" set colorcolumn=120 
highlight darkgray ctermbg=darkgray
highlight Normal ctermfg=gray

"Highlight line longer than colorcolumn size
highlight ColorColumn ctermbg=NONE
highlight OverLength ctermbg=NONE cterm=bold
match OverLength /\%81v.\+/

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
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }
let g:NERDTreeChDirMode = 2


" mapleader to space
let mapleader = " "

"UndoTree config
let g:undotree_WindowLayout = 2

" Remaps for UndoTree
"nnoremap <leader>ut :UndotreeToggle<CR> 
nnoremap <leader>uf :UndotreeFocus<CR>


" Remaps for NerdCommenter
nnoremap <leader>c :call NERDComment(0,"toggle")<CR> 
vnoremap <leader>c :call NERDComment(0,"toggle")<CR>

let g:undoTree_enabled = 0
let g:nerdTree_enabled = 0
" if NERDTree opened and call 
function! ShowUndoTree()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
       execute ':NERDTreeToggle'
       let g:nerdTree_enabled = 1
    endif
    
    execute ':UndotreeShow'
    let g:undoTree_enabled = 1
endfunction

function! ToggleUndoTree()
    if g:undoTree_enabled == 0
        call ShowUndoTree()
    else
        execute ':UndotreeHide'
        let g:undoTree_enabled = 0
        if g:nerdTree_enabled == 1
            execute ':NERDTreeToggle'
        endif
    endif
endfunction

function! ToggleNerdTree()
    if g:undoTree_enabled == 1
        execute ':UndotreeHide'
        let g:undoTree_enabled = 0
    endif
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        let g:nerdTree_enabled = 1
    else
        let g:nerdTree_enabled = 0
        execute ':NERDTreeFind'
        return
    endif
    execute ':NERDTreeToggle'

endfunction

nnoremap <leader>ut :call ToggleUndoTree()<CR>
nnoremap <leader>nt :call ToggleNerdTree()<CR>
" Remaps for NerdTree 
" nt - nertdtree toggle

" CoC remaps and configs
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)"
nnoremap <leader>cr :CocRestart
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Use h to show documentation in preview window
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>
" Set rr to rename
nnoremap <leader>rr <Plug>(coc-rename)
" Set ff to search
nnoremap <leader>ff :CocSearch <C-R>=expand("<cword>")<CR><CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" set rip grep root folder (if find file/direcotry [compile_commands.json/.git] treat it as root)
let g:rg_root_types = ['compile_commands.json', '.git']

" FZF add preview window      
let g:fzf_preview_window = 'right:60%' 
let g:fzf_preview_use_dev_icons = 0

let g:fzf_rg_color = 'fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f,info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
" FZF mapping
nnoremap <leader>f :BLines  
nnoremap <S-f> :RgAdv 
nnoremap <A-f> :Files<CR>
nnoremap <A-b> :Buffers<CR>

command! -bang -nargs=* RgAdvOld
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case -- '. (len(<q-args>) > 0 ? <q-args> : expand('<cword>')), 1,
            \   fzf#vim#with_preview(g:fzf_preview_window), <bang>0)

command! -bang -nargs=* RgAdv
            \ call fzf#vim#grep(
            \   'grep -rni -- '. (len(<q-args>) > 0 ? <q-args> : expand('<cword>')), 1,
            \   fzf#vim#with_preview(g:fzf_preview_window), <bang>0)
" vim swithing buffers
nnoremap <Tab> :bn <CR> 
nnoremap <S-Tab> :bp <CR> 

" Make <leader>+m to go to matchin pairs
nnoremap <leader>m <S-%>
vnoremap <leader>m <S-%>

" Map yank (copy) command to copy data into vim and clipboard buffer
set clipboard+=unnamedplus
" Go outside braces or other pair
" at first disable default mapping
" let g:AutoPairsJump = ''
"inoremap <buffer> <silent> <C-l> <ESC>:call AutoPairsJump()<CR>a

" ctrl+l go to matchin pair
inoremap <silent> <C-l> <ESC>:call AutoPairsJump()<CR>a

" alt+l go to the end of line
inoremap <M-l> <ESC>$a
nnoremap <M-l> $

" alt+h go to the beginning of line
inoremap <M-h> <ESC>0i
nnoremap <M-h> 0

" Set alt enter to go to new line while in insert mode
inoremap <silent> <M-CR> <ESC>$o

" Open horizontal bottom terminal
nnoremap <silent> <leader>t :belowright split term://bash<CR>i
" Open terminal in current file directory
nnoremap <silent> <S-t> :belowright split term://bash -c 'cd %:p:h; exec bash'<CR>i
" leader+q close current buffer
nnoremap <silent> <leader>q :bw <CR>

" add showing differnce in non saved file
nnoremap <leader>diff :w !diff % -<CR>

" insert tab into selection
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" highligh variables under cursor
:autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))


" show jump list and select which one to go to
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

nmap <leader>j :call GotoJump()<CR>
