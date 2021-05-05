call plug#begin('~/.vim/plugged')

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

Plug 'ntpeters/vim-better-whitespace'

call plug#end()


" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Highlight if column exceeds 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" add a grey column ruler
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" tags
:syntax on

" fzf
nmap <C-p> :GFiles<CR>

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" move to left buffer
map  <C-Left>   <C-w><Left>
map! <C-Left>   <Esc> <C-w><Left>
" move to right buffer
map  <C-Right>  <C-w><Right>
map! <C-Right>  <Esc> <C-w><Right>
" move to buffer above
map  <C-Up>     <C-w><Up>
map! <C-Up>     <Esc> <C-w><Up>
" move to buffer below
map  <C-Down>   <C-w><Down>
map! <C-Down>   <Esc> <C-w><Down>

" highlight search
set hlsearch
:noremap <F4 :set hlsearch! hlsearch?<CR>
