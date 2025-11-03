"       _
"__   _(_)_ __ ___  _ __ ___
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__
"  \_/ |_|_| |_| |_|_|  \___|

" OPTIONS ----------------------------------------------------------------------
set rnu nu
set hlsearch ignorecase smartcase
set splitbelow splitright
set nowrap
set scrolloff=8 sidescrolloff=8
set showtabline=2

" Spellchecking & Writing
set spelllang=en_gb
set nospell
autocmd BufNewFile,BufRead *.md   set tw=80 spell
autocmd BufNewFile,BufRead *.txt  set tw=80 spell
autocmd BufNewFile,BufRead *.tex  set tw=80 spell
autocmd BufNewFile,BufRead *.todo set tw=80 spell

aunmenu PopUp.How-to\ disable\ mouse
aunmenu PopUp.-2-

" COMMANDS ---------------------------------------------------------------------
command! MakeTags !ctags -R .

" KEYBINDS ---------------------------------------------------------------------
let mapleader = " "

noremap U :redo<CR>
noremap Q @

inoremap ii <Esc>
noremap <leader>t :term<CR>
noremap <leader>m :MinimapToggle<CR>

noremap <leader>fm :Ranger<CR>
noremap <leader>ft :NERDTreeToggle<CR>
noremap <leader>vtc :VimtexCompile<CR>
let NERDTreeMinimalUI=1

noremap j gj
noremap k gk

noremap <C-e> $
noremap <C-a> ^

noremap gtc :tabnew<CR>
noremap gtx :tabclose<CR>
noremap gtn :tabnext<CR>
noremap gtp :tabprevious<CR>

" tnoremap <Esc> <C-\><C-n>:q!<CR>

" use Space + n to toggle the line number counting method
function! g:ToggleNuMode()
    if &nu == 1
        set nonu   " turn off nu
        set rnu
    else
        set nornu   " turn off rnu
        set nu
	endif
endfunction
nnoremap <silent><leader>n :call g:ToggleNuMode()<CR>

nnoremap ,html :-1read $HOME/.vim/templates/skeleton.html<CR>3jwf>a

" PLUGINS ----------------------------------------------------------------------
call plug#begin()

" Library of Lua functions
Plug 'nvim-lua/plenary.nvim'

" Syntax highlighting plugin
Plug 'nvim-treesitter/nvim-treesitter'

" Automatic pairs or bracets, quotes, etc.
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutToggle = 'gp'

" File tree plugin
Plug 'preservim/nerdtree'
let NERDTreeShowHidden=1
" autocmd VimEnter * NERDTree | wincmd p				" Open NERDTree when opening Vim, close Vim if only Nerdtree is open
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Shows indentation levels
Plug 'lukas-reineke/indent-blankline.nvim'

" Makes filetree look cooler
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Code minimap
Plug 'severin-lemaignan/vim-minimap'

" Open Ranger with :Ranger
Plug 'francoiscabrol/ranger.vim'

" Colorizer plugin
Plug 'lilydjwg/colorizer'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Shows changes between local and repository
Plug 'airblade/vim-gitgutter'

" Better comments
Plug 'numToStr/Comment.nvim'

" Rainbow brackets
Plug 'HiPhish/rainbow-delimiters.nvim'

" Zen Mode Package
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
noremap <leader>z :Goyo<CR>

" LaTeX autocompile
Plug 'lervag/vimtex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_version_check = 0

" tmux integration
Plug 'christoomey/vim-tmux-navigator'

" Colourscheme
Plug 'dylanaraps/wal.vim'

Plug 'Julian/lean.nvim'

call plug#end()

lua << EOF
require('Comment').setup()
require('ibl').setup()
require('lean').setup{ mappings = true }
EOF

" COLOURS ----------------------------------------------------------------------
colorscheme wal

" OPTIONS 2 --------------------------------------------------------------------
set tabstop=4
set shiftwidth=4
set expandtab
