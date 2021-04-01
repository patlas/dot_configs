call plug#begin('~/.config/nvim/autoloadNew/plugged')
    Plug 'neovim/nvim-lsp'
    Plug 'neovim/nvim-lspconfig'
    Plug 'anott03/nvim-lspinstall'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

    Plug 'nvim-lua/completion-nvim'
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
    Plug 'm-pilia/vim-ccls'

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
set updatetime=1000
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
set wrap
set linebreak
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
highlight Normal ctermfg=blue
"highlight Normal ctermfg=gray

"Highlight line longer than colorcolumn size
highlight ColorColumn ctermbg=NONE
highlight OverLength ctermbg=NONE cterm=bold
match OverLength /\%81v.\+/


"VIM-AIRLINE extension for status bar (top, bottom)
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#show_buffers = 1


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

" Remaps for NerdTree 
" nt - nertdtree toggle
nnoremap <leader>ut :call ToggleUndoTree()<CR>
nnoremap <leader>nt :call ToggleNerdTree()<CR>

" Call hierarchy CCLS
let g:yggdrasil_no_default_maps = 1
let g:ccls_log_file = expand('~/Desktop/my_log_file.txt')

let g:ccls_levels = 1 

let g:ccls_size = 50
let g:ccls_position = 'botright'
let g:ccls_orientation = 'horizontal'

let g:ccls_float_width = 50
let g:ccls_float_height = 20

nnoremap <silent> <buffer><leader>o    <Plug>(yggdrasil-toggle-node)


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

command! -bang -nargs=* RgAdv
            \ call fzf#vim#grep(
            \   'rg -g "!bt/**" --column --line-number --no-heading --color=always --smart-case -- '. (len(<q-args>) > 0 ? <q-args> : expand('<cword>')), 1,
            \   fzf#vim#with_preview(g:fzf_preview_window), <bang>0)

command! -bang -nargs=* RgAdvOld
            \ call fzf#vim#grep(
            \   'grep -rni -- '. (len(<q-args>) > 0 ? <q-args> : expand('<cword>')), 1,
            \   fzf#vim#with_preview(g:fzf_preview_window), <bang>0)
" vim swithing buffers using Tab
nnoremap <Tab> :bn <CR> 
nnoremap <S-Tab> :bp <CR> 
" set ctrl+b to switch previous buffer
nnoremap <C-b> :b# <CR>
" leader+q close current buffer
nnoremap <leader>q :bw <CR>

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

" set ctrl p to past in insermode
inoremap <silent> <C-p> <ESC>pa
nnoremap <silent> <C-p> :pu<CR>

" Open horizontal bottom terminal
nnoremap <silent> <leader>t :belowright split term://bash<CR>i
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


" split current buffer vertically
" nnoremap <C-s> :Vsb
" command -nargs=1 Vsb call VerticalBufferSplit(<f-args>)

" let current_buffer_nr = bufnr("%")
nnoremap <C-s> :call VerticalBufferSplit(bufnr("%"))<CR> 

function VerticalBufferSplit (arg1)
  execute 'vert sb' a:arg1
endfunction


set completeopt-=preview
set completeopt=menuone,noinsert,noselect
let g:completition_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <silent><TAB> <C-n>
"inoremap <silent><S-TAB> <C-p>
" First call omnicomp lsp second completition-nvim plugin
" inoremap <silent><C-Space>      <cmd>lua vim.lsp.buf.completion()<CR>
imap <silent> <C-Space> <Plug>(completion_trigger)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

"use omni completion provided by lsp
"TODO consider if for python instead of C/C++?
" autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

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
autocmd CursorHold * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))

lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach_vim = function(client)
    require'completion'.on_attach(client)
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Enable underline, use default values
        underline = true,
        -- Enable virtual text, override spacing to 4
        virtual_text = {
        spacing = 4,
        prefix = '~',
        },
        -- Use a function to dynamically turn signs off
        -- and on, using buffer local variables
        signs = function(bufnr, client_id)
        local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
        -- No buffer local variable set, so just enable by default
        if not ok then
            return true
        end

        return result
        end,
        -- Disable a feature
        update_in_insert = false,
    }
)

-- Clangd SETUP
-- require'lspconfig'.clangd.setup{on_attach=on_attach_vim}

-- CCLS SETUP
require'lspconfig'.ccls.setup{
    on_attach=on_attach_vim,
    init_options = {
       highlight = {
            lsRanges = true;
        }
    }
}
-- JEDI (python)
require'lspconfig'.jedi_language_server.setup{on_attach=require'completion'.on_attach}

-- MAPPING FOR lsp command (nice window with preview)
vim.lsp.callbacks['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.callbacks['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.callbacks['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.callbacks['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.callbacks['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.callbacks['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.callbacks['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.callbacks['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

EOF
