syntax on
inoremap jk <esc>
set number relativenumber
set list
set tabstop=2
set listchars=tab:»\ ,space:·,nbsp:☠,trail:•,eol:¶
highlight LineNr ctermfg=grey
call plug#begin('~/.vim/plugged')
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'zhaocai/GoldenView.Vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
