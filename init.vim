set encoding=UTF-8
set termguicolors

set signcolumn=no

" map <leader> to ò
let mapleader = "ò"

" enable relative line numbers
set number
set relativenumber

" 8 spaces tabs
set list
set listchars=tab:<->,space:·
autocmd FileType * set tabstop=8 shiftwidth=8 expandtab

set winborder=rounded

" plugins
call plug#begin('~/.config/nvim/plugins')
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'd-Qw4w9WgXc-Q/vim-scarpet'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'd-Qw4w9WgXc-Q/nvim-soil-kitty'
Plug 'kylechui/nvim-surround'
Plug 'elihunter173/dirbuf.nvim'
Plug 'rafamadriz/friendly-snippets'
Plug 'onsails/lspkind.nvim'
Plug 'lukas-reineke/headlines.nvim'
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
nnoremap <silent> <leader>bp :BufferLineCyclePrev<cr>
nnoremap <silent> <leader>bn :BufferLineCycleNext<cr>
nnoremap <silent> <leader>bc :BufferLinePickClose<cr>
nnoremap <silent> <leader>bN :BufferLineMoveNext<cr>
nnoremap <silent> <leader>bP :BufferLineMovePrev<cr>
nnoremap <silent> <leader>b1 :BufferLineGoToBuffer 1<cr>
nnoremap <silent> <leader>b2 :BufferLineGoToBuffer 2<cr>
nnoremap <silent> <leader>b3 :BufferLineGoToBuffer 3<cr>
nnoremap <silent> <leader>b4 :BufferLineGoToBuffer 4<cr>
nnoremap <silent> <leader>b5 :BufferLineGoToBuffer 5<cr>
nnoremap <silent> <leader>b6 :BufferLineGoToBuffer 6<cr>
nnoremap <silent> <leader>b7 :BufferLineGoToBuffer 7<cr>
nnoremap <silent> <leader>b8 :BufferLineGoToBuffer 8<cr>
nnoremap <silent> <leader>b9 :BufferLineGoToBuffer 9<cr>
nnoremap <silent> <leader>b9 :BufferLineGoToBuffer 9<cr>

nnoremap <silent> <leader>n :NERDTree<cr>

nnoremap <silent> <leader>p :CtrlPClearCache<cr>

nnoremap <silent> gd :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> K  :lua vim.lsp.buf.hover()<cr>

lua require('config')
