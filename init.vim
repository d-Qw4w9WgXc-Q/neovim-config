set encoding=UTF-8
set termguicolors

" map <leader> to ò
let mapleader = "ò"

" enable relative line numbers
set number
set relativenumber

" 8 spaces tabs
set list
set listchars=tab:<->,space:·
autocmd FileType * set tabstop=8 shiftwidth=8 expandtab


" plugins
call plug#begin('~/.config/nvim/plugins')
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'romgrk/doom-one.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'd-Qw4w9WgXc-Q/vim-scarpet'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()

" enable the color scheme
colorscheme doom-one

" airline theme
let g:airline_theme='base16_ashes'
let g:airline_extensions = []

" turn \ in haskell lambdas into an actual lambda character
au BufEnter,BufNew *.hs syntax match haskellLambdaChar '\\' cchar=λ
au BufEnter,BufNew *.hs syntax match haskellLambda '\(\zs\\\ze\)\([a-z] \)\+ *->' contains=haskellLambdaChar conceal
highlight Conceal NONE
highlight link Conceal Keyword
set conceallevel=2
set concealcursor=nvci


let g:NERDCustomDelimiters = { 'c': { 'left': '// ','right': '' }, 'lua': {'left': '--', 'right': ''}}


let g:cpp_member_highlight = 1

" keybindings
nnoremap <silent> <leader>bp :BufferPrevious<cr>
nnoremap <silent> <leader>bn :BufferNext<cr>
nnoremap <silent> <leader>bc :BufferClose<cr>
nnoremap <silent> <leader>bN :BufferMoveNext<cr>
nnoremap <silent> <leader>bP :BufferMovePrevious<cr>
nnoremap <silent> <leader>b1 :BufferGoto 1<cr>
nnoremap <silent> <leader>b2 :BufferGoto 2<cr>
nnoremap <silent> <leader>b3 :BufferGoto 3<cr>
nnoremap <silent> <leader>b4 :BufferGoto 4<cr>
nnoremap <silent> <leader>b5 :BufferGoto 5<cr>
nnoremap <silent> <leader>b6 :BufferGoto 6<cr>
nnoremap <silent> <leader>b7 :BufferGoto 7<cr>
nnoremap <silent> <leader>b8 :BufferGoto 8<cr>
nnoremap <silent> <leader>b9 :BufferGoto 9<cr>
nnoremap <silent> <leader>b9 :BufferGoto 9<cr>

nnoremap <silent> <leader>n :NERDTree<cr>

nnoremap <silent> <leader>ff :CtrlP<cr>
nnoremap <silent> <leader>fb :CtrlPBuffer<cr>
nnoremap <silent> <leader>fa :CtrlPMixed<cr>

nnoremap <silent> gd :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> K  :lua vim.lsp.buf.hover()<cr>

lua require('config')
