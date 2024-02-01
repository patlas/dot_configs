"sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


call plug#begin('~/.config/nvim/autoloadNew/plugged')
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
" Plug 'anott03/nvim-lspinstall'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" Plug 'p00f/clangd_extensions.nvim'
"    Plug 'prabirshrestha/vim-lsp'
"    Plug 'prabirshrestha/asyncomplete.vim'
"    Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Plug 'nvim-lua/completion-nvim'
Plug 'scrooloose/NERDTree'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
"OLD VIM-CCLS
" Plug 'm-pilia/vim-ccls'
Plug 'ranjithshegde/ccls.nvim' 
Plug 'folke/lsp-colors.nvim'
" Modern coloring for C/C++
Plug 'bfrg/vim-cpp-modern'
" Plug 'puremourning/vimspector' <--- uncomment if debugger required
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }


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

"set nocompatible
set background=dark
set hidden
set cmdheight=2
set updatetime=1000
set shortmess+=c
set number
" set relativenumber
set clipboard=unnamedplus
set tabstop=8
set softtabstop=0
set expandtab 
set shiftwidth=4 
set smarttab
set exrc
set secure
set wrap
set linebreak
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=1
set signcolumn=yes
set diffopt+=iwhite,icase "ignore whitespaces and case in diff mode

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
highlight Normal ctermfg=blue
"highlight Normal ctermfg=gray

"Highlight line longer than colorcolumn size
"highlight ColorColumn ctermbg=NONE
"highlight OverLength ctermbg=NONE cterm=bold
"match OverLength /\%81v.\+/


"VIM-AIRLINE extension for status bar (top, bottom)
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_section_z='%3p%% ☰ %l/%L:%v'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = '☰'
" let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" let g:airline_symbols.readonly = ''

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''


"set NerdTree directory root to terminal one
let g:NERDTreeChDirMode = 2

"set NerdTree more pretty
" minimal UI disable info that '?' open help menu
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

"Set config for NERDcommenter
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }
let g:NERDTreeChDirMode = 2
let g:NERDTreeMapToggleFiles = 'Q' "disable <SHIFT>f to toggle files -> used by regex


" mapleader to space
let mapleader = " "

"Make basic movements work better with wrapped lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

"Move in insert mode using CTRL+hjkl
let g:AutoPairsMapCh = 0 " disable AutoPair mapping C-H
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

"UndoTree config
let g:undotree_WindowLayout = 2

" Remaps for UndoTree
"nnoremap <leader>ut :UndotreeToggle<CR> 
nnoremap <leader>uf :UndotreeFocus<CR>


" Remaps for NerdCommenter
nnoremap <leader>c :call nerdcommenter#Comment('n',"toggle")<CR> 
vnoremap <leader>c :call nerdcommenter#Comment('x',"toggle")<CR>

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

" Remaps for NerdTree 
" nt - nertdtree toggle
nnoremap <leader>ut :call ToggleUndoTree()<CR>
nnoremap <leader>nt :call ToggleNerdTree()<CR>

" Call hierarchy CCLS
" let g:ccls_log_file = expand('~/CclsLogs.txt')
" let g:yggdrasil_no_default_maps = 1
" au FileType yggdrasil nmap <silent> <buffer> <C-k> <Plug>(yggdrasil-toggle-node)
"let g:ccls_log_file = expand('~/Desktop/my_log_file.txt')
let g:ccls_levels = 5

let g:ccls_size = 50
let g:ccls_position = 'botright'
let g:ccls_orientation = 'horizontal'

let g:ccls_float_width = 50
let g:ccls_float_height = 20

" VimSpector
let g:vimspector_enable_mappings = 'HUMAN'

" nnoremap <silent> <buffer><leader>o <Plug>(yggdrasil-toggle-node)


" set rip grep root folder (if find file/direcotry [compile_commands.json/.git] treat it as root)
let g:rg_root_types = ['compile_commands.json', '.git']
let g:fzf_command_prefix = "Fzf"

" FZF add preview window      
let g:fzf_preview_window = 'right:60%:nowrap' 
let  g:fzf_preview_window_new = {'options': ['--delimiter=/', '--with-nth=3']} 
let  g:fzf_preview_window1 = {'options': ['--delimiter=:', '--with-nth=5']} 
let g:fzf_preview_use_dev_icons = 0

let g:fzf_rg_color = 'fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f,info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
" FZF mapping
nnoremap <leader>f :FzfBLines  
nnoremap <leader>m <S-%>
nnoremap <S-f> :RgProj 
nnoremap <C-f> :RgProjAdv 

nnoremap <A-f> :FzfFiles<CR>
nnoremap <A-b> :FzfBuffers<CR>

" find in matching braces
nnoremap <leader>ff v%<Esc>/\%V

" TODO: Implement a program that shortens the path in each line
let transformer = "| awk -F: 'BEGIN { OFS = FS } {$3 = $3 \":\" $2; print}'"

command! -bang -nargs=* RgAdvAll1
            \ call fzf#vim#grep(
            \   "rg --column --line-number --no-heading --color=always --smart-case "..shellescape(<q-args>)..transformer,
            \   1,
            \   { 'options': '--delimiter=: --with-nth=4..' },
            \   fzf#vim#with_preview(g:fzf_preview_window), <bang>0)

