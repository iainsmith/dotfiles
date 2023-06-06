
filetype plugin indent on
set colorcolumn=80

syntax enable

highlight ColorColumn ctermbg=0 guibg=lightgrey

" automatically resize windows on vim resize
autocmd VimResized * :wincmd =

" Leader mapping
let mapleader = " " " map leader to Space

noremap ; :
nnoremap <leader>0 :NvimTreeToggle<CR>
nnoremap <C-j> :NvimTreeFindFile<CR>
nnoremap <leader>o :GitFiles<CR>
nnoremap <leader>O :Files<CR>
nnoremap <leader>k :Commands<CR>
nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>vr :source $MYVIMRC<CR>
nnoremap <Leader>x :q<CR>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

nnoremap <leader>\ :vsplit<cr>
nnoremap <leader>- :split<cr>

tnoremap <Esc> <C-\><C-n>

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
  Plug 'pbrisbin/vim-mkdir'

  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-obsession'

  Plug 'EdenEast/nightfox.nvim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

    " https://github.com/williamboman/mason-lspconfig.nvim
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'

  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-tree/nvim-tree.lua'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'

  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'mhinz/vim-rfc'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

  Plug 'christoomey/vim-tmux-navigator'
call plug#end()

set completeopt=menu,menuone,noselect

if (has("termguicolors"))
 set termguicolors
endif

colorscheme nightfox

" Vim Script
let g:lightline = {'colorscheme': 'nightfox'}
let g:airline_symbols_ascii = 1

lua <<EOF
 path = os.getenv( "HOME" )
 path = path .. "/.config/nvim/?.lua"
 path = ";" .. path
 package.path = package.path .. path
 require('lua.init')
EOF