function! PrepareSkipRg()
    let retString = ''
    for item in split(get(g:,"skip",""))
        " retString = retString.' -g "!'.item.'"'
        let retString = retString.' -g "!'.item.'"'
    endfor

    return retString
endfunction

command! -bang -nargs=* RgProj
            \ call fzf#vim#grep(
            \   'rg --glob-case-insensitive '.(PrepareSkipRg()).' --line-number -H --no-heading --color=always --smart-case -F -- '. (len(<q-args>) > 0 ? <q-args> : expand('<cword>')).' '.(get(g:, "vccbws", ".")), 1,
            \   fzf#vim#with_preview(g:fzf_preview_window), <bang>0)

command! -bang -nargs=* RgProjAdv
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case -F -- '. (len(<q-args>) > 0 ? <q-args> : expand('<cword>')).' '.(get(g:, "pws", ".")), 1,
            \   fzf#vim#with_preview(g:fzf_preview_window), <bang>0)


" TODO TESTY
"
" :g//
"
" wyswietla wszystkie linie z pliku ktore pasuja do ostatniego wyszukiwania
"
" :g//z#=5 - wyswietla te linie z 5liniowym kontekstem
"
" :/\[[TR]X\]/ - wyszukuje pierwszy komunikat w logu
" :g// - wyswietla wszystkie komunikaty w logu

" require("ccls").callHierarchy(callee)
" command! Patlas call fzf#run({'sink': function(':CclsIncomingCallsHierarchy')})

" vim swithing buffers using Tab
nnoremap <Tab> :bn <CR> 
nnoremap <S-Tab> :bp <CR> 
" set ctrl+b to switch previous buffer
nnoremap <C-b> :b# <CR>
" leader+q close current buffer
nnoremap <leader>q :bw <CR>
" nnoremap <leader>q :q <CR>

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
" inoremap <silent> <C-l> <ESC>:call AutoPairsJump()<CR>a

" alt+l go to the end of line
inoremap <M-l> <ESC>$a
nnoremap <M-l> $

" alt+h go to the beginning of line
inoremap <M-h> <ESC>^i
nnoremap <M-h> ^

" Set alt enter to go to new line while in insert mode
inoremap <silent> <M-CR> <ESC>$o

" set ctrl p to past in insermode
inoremap <silent> <C-p> <ESC>pa
nnoremap <silent> <C-p> :pu<CR>

" Open horizontal bottom terminal
nnoremap <silent> <leader>t :let @+ = expand('%:p')<CR>:belowright split term://bash<CR>i
" Open terminal in current file directory
nnoremap <silent> <S-t> :belowright split term://bash -c 'cd %:p:h; exec bash'<CR>i
" set ctrl+'.' to increase split window size by 10
"nnoremap <C-m> :vertical resize +10 <CR>
" set ctrl+',' to decrease split window size by 10
"nnoremap <C-n> :vertical resize -10 <CR>
" add showing differnce in non saved file
nnoremap <leader>diff :w !diff % -<CR>

" insert tab into selection
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" highligh variables under cursor
":autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
" nnoremap <C-h> :RgAdvAll - uzyc jako podkreslenie 

" show jump list and select which one to go to

" DEPRECATED - currently use fzf-preview plugin
" function! GotoJump()
"     jumps
"     let j = input("Please select your jump: ")
"     if j != ''
"         let pattern = '\v\c^\+'
"         if j =~ pattern
"             let j = substitute(j, pattern, '', 'g')
"             execute "normal " . j . "\<c-i>"
"         else
"             execute "normal " . j . "\<c-o>"
"         endif
"     endif
" endfunction
" nmap <leader>j :call GotoJump()<CR>
"
nmap <leader>j :FzfPreviewJumpsRpc<CR>

" let current_buffer_nr = bufnr("%")
nnoremap <C-s> :call VerticalBufferSplit(bufnr("%"))<CR> 

function VerticalBufferSplit (arg1)
    execute 'vert sb' a:arg1
endfunction

" Avoid showing message extra message when using completion
set shortmess+=c


" some shortcuts
nnoremap <silent> <leader>gs    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>h     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>sh     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>s    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>w    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

nnoremap <silent> <leader>1    <cmd>lua vim.lsp.buf.incoming_calls()<CR>

nnoremap <silent> <leader>2    <cmd>vim.lsp.buf.outgoing_calls()<CR>


" highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green
" autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
" autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
" autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()

" highligh variables under cursor
" :autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
"autocmd CursorHold * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))

nnoremap <silent> <leader>hh <cmd> exe printf('match IncSearch /\<%s\>/', expand('<cword>'))<CR>
nnoremap <silent> <leader>he <cmd> exe printf('match IncSearch asdfasdf')<CR>


" source workspace config if exists
:if !empty(glob(".vimws"))
:   source .vimws
:endif

" open project startup file if set and other file not requested
:if @% == ""
:execute 'edit' g:startupfile
:endif

if has('wsl')
    let g:clipboard = {
                \   'name': 'wslclipboard',
                \   'copy': {
                    \      '+': 'win32yank.exe -i --crlf',
                    \      '*': 'win32yank.exe -i --crlf',
                    \    },
                    \   'paste': {
                        \      '+': 'win32yank.exe -o --lf',
                        \      '*': 'win32yank.exe -o --lf',
                        \   },
                        \   'cache_enabled': 1,
                        \ }
endif

" VIM-CPP-Modern coloring
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" Load my modules
:lua require('myModules')
